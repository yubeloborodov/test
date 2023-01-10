require './station'
require './route'
require './passenger_train'
require './passenger_carriage'
require './cargo_train'
require './cargo_carriage'

puts '----------- Станция -----------'
print "\n"

stations = []

loop do
  puts 'Введите команду - выберите действие:'
  puts '0 - Вернуться в главное меню'

  puts '1 - Создайте начальную и конечную станции'
  puts '2 - Создать маршрут на основе начальной и конечной станции'
  puts '3 - Добавить станцию к маршруту'
  puts '4 - Удалить станцию с маршрута'

  puts '5 - Создать поезд'
  puts '6 - Добавлять вагон к поезду'
  puts '7 - Отцепить вагон от поезда'
  puts '8 - Перемещать поезд по маршруту вперед на одну станцию'
  puts '9 - Перемещать поезд по маршруту назад на одну станцию'

  puts '10 - Просмотреть список станций и список поездов на станции'

  operation = gets.chomp

  case operation.to_i
  when 0
    break
  when 1
    s_start = Station.new('Начальная: Первомайская')
    s_end = Station.new('Конечная: Дружбы')
    stations << s_start
    stations << s_end
    puts "--> Вы создали начальную (#{s_start.name}) и конечную (#{s_end.name}) станции"
  when 2
    route = Route.new(stations.first.name, stations.last.name)
    puts "--> Вы создали маршрут (#{route})"
  when 3
    puts '--> Добавить станцию к маршруту'
    info
  else
    puts 'Неизвестная операция'
  end

  print "\n"
end

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
