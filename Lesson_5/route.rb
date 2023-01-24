# Класс Route (Маршрут):
# 1.Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
# 2.Может добавлять промежуточную станцию в список
# 3.Может удалять промежуточную станцию из списка
# 4.Может выводить список всех станций по-порядку от начальной до конечной
require_relative 'instance_counter'

class Route
  include InstanceCounter

  attr_reader :stations

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = [@first_station, @last_station]

    register_instance
  end

  def add_station(station)
    @stations.insert(1, station)
  end

  def delete_station(station)
    @stations.delete(station) if @stations.include?(station)
  end
end
