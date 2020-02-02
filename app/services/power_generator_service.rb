class PowerGeneratorService
  attr_reader :power_generators, :params

  def initialize(params)
    @params = params
  end

  def all_power_generators
    @parameter = params[:search]
    PowerGenerator.page(params[:page]).per(6)
  end

  private
    def power_generators_params
      params.require(:power_generators).permit(:name)
    end
end
