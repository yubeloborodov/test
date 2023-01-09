require './base_train'

class PassengerTrain < BaseTrain
  def initialize(number)
    super
    @type = 'Пассажирский'
  end
end
