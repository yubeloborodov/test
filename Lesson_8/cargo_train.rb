# frozen_string_literal: true

require_relative 'train'
require_relative 'types'

class CargoTrain < Train
  def initialize(number, type)
    super(number, TYPES[type])
  end

  def add_carriage(carriage)
    super(carriage) if carriage.type == @type
  end
end
