require_relative 'company'

class Carriage
  include Company

  attr_reader :type, :number, :max_units

  def initialize(type, number, max_units)
    @type = type
    @number = number
    @max_units = max_units
    @units = 0
  end

  def fill
    raise ArgumentError, 'Вагон заполнен' if @max_units == 0

    @units += 1
    @max_units -= 1
  end
end
