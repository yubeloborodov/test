require './train'

class PassengerTrain < Train
  PASSENGER_TRAIN_TYPE = 'Пассажирский'

  def initialize(number)
    super
    @type = PASSENGER_TRAIN_TYPE.downcase
  end

  def add_carriage(carriage)
    super(carriage) if carriage.type == @type
  end

  def delete_carriage
    super
  end
end
