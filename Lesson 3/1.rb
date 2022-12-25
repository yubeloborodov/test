# Класс Station (Станция):
# 1.Имеет название, которое указывается при ее создании
# 2.Может принимать поезда (по одному за раз)
# 3.Может возвращать список всех поездов на станции, находящиеся в текущий момент
# 4.Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
# 5.Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).

class Station
  attr_reader :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    @trains.push(train)
  end

  def drop_train(train)
    @trains.delete(train)
  end

  def trains_by_type
    [{ 'грузовой': 0, 'пассажирский': 4 }]
  end
end

# Класс Route (Маршрут):
# 1.Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
# 2.Может добавлять промежуточную станцию в список
# 3.Может удалять промежуточную станцию из списка
# 4.Может выводить список всех станций по-порядку от начальной до конечной

class Route
  attr_reader :stations

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @stations = [@start_station, @end_station]
  end

  def add_station(station)
    @stations.insert(1, station)
  end

  def drop_station(station)
    @stations.delete(station) if station != @start_station || station != @end_station
  end
end

# Класс Train (Поезд):
# 1.Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса
# 2.Может набирать скорость
# 3.Может возвращать текущую скорость
# 4.Может тормозить (сбрасывать скорость до нуля)
# 5.Может возвращать количество вагонов
# 6.Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
# 7.Может принимать маршрут следования (объект класса Route).
# 8.При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
# 9.Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
# 10.Возвращать предыдущую станцию, текущую, следующую, на основе маршрута

class Train
  attr_reader :speed, :carriage_amount

  def initialize(number, type, carriage_amount)
    @number = number
    @type = type
    @carriage_amount = carriage_amount
    @speed = 0
  end

  def increase_speed=(speed)
    @speed = speed
  end

  def stop
    @speed = 0
  end

  def add_carriage
    @carriage_amount += 1 if @speed == 0
  end

  def drop_carriage
    @carriage_amount -= 1 if @speed == 0
  end

  def route(route)
    @route = route
  end
end
