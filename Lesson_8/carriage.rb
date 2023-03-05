# frozen_string_literal: true

class Carriage
  attr_reader :type, :max_units, :filled_units

  def initialize(type, max_units)
    @type = type
    @max_units = max_units
    @filled_units = 0
  end

  def fill
    raise ArgumentError, 'Вагон заполнен' if @max_units.zero?

    @max_units -= 1
    @filled_units += 1
  end
end
