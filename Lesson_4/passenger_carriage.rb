class PassengerCarriage
  attr_reader :type

  def initialize(number)
    @number = number
    @type = 'Пассажирский'
  end
end
