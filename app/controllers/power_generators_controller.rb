class PowerGeneratorsController < ApplicationController
  def index
    @power_generators = PowerGeneratorService.new(params).all_power_generators
  end
end
