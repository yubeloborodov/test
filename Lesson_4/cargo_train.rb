require './train'

class CargoTrain < Train
  CARGO_TRAIN_TYPE = 'Грузовой'

  def initialize(number)
    super
    @type = CARGO_TRAIN_TYPE.downcase
  end

  def add_carriage(carriage)
    super(carriage) if carriage.type == @type
  end

  def delete_carriage
    super
  end
end
