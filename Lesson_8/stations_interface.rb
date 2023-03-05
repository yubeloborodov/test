# frozen_string_literal: true

require_relative 'station'

class StationsInterface
  STATION_NAME_FORMAT = /^ст.\s[A-Я][a-я]*\s\d/.freeze # ст. Начальная 1

  def self.menu
    loop do
      puts "Станций: #{Station.instances}"
      puts '---------------------------------'
      puts "\n"

      puts 'Введите цифру - выберите действие:'
      puts '1 - Создать станцию'

      if Interface.stations.size.positive?
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
    puts 'Введите название станции:'
    print '>> '
    name = "ст. #{gets.chomp.capitalize}"

    Interface.stations << Station.new(name)

    raise RegexpError, 'Имя станции не соответствует формату "Начальная 1"' if name !~ STATION_NAME_FORMAT

    puts "\n"
    puts "Создана станция - #{Interface.stations.last.name}"
  rescue RegexpError => e
    puts "! Ошибка: #{e.message}"
    retry
  end

  def self.show_stations
    Interface.stations.each_with_index { |station, index| puts "#{index + 1} - #{station.name}" }
  end

  def self.info
    Interface.stations.each do |station|
      puts "Станция: #{station.name}"

      station.get_trains do |train|
        puts 'Вызван блок'
        puts "\tПоезд: #{train.number}, тип: #{train.type}, прицеплено вагонов: #{train.carriages.size}"
        Template.show_carriage(train)
      end
    end
  end
end
