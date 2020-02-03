class PowerGeneratorService
  attr_reader :power_generators, :params

  def initialize(params)
    @params = params
  end

  def all_power_generators
    @search = params['search']
    @power_generators = PowerGenerator.all
    full_search if @search.present?
    @power_generators = Kaminari.paginate_array(@power_generators).page(params[:page]).per(6)
  end

  def full_search
    @power_generators = PowerGenerator.all.where('name LIKE :search or description LIKE :search', search: @search)
  end

  private
    def power_generators_params
      params.require(:power_generators).permit(:name)
    end
end
