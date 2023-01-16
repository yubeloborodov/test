require_relative 'cargo_carriage'
require_relative 'passenger_carriage'

class TrainInterface
  def self.menu(train)
    return if train.nil?

    @@train = train

    loop do
      puts "Выбран поезд: #{@@train.number} #{@@train.type}"
      puts 'Введите цифру - выберите действие:'
      puts '1 - Назначить маршрут поезду'

      unless @@train.current_station.nil?
        puts '2 - Прицепить вагоны к поезду'
        puts '3 - Отцепить вагоны от поезда'
        puts '4 - Текущая станция'
        puts '5 - Переместить поезд на станцию вперед'
        puts '6 - Переместить поезд на станцию назад'
        puts '7 - Скорость поезда'
        puts '8 - Задать скорость поезду'
        puts '9 - Остановить поезд'
      end

      puts '0 - Вернуться в меню поездов'
      print '>> '

      operation = gets.chomp
      operation = -1 if operation.empty?

      puts "\n"

      case operation.to_i
      when 0
        break
      when 1
        puts '--> Назначить маршрут поезду'
        set_route
      when 2
        puts '--> Прицепить вагоны к поезду'
        add_carriage
      when 3
        puts '--> Отцепить вагоны от поезда'
        delete_carriage
      when 4
        puts '--> Поезд находится на станции'
        puts "\t#{@@train.current_station.name}"
      when 5
        puts '--> Двигаться вперед'
        go_to_next_station
      when 6
        puts '--> Двигаться назад'
        go_to_prev_station
      when 7
        puts '--> Скорость поезда'
        puts "\t#{@@train.speed}"
      when 8
        puts '--> Задать скорость поезду'
        set_speed
      when 9
        puts '--> Остановить поезд'
        @@train.stop
      else
        puts '! Неизвестная операция'
      end

      puts "\n"
    end
  end

  def self.set_route
    RoutesInterface.show_routes

    puts 'Введите номер маршрута:'
    print '>> '
    route = Interface.routes[gets.chomp.to_i - 1]
    return puts '! Маршрута под таким номером не существует' if route.nil?

    @@train.set_route(route)
  end

  def self.add_carriage
    return puts '! Остановите сначала поезд' if @@train.speed > 0

    puts 'Выберите тип вагона:'
    puts '1 - Грузовой'
    puts '2 - Пассажирский'
    print '>> '
    type = gets.chomp.to_i

    if @@train.type != TYPES[type]
      return puts "! К поезду типа #{@@train.type} можно прицепить вагон только того же типа"
    end

    puts 'Введите номер вагона:'
    print '>> '
    number = gets.chomp.to_i

    if type == 1
      @@train.add_carriage(CargoCarriage.new(number))
    elsif type == 2
      @@train.add_carriage(PassengerCarriage.new(number))
    else
      puts '! нет такого типа вагонов'
    end

    puts "\tВсего вагонов: #{@@train.carriages.size}"
  end

  def self.delete_carriage
    return puts '! Остановите сначала поезд' if @@train.speed > 0

    puts 'Введите кол-во вагонов:'
    print '>> '
    count = gets.chomp.to_i

    if count > @@train.carriages.size
      puts "! К поезду прицеплено только #{@@train.carriages.size}, столько и будет отцеплено"
      count = @@train.carriages.size
    end

    count.times { @@train.delete_carriage }

    puts "\tВсего вагонов: #{@@train.carriages.size}"
  end

  def self.go_to_next_station
    if @@train.next_station.nil?
      return puts "! Поезд '#{@@train.number}' на конечной станции: #{@@train.current_station.name}"
    end

    @@train.go_to_next_station
    puts "\tПоезд прибыл на странцию: #{@@train.current_station.name}"
  end

  def self.go_to_prev_station
    if @@train.prev_station.nil?
      return puts "! Поезд '#{@@train.number}' на начальной станции: #{@@train.current_station.name}"
    end

    @@train.go_to_prev_station
    puts "\tПоезд прибыл на странцию: #{@@train.current_station.name}"
  end

  def self.set_speed
    puts 'Введите скорость:'
    print '>> '
    @@train.set_speed = gets.chomp.to_i
  end
end
