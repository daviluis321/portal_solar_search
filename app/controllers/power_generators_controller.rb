class PowerGeneratorsController < ApplicationController
  def index
    @power_generators = PowerGeneratorService.all_power_generators
  end
end
