class PowerGeneratorService
  attr_reader :power_generators, :params

  def initialize(params)
    @params = params
  end

  def all_power_generators
    @search = params['search']
    @search_for_select = params['search_for_select']
    @keyword = params['keyword']
    @power_generators = PowerGenerator.all
    simple_search if @search.present?
    if  @search_for_select.present?
      @keyword = params['keyword']
      advanced_search
    end
    @power_generators = Kaminari.paginate_array(@power_generators).page(params[:page]).per(6)
  end

  def simple_search
    @power_generators = PowerGenerator.all.where('name LIKE :search or description LIKE :search', search: @search)
  end

  def advanced_search
    @power_generators =  @power_generators.where(manufacturer: params[:keyword]) if params[:search_for_select] == 'manufacturer'
    @power_generators =  @power_generators.where(structure_type: params[:keyword]) if params[:search_for_select] == 'structure_type'
    @power_generators =  @power_generators.where(kwp: params[:keyword]) if params[:search_for_select] == 'kwp'
    @power_generators =  @power_generators.where(price: params[:keyword]) if params[:search_for_select] == 'price'
  end

  def specific_power_generator
    @power_generator = PowerGenerator.find(params[:id])
  end

  private
    def power_generators_params
      params.require(:power_generators).permit(:name)
    end
end
