require_relative 'interface'

class RouteInterface
  def self.menu(route)
    return if route.nil?

    @@route = route

    loop do
      puts 'Введите цифру - выберите действие:'
      puts '1 - Список станций на маршруте'
      puts '2 - Добавить станцию на маршрут'
      puts '3 - Удалить станцию с маршрута'
      puts '0 - Вернуться в меню маршрутов'
      print '>> '

      operation = gets.chomp
      operation = -1 if operation.empty?

      puts "\n"

      case operation.to_i
      when 0
        break
      when 1
        puts '--> Список станций на маршруте'
        info(@@route)
      when 2
        puts '--> Добавить станцию на маршрут'
        add_station
      when 3
        puts '--> Удалить станцию с маршрута'
        delete_station
      else
        puts '! Неизвестная операция'
      end

      puts "\n"
    end
  end

  def self.info(route)
    route.stations.each_with_index { |station, index| puts "\t#{index + 1} - #{station.name}" }
  end

  def self.add_station
    begin
      puts 'Введите номер станции для добавления её в маршрут:'
      print '>> '
      station = Interface.stations[gets.chomp.to_i - 1]
      raise ArgumentError, 'Станции с таким номером не существует!' if station.nil?
    rescue ArgumentError => e
      puts "! Ошибка: #{e.message}"
      retry
    end

    @@route.add_station(station)
  end

  def self.delete_station
    info(@@route)

    begin
      puts 'Введите номер промежуточной станции для её удаления из маршрута:'
      print '>> '
      station = @@route.stations[gets.chomp.to_i - 1]
      raise ArgumentError, ' Станции с таким номером не существует на маршруте !' if station.nil?
    rescue ArgumentError => e
      puts "! Ошибка: #{e.message}"
      retry
    end

    @@route.delete_station(station)
  end
end
