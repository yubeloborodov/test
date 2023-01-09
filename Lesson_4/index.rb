require './station'
require './route'
require './passenger_train'
require './passenger_carriage'
require './cargo_train'
require './cargo_carriage'

puts '----------- Станция -----------'
print "\n"

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
