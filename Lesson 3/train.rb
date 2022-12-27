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
    @speed = 0
    @carriage_amount = carriage_amount
    @station_position = nil
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

  # Может принимать маршрут следования (объект класса Route)
  def route(route)
    @route = route
    @station_position = 0
  end

  def add_train_to_station_list
    if (!@route) puts 'Cначала укажите маршрут следования'

    @route.stations[@current_station_position].accept_train(self)
  end

  def remove_train_from_station_list
    @current_station.send_train(self)
  end

  def next_station
    @route.stations[@station_position + 1] if @station_position < route.stations.length
  end

  def prev_station
    @route.stations[@station_position - 1] if @station_position > 0
  end
end
