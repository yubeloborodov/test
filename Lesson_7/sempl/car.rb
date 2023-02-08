class Car
  attr_reader :current_rpm
  attr_accessor :number

  NUMBER_FORMAT = /^[а-я]{1}\d{3}[а-я]{2}$/i

  def initialize(number)
    @number = number
    @current_rpm = 0
    validate!
  end

  def validate!
    raise 'Number cant be nil' if number.nil?
    raise 'Number should be at least 6 symbols' if number.length < 6
    raise 'Number has invalid format' if number !~ NUMBER_FORMAT
  end

  def start_engine
    start_engine! if engine_stopped?
  end

  def engine_stopped?
    current_rpm.zero?
  end

  protected

  attr_writer :current_rpm

  def initial_rpm
    700
  end

  def start_engine!
    self.current_rpm = initial_rpm
  end
end
