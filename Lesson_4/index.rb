require './station'
require './route'
require './passenger_train'
require './passenger_carriage'
require './cargo_train'
require './cargo_carriage'

puts '----------- Станции -----------'

$route = nil
$list_of_stations = []

def routes
  print "\n"
  puts 'Введите цифру - выберите операцию:'

  puts '
  1 - Создать маршрут на основе начальной и конечной станции"
  2 - Добавить новую станцию на маршрут
  3 - Удалить станцию с маршрута
  4 - Посмотреть список станций на маршруте'
  print "\n"

  operation = gets.chomp.to_i

  case operation
  when 1
    if $list_of_stations.length >= 2
      $route = Route.new($list_of_stations.first.name, $list_of_stations.last.name)
      puts "Создан маршрут: #{$route}"
    else
      puts 'Ошибка: Сначала необходимо создать станции'
    end
  when 2
    puts 'Введите имя новой станции для добавления в маршрут'
    s_name = gets.chomp.downcase
    station = Station.new(s_name)
    $route.add_station(station.name)
  when 3
    puts 'Введите имя станции для удаления'
    name = gets.chomp.downcase
    $route.delete_station(name)
  when 4
    puts "Список станции на маршруте #{$route.stations}"
  else
    puts 'Неизвестная операция'
  end
end

def stations
  print "\n"

  loop do
    puts 'Введите цифру - выберите операцию:'
    puts '
    1 - Добавить начальную и конечную станции. Перечесление через запятую. Пример: "Первомайская, Молодежная"
    2 - Просмотреть список станций
    3 - Вернуться в общее меню'
    print "\n"
    print '>> '

    operation = gets.chomp.to_i

    case operation
    when 1
      s_names = gets.chomp.downcase.split(',')
      $list_of_stations = s_names.map { |name| Station.new(name) }
      print "Создан список станций --> #{$list_of_stations}"
      print "\n"
      break
    when 2
      print "Cписок станций --> #{$list_of_stations}"
      print "\n"
      break
    when 3
      break
    else
      puts 'Неизвестная операция'
      break
    end
  end
end

def train
  print "\n"

  loop do
    puts 'Введите цифру - выберите операцию:'
    puts '
    1 - Назначить маршрут поезду
    2 - Добавить вагон к поезду
    3 - Отцепить вагон от поезда
    4 - Переместить поезд на одну станцию вперед
    5 - Переместить поезд на одну станцию назад'
    print "\n"
    print '>> '

    operation = gets.chomp.to_i

    case operation
    when 1
      break
    when 2
      break
    when 3
      break
    when 4
      break
    when 5
      break
    else
      break
    end
  end
end

loop do
  puts 'Введите цифру - выберите операцию:'

  puts '
  1 - Управлять станциями
  2 - Управлять маршрутами
  3 - Управлять поездами
  4 - Выйти из программы'
  print "\n"
  print '>> '

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

# def train
#   puts 'Для создания поезда введите его тип и номер через запятую:'
#   train_data = gets.chomp.downcase.split(',')
#   print "\n"

#   case train_data[0]
#   when 'грузовой'
#     puts "--> Создаем грузовой поезд с номером #{train_data[1]}"
#     CargoTrain.new(train_data[1])
#   when 'пассажирский'
#     puts "--> Создаем пассажирский поезд с номером #{train_data[1]}"
#     PassengerTrain.new(train_data[1])
#   else
#     puts 'Указан не верный тип поезд. Поезд не создан!'
#   end
# end

# def route
#   stations_list = stations
#   route = Route.new(stations.first.name, stations.last.name)
#   puts "Cоздан маршрут: #{route}"
#   print "\n"

#   puts 'Введите имя новой станции:'
#   custom_station = Station.new(name)

#   route.add_station(custom_station.name)

#   route.drop_station(custom_station)

#   puts "Список всех станций: #{route.stations}"
#   print "\n"

#   # print "\n"
# end

# def train_control
#   train.route(route)
#   #  Назначить маршрут поезда
# end

# print "\n"
# t = train

# print t
# print t.number

# puts 'Введите номер поезда:'
# train_number = gets.chomp.to_s.downcase

# print trains[:train_type]

# s1 = Station.new('Начальная: Первомайская')
# s2 = Station.new('Промежуточная: Молодежная')
# s3 = Station.new('Промежуточная: Олимпийская')
# s4 = Station.new('Промежуточная: Калининская')
# s5 = Station.new('Конечная: Дружбы')

# t1 = CargoTrain.new('№1')
# t2 = PassengerTrain.new('№2')
# t3 = CargoTrain.new('№3')

# puts "Название станции: #{s1.name}"
# print "\n"

# s1.add_train(t1)
# s1.add_train(t2)
# s1.add_train(t3)

# puts '----------- Вагоны -----------'
# print "\n"

# с1 = CargoCarriage.new(1)
# с2 = PassengerCarriage.new(1)

# # puts "#{с1.type} - номер: #{с1.number}"

# t1.add_carriage(с1)
# t1.add_carriage(с2)
# puts t1.carriages
# puts "Cписок поездов на станции - #{s1.trains}"
# print "\n"

# puts "Количество поездов по типу #{t1.type} - #{s1.count_trains_by_type(t1.type)}"
# print "\n"

# puts "На станции #{s1.name} - поезда по типу #{s1.trains_by_type('грузовой')}"
# print "\n"

# s1.send_train(t2)
# puts "Cписок поездов на станции - #{s1.trains}"

# print "\n"
# puts '----------- Маршрут -----------'
# print "\n"

# route = Route.new(s1.name, s5.name)
# puts "Маршрут: #{route}"
# print "\n"

# route.add_station(s2.name)
# route.add_station(s3.name)
# route.add_station(s4.name)

# puts "Список всех станций: #{route.stations}"
# print "\n"

# print "\n"
# puts '----------- Поезд -----------'
# print "\n"

# t1.increase_speed(5)
# puts "Набранная скорость поезда: #{t1.speed}"
# t1.stop
# t1.add_carriage
# t1.add_carriage
# puts "Количество вагонов: #{t1.carriage_amount}"

# t1.route(route)
# t1.go_to_next_station
# t1.go_to_next_station
# t1.go_to_next_station
# t1.go_to_next_station

# t1.go_to_prev_station
# t1.go_to_prev_station
# t1.go_to_prev_station
# t1.go_to_prev_station
# t1.go_to_prev_station
