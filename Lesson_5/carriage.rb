require_relative 'company'

class Carriage
  include Company

  attr_reader :type, :number

  def initialize(type, number)
    @type = type
    @number = number
  end
end
