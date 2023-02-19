require_relative 'carriage'
require_relative 'types'

class PassengerCarriage < Carriage
  attr_reader :type, :number

  def initialize(type, number, max_units)
    @max_units = max_units
    validate!
    super(type, number, max_units)
  end

  private

  def validate!
    raise ArgumentError, 'Не задано кол-во мест в вагоне' if @max_units.to_i <= 0
  end
end
