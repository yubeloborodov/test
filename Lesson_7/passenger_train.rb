require_relative 'train'
require_relative 'types'

class PassengerTrain < Train
  def initialize(number, type)
    super(number, TYPES[type])
  end

  def add_carriage(carriage)
    super(carriage) if carriage.type == @type
  end

  def delete_carriage
    super
  end
end
