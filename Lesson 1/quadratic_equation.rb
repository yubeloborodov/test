# Квадратное уравнение. Пользователь вводит 3 коэффициента a, b и с. Программа вычисляет дискриминант (D) и корни уравнения (x1 и x2, если они есть) и выводит значения дискриминанта и корней на экран. При этом возможны следующие варианты:
#   Если D > 0, то выводим дискриминант и 2 корня
#   Если D = 0, то выводим дискриминант и 1 корень (т.к. корни в этом случае равны)
#   Если D < 0, то выводим дискриминант и сообщение "Корней нет"

puts 'Введите коэффициент A:'
A = gets.chomp.to_f
puts 'Введите коэффициент B:'
B = gets.chomp.to_f
puts 'Введите коэффициент C:'
C = gets.chomp.to_f

D = B*B - 4*A*C

if D == 0
  puts "Дискриминант = #{D}"
  puts "1-й корень = #{-B/2/A}"
elsif D > 0
  puts "Дискриминант = #{D}"
  puts "1-й корень = #{(-B-Math.sqrt(D))/2/A}"
  puts "2-й корень = #{(-B+Math.sqrt(D))/2/A}"
else D < 0
  puts "Дискриминант = #{D}"
  puts "Корней нет!"
end