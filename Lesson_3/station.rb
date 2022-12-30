# 1.Имеет название, которое указывается при ее создании
# 2.Может принимать поезда (по одному за раз)
# 3.Может возвращать список всех поездов на станции, находящиеся в текущий момент
# 4.Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
# 5.Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).

class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    @trains << (train)
  end

  def drop_train(train)
    @trains.delete(train)
  end

  def trains_by_type
    # { 'грузовой': 0, 'пассажирский': 4 }
    trains_by_type = Hash.new(0)

    @trains.each do |train|
      trains_by_type[train.type] += 1
    end

    trains_by_type
  end

  def send_train(train)
    @trains.delete(train)
  end
end
