# frozen_string_literal: true

require_relative 'types'

class Mocks
  def self.init
    # Создаем станции
    Interface.stations << Station.new('ст. Начальная 1')
    2.times { |i| Interface.stations << Station.new("ст. Промежуточная #{i + 1}") }
    Interface.stations << Station.new('ст. Конечная 1')

    # -------------------------------------------------------------------------------------

    # Создаем маршруты

    # Маршрут для грузового поезда
    Interface.routes << Route.new(Interface.stations.first, Interface.stations[1])

    # Маршрут для пассажирского поезда
    Interface.routes << Route.new(Interface.stations.first, Interface.stations.last)

    # -------------------------------------------------------------------------------------

    # Создаем грузовой поезд
    cargo_train = CargoTrain.new('car-11', 1)
    Interface.trains << cargo_train
    Interface.trains.last.set_route(Interface.routes[0])

    # Цепляем вагоны к грузовому поезду
    1.upto(4) do |i|
      carriage = CargoCarriage.new(10 * i)
      cargo_train.add_carriage(carriage)
    end

    # Создаем пассажирский поезд поезд
    passenger_train = PassengerTrain.new('pas-11', 2)
    Interface.trains << passenger_train
    Interface.trains.last.set_route(Interface.routes[1])

    # Цепляем вагоны к пассажирскому поезду
    2.times do
      carriage = PassengerCarriage.new(20)
      passenger_train.add_carriage(carriage)
    end
  end
end
