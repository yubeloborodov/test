require_relative 'types'

class Mocks
  def self.init
    # Create stations
    Interface.stations << Station.new('ст. Начальная 1')
    5.times { |i| Interface.stations << Station.new("ст. Промежуточная #{i + 1}") }
    Interface.stations << Station.new('ст. Конечная 1')

    # Create routes
    Interface.routes << Route.new(Interface.stations[0], Interface.stations[2])

    Interface.routes << Route.new(Interface.stations[1], Interface.stations[3])
    Interface.routes.last.add_station(Interface.stations[4])
    Interface.routes.last.add_station(Interface.stations[5])

    # Create trains
    cargo_train = CargoTrain.new('car-11', 1)
    Interface.trains << cargo_train
    Interface.trains.last.set_route(Interface.routes[0])

    # 1.upto(7) do |i|
    #   carriage = CargoCarriage.new(10 + i)
    #   cargo_train.add_carriage(carriage)
    # end

    carriage = CargoCarriage.new(10)
    cargo_train.add_carriage(carriage)
    carriage = CargoCarriage.new(20)
    cargo_train.add_carriage(carriage)

    # print cargo_train.carriages

    cargo_train.get_carriages do |carriage, index|
      puts "#{carriage} - #{index}"
    end
  end
end
