require_relative 'types'

class Mocks
  def self.init
    # Create stations
    Interface.stations << Station.new('ст. Начальная 1')
    Interface.stations << Station.new('ст. Начальная 2')
    Interface.stations << Station.new('ст. Конечная 1')
    Interface.stations << Station.new('ст. Конечная 2')

    5.times { |i| Interface.stations << Station.new("ст. Промежуточная #{i + 1}") }

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
    Interface.trains << CargoTrain.new('tu1-yy', TYPES[1])
    Interface.trains << PassengerTrain.new('tu2-yy', TYPES[2])
  end

  # def self.init
  #   # Create stations
  #   Interface.stations << Station.new('ст. Начальная 1')
  #   Interface.stations << Station.new('ст. Начальная 2')

  #   5.times { |i| Interface.stations << Station.new("ст. Промежуточная #{i + 1}") }

  #   Interface.stations << Station.new('ст. Конечная 1')
  #   Interface.stations << Station.new('ст. Конечная 2')

  #   # Create routes
  #   Interface.routes << Route.new(Interface.stations[0], Interface.stations[2])
  #   Interface.routes << Route.new(Interface.stations[1], Interface.stations[3])
  #   Interface.routes.last.add_station(Interface.stations[4])
  #   Interface.routes.last.add_station(Interface.stations[5])
  #   Interface.routes.last.add_station(Interface.stations[6])

  #   Interface.routes << Route.new(Interface.stations[0], Interface.stations[3])
  #   Interface.routes.last.add_station(Interface.stations[7])
  #   Interface.routes.last.add_station(Interface.stations[8])

  #   # Create trains
  #   Interface.trains << CargoTrain.new('tu1-yy', TYPES[1])
  #   Interface.trains << PassengerTrain.new('tu2-yy', TYPES[2])
  # end
end
