require_relative 'station'
require_relative 'interface'

class StationsInterface
  STATION_NAME_FORMAT = /^ст.\s[A-Я][a-я]*\s\d/ # ст. Начальная 1

  def self.menu
    loop do
      puts 'Введите цифру - выберите действие:'
      puts '1 - Создать станцию'

      if Interface.stations.size > 0
        puts '2 - Список всех станций'
        puts '3 - Список поездов на станции'
      end

      puts '0 - Вернуться в главное меню'
      print '>> '

      operation = gets.chomp
      operation = -1 if operation.empty?

      puts "\n"

      case operation.to_i
      when 0
        break
      when 1
        puts '--> Создать станцию'
        create
      when 2
        puts '--> Список всех станций'
        show_stations
      when 3
        puts '--> Список поездов на станции'
        info
      else
        puts '! Неизвестная операция'
      end

      puts "\n"
    end
  end

  def self.create
    begin
      puts 'Введите название станции:'
      print '>> '
      name = "ст. #{gets.chomp.capitalize}"
      raise RegexpError, 'Имя станции не соответствует формату "Начальная 1"' if name !~ STATION_NAME_FORMAT
    rescue RegexpError => e
      puts "! Ошибка: #{e.message}"
      retry
    end

    Interface.stations << Station.new(name)
  end

  def self.show_stations
    Interface.stations.each_with_index { |station, index| puts "\t#{index + 1} - #{station.name}" }
  end

  def self.info
    show_stations

    begin
      puts 'Введите номер станции:'
      print '>> '
      number = gets.chomp.to_i - 1
      station = Interface.stations[number]
      raise ArgumentError, 'Станции с таким номером не существует' if station.nil?
    rescue ArgumentError => e
      puts "! Ошибка: #{e.message}"
      retry
    end

    print "\tНа станции #{station.name} стоят поезда #{station.trains} \n\t"
  end
end
