require_relative 'instance_counter'

class Station
  include InstanceCounter

  NAME_FORMAT = /[A-Я][a-я]*/

  attr_reader :name, :trains

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
    raise RegexpError, 'Допустимый формат для имени станции: только кириллица' if @name !~ NAME_FORMAT
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  def add_train(train)
    @trains << train

    # передаем текущую станцию в поезд для запоминания
    train.current_station = self
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

  # Написать метод, который принимает блок и проходит по всем поездам на станции передавая каждый поезд в блок
  # блок - аналог колбек функции
  def get_trains(&block)
    @trains.each(&block) if block_given?
  end
end
