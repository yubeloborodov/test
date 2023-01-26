require_relative 'carriage'
require_relative 'types'

class PassengerCarriage < Carriage
  attr_reader :type, :number

  def initialize(type, number)
    super(type, number)
  end
end
