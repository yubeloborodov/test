require_relative 'train'

class PassengerTrain < Train
  def initialize(number)
    super(number, TYPES[2])
  end

  def add_carriage(carriage)
    super(carriage) if carriage.type == @type
  end

  def delete_carriage
    super
  end
end
