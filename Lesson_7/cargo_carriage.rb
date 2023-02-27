require_relative 'carriage'
require_relative 'types'

class CargoCarriage < Carriage
  attr_reader :type, :number

  def initialize(max_units)
    @max_units = max_units
    validate!
    super(TYPES[1], max_units)
  end

  private

  def validate!
    raise ArgumentError, 'Не задан объем вагона' if @max_units.to_i <= 0
  end
end
