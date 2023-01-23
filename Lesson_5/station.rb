# 1.Имеет название, которое указывается при ее создании
# 2.Может принимать поезда (по одному за раз)
# 3.Может возвращать список всех поездов на станции, находящиеся в текущий момент
# 4.Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
# 5.Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).

class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name.strip
    @trains = []
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
