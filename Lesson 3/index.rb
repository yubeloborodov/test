require './station'
require './route'
require './train'

puts '----------- Станция -----------'

s1 = Station.new('Первомайская')

t1 = Train.new('№1', 'пассажирский', 4)
t2 = Train.new('№2', 'грузовой', 10)
t3 = Train.new('№3', 'пассажирский', 8)

puts "Название станции: #{s1.name}"
puts "Cписок поездов на станции: #{s1.trains}"

s1.add_train(t1)
s1.add_train(t2)
s1.add_train(t3)

puts "Cписок поездов на станции: #{s1.trains}"
puts "Cписок поездов по типу: #{s1.trains_by_type}"

s1.send_train(t2)
puts "Cписок поездов на станции: #{s1.trains}"

puts '----------- Маршрут -----------'

route = Route.new('станция начальная', 'станция конечная')
puts "Маршрут: #{route}"

route.add_station('промежуточная станция')
route.add_station('промежуточная станция')

puts "Список всех станций: #{route.stations}"

puts '----------- Поезд -----------'
t1.increase_speed(5)
puts "Набранная скорость поезда: #{t1.speed}"
t1.stop
t1.add_carriage
t1.add_carriage
puts "Количество вагонов: #{t1.carriage_amount}"

t1.route(route)
# t1.go_to_next_station
t1.go_to_prev_station
t1.prev_station
t1.current_station
