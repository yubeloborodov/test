require './base_train'

class CargoTrain < BaseTrain
  def initialize(number)
    super
    @type = 'Грузовой'
  end

  def add_carriage(carriage)
    super(carriage) if carriage.type == @type
  end

  def delete_carriage
    super
  end
end
