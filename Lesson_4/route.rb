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

  def delete_station(station)
    @stations.delete(station) if @stations.include?(station)
  end
end
