class PowerGeneratorsController < ApplicationController
  def index
    @power_generators = PowerGeneratorService.new(params).all_power_generators
  end

  def show
    @power_generator = PowerGeneratorService.new(params).specific_power_generator
  end
end
