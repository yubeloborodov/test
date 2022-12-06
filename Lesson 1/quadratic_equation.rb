# Квадратное уравнение. Пользователь вводит 3 коэффициента a, b и с. Программа вычисляет дискриминант (D) и корни уравнения (x1 и x2, если они есть) и выводит значения дискриминанта и корней на экран. При этом возможны следующие варианты:
#   Если D > 0, то выводим дискриминант и 2 корня
#   Если D = 0, то выводим дискриминант и 1 корень (т.к. корни в этом случае равны)
#   Если D < 0, то выводим дискриминант и сообщение "Корней нет"

puts 'Введите коэффициент A:'
a = gets.chomp.to_f
puts 'Введите коэффициент B:'
b = gets.chomp.to_f
puts 'Введите коэффициент C:'
c = gets.chomp.to_f

d = b * b - 4 * a * c

if d == 0
  puts "Дискриминант = #{d}"
  puts "1-й корень = #{-b / 2 / a}"
elsif d > 0
  puts "Дискриминант = #{d}"
  puts "1-й корень = #{(-b - Math.sqrt(d)) / 2 / a}"
  puts "2-й корень = #{(-b + Math.sqrt(d)) / 2 / a}"
else
  puts "Дискриминант = #{d}"
  puts 'Корней нет!'
end
