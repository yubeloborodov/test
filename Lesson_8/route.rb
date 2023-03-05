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

  def validate!
    raise ArgumentError, 'Не указаны first_station и last_station' if @first_station.nil? || @last_station.nil?
  end

  def valid?
    validate!
    true
  rescue ArgumentError
    false
  end

  def add_station(station)
    @stations.insert(1, station)
  end

  def delete_station(station)
    @stations.delete(station) if @stations.include?(station)
  end
end
