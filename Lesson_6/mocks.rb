class Mocks
  def self.init
    # Create stations
    Interface.stations << Station.new('ст. Начальная 1')
    Interface.stations << Station.new('ст. Начальная 2')

    5.times { |i| Interface.stations << Station.new("ст. Промежуточная #{i + 1}") }

    Interface.stations << Station.new('ст. Конечная 1')
    Interface.stations << Station.new('ст. Конечная 2')

    # Create routes
    Interface.routes << Route.new(Interface.stations[0], Interface.stations[2])
    Interface.routes << Route.new(Interface.stations[1], Interface.stations[3])
    Interface.routes.last.add_station(Interface.stations[4])
    Interface.routes.last.add_station(Interface.stations[5])
    Interface.routes.last.add_station(Interface.stations[6])

    Interface.routes << Route.new(Interface.stations[0], Interface.stations[3])
    Interface.routes.last.add_station(Interface.stations[7])
    Interface.routes.last.add_station(Interface.stations[8])

    # Create trains
    Interface.trains << CargoTrain.new('Грузовой')
    Interface.trains << PassengerTrain.new('Пассажирский')
  end
end
