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
  attr_reader :carriages, :number, :speed, :type, :station_position, :current_station

  def initialize(number, type)
    @speed = 0
    @number = number
    @route = nil
    @carriages = []
    @station_position = nil
    @type = type
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

  def delete_carriage
    @carriages.delete(@carriages.last) if @speed == 0
  end

  # Может принимать маршрут следования (объект класса Route)
  def set_route(route)
    @route = route
    @station_position = 0
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
end
