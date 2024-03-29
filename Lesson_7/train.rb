require_relative 'instance_counter'

class Train
  include InstanceCounter

  attr_reader :carriages, :number, :speed, :type, :station_position
  attr_accessor :current_station # возвращать / задать

  NUMBER_FORMAT = /^[а-яa-z0-9]{3}-?[а-яa-z0-9]{2}$/i
  ERROR = 'Допустимый формат: три буквы или цифры в любом порядке, необязательный дефис (может быть, а может нет) и еще 2 буквы или цифры после дефиса'

  @@trains = []

  def self.find(number)
    @@trains.each { |train| number == train.number }
  end

  def initialize(number, type)
    @speed = 0
    @number = number
    @route = nil
    @carriages = []
    @station_position = nil
    @type = type
    validate!

    @@trains << self
    register_instance
  end

  def validate!
    raise RegexpError, ERROR if @number !~ NUMBER_FORMAT
  end

  def valid?
    validate!
    true
  rescue RegexpError
    false
  end

  def increase_speed(speed)
    @speed = speed
  end

  def stop
    @speed = 0
  end

  def add_carriage(carriage)
    @carriages << carriage if @speed == 0
  end

  def delete_carriage(index)
    @carriages.delete_at(index) if @speed == 0
  end

  # Может принимать маршрут следования (объект класса Route)
  def set_route(route)
    @route = route
    @station_position = 0

    @route.stations[@station_position].add_train(self)
  end

  def go_to_next_station
    @station_position += 1 if @station_position < @route.stations.length - 1
  end

  def go_to_prev_station
    if @station_position < 0 || @station_position == @route.stations.length
      puts 'Поезд cтоит на крайней станции, движение назад запрещено!'
    else
      @station_position -= 1
      puts "Поезд на станции - #{@route.stations[@station_position]}"
    end
  end

  def prev_station
    @route.stations[@station_position - 1] unless @route.nil?
  end

  def current_station
    @route.stations[@station_position] unless @route.nil?
  end

  def next_station
    @route.stations[@station_position + 1] unless @route.nil?
  end

  # Написать метод, который принимает блок и проходит по всем вагонам поезда, передавая каждый объект вагона в блок
  def get_carriages
    @carriages.each_with_index { |carriage, index| yield(carriage, index + 1) } if block_given?
  end
end
