require_relative 'train'
require_relative 'types'

class CargoTrain < Train
  def initialize(number)
    super(number, TYPES[1])
  end

  def add_carriage(carriage)
    super(carriage) if carriage.type == @type
  end

  def delete_carriage
    super
  end
end
