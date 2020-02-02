module PowerGeneratorService
  class << self
    def all_power_generators
      PowerGenerator.all
    end
  end
end
