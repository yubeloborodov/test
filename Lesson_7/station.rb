# 1.Имеет название, которое указывается при ее создании
# 2.Может принимать поезда (по одному за раз)
# 3.Может возвращать список всех поездов на станции, находящиеся в текущий момент
# 4.Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
# 5.Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
require_relative 'instance_counter'

class Station
  include InstanceCounter

  attr_reader :name, :trains

  NAME_FORMAT = /[A-Я][a-я]*/

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name.strip
    @trains = []
    validate!

    @@stations << self
    register_instance
  end

  def validate!
    raise RegexpError, 'Допустииый формат для имени станции: только кириллица' if @name !~ NAME_FORMAT
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  def add_train(train)
    @trains << train
  end

  def delete_train(train)
    @trains.delete(train)
  end

  def count_trains_by_type(type)
    @trains.count { |train| train.type == type }
  end

  def trains_by_type(type)
    @trains.select { |train| train.type == type }
  end

  def send_train(train)
    @trains.delete(train)
  end
end
