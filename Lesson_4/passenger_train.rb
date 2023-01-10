require './base_train'

class PassengerTrain < BaseTrain
  def initialize(number)
    super
    @type = 'Пассажирский'
  end

  def add_carriage(carriage)
    super(carriage) if carriage.type == @type
  end

  def delete_carriage
    super
  end
end
