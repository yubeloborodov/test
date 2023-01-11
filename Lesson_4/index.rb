require './station'
require './route'
require './passenger_train'
require './passenger_carriage'
require './cargo_train'
require './cargo_carriage'

$route = nil
$train = nil
$stations = []

def routes
  print "\n"

  loop do
    puts 'Введите цифру - выберите операцию:'

    puts '
      1 - Создать маршрут на основе начальной и конечной станции"
      2 - Добавить новую станцию на маршрут
      3 - Удалить станцию с маршрута
      4 - Посмотреть список станций на маршруте'
    print "\n"
    print 'Ожидаем цифру  >> '

    operation = gets.chomp.to_i

    case operation
    when 1
      if $stations.length >= 2
        $route = Route.new($stations.first.name, $stations.last.name)
        puts "Создан маршрут: #{$route}"
      else
        puts 'Ошибка: Сначала необходимо создать станции'
      end

      break
    when 2
      puts 'Введите имя новой станции для добавления в маршрут'
      s_name = gets.chomp.downcase
      station = Station.new(s_name)
      $route.add_station(station.name)

      break
    when 3
      puts 'Введите имя станции для удаления'
      name = gets.chomp.downcase
      $route.delete_station(name)
      break

    when 4
      if $route
        puts "Список станции на маршруте #{$route.stations}"
      else
        puts 'Сначало надо создать маршрут'
      end

      break
    else
      puts 'Неизвестная операция'
    end
  end
end

def stations
  print "\n"

  loop do
    puts 'Введите цифру - выберите операцию:'
    puts '
      1 - Добавить начальную и конечную станции. Перечесление через запятую. Пример: "Первомайская, Молодежная"
      2 - Просмотреть список станций
      3 - Просмотреть список поездов на станций
      4 - Вернуться в общее меню'
    print "\n"
    print 'Ожидаем цифру  >> '

    operation = gets.chomp.to_i

    case operation
    when 1
      print 'Введите начальную и конечную станцию через запятую >> '
      s_names = gets.chomp.downcase.split(',')
      $stations = s_names.map { |name| Station.new(name) }
      print "Создан список станций --> #{$stations}"
      print "\n"

      break
    when 2
      print "Cписок станций --> #{$stations}"
      print "\n"

      break
    when 3
      if $stations.length == 0
        puts 'Все станции пустуют'
      else
        $stations.each do |statation|
          if statation.trains.length > 0
            puts "На станции #{statation} стоят поезда #{statation.trains}"
          else
            puts "На станции #{statation} нет поездов"
          end
        end
      end

      break
    when 4
      break
    else
      puts 'Неизвестная операция'
      break
    end
  end
end

def trains
  print "\n"

  loop do
    puts 'Введите цифру - выберите операцию:'
    puts '
      1 - Создать поезд <Укажите тип (пассажирский || грузовой)>
      2 - Назначить маршрут поезду
      3 - Добавить вагон к поезду
      4 - Отцепить вагон от поезда
      5 - Переместить поезд на одну станцию вперед
      6 - Переместить поезд на одну станцию назад'
    print "\n"
    print 'Ожидаем цифру  >> '

    operation = gets.chomp.to_i

    case operation
    when 1
      print 'Введите тип поезда >> '
      type = gets.chomp.downcase
      print 'Введите номер поезда >> '
      number = gets.chomp.downcase

      if type == 'пассажирский'
        $train = PassengerTrain.new(number)

        puts "--> #{$train}"
        print "Создали для вас #{$train.type} поезд с номером #{$train.number}"
      elsif type == 'грузовой'
        $train = CargoTrain.new(number)

        puts "--> #{$train}"
        print "Создали для вас #{$train.type} поезд с номером #{$train.number}"
      else
        puts 'На данный момент для создания доступны только поезда типа <Грузовой> и <Пассажирский>'
      end

      break
    when 2
      print "Cписок станций --> #{$stations}"
      if $route
        $train.route($route)
      else
        puts 'Сначала необходимо создать маршрут'
      end

      break
    when 3
      print 'Создайте новый вагон.<Укажите тип (пассажирский || грузовой)> >> '
      type = gets.chomp.downcase
      print 'Введите номер вагона >> '
      number = gets.chomp.downcase

      if type == 'грузовой'
        carriage = CargoCarriage.new(number)
        $train.add_carriage(carriage)
      elsif type == 'пассажирский'
        carriage = PassengerCarriage.new(number)
        $train.add_carriage(carriage)
      else
        puts 'На данный момент для создания доступны только вагоны типа <Грузовой> и <Пассажирский>'
      end

      break
    when 4
      $train.delete_carriage
      puts 'От поезда отцеплен один вагон'

      break
    when 5
      $train.go_to_next_station
      puts 'Поезд перешел на следующую станцию'

      break
    when 6
      $train.go_to_prev_station
      puts 'Поезд перешел на предыдущую станцию'

      break
    else
      break
    end
  end
end

loop do
  print "\n"
  puts 'Введите цифру - выберите операцию:'

  puts '
    1 - Управлять станциями
    2 - Управлять маршрутами
    3 - Управлять поездами
    4 - Выйти из программы'
  print "\n"
  print 'Ожидаем цифру  >> '

  operation = gets.chomp

  case operation.to_i
  when 1
    puts '--> Выбрано "Управлять станциями"'
    stations
  when 2
    puts '--> Выбрано "Создать маршрут"'
    routes
  when 3
    puts '--> Выбрано "Управлять поездами"'
    trains
  when 4
    puts '--> Выбрано "Выйти из программы"'
    break
  else
    puts 'Неизвестная операция'
  end
end
