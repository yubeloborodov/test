require_relative 'company'

class Carriage
  include Company

  attr_reader :type, :number, :number_of_seats

  def initialize(type, number)
    @type = type
    @number = number
  end
end
