# Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя). Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным. (Запрещено использовать встроенные в ruby методы для этого вроде Date#yday или Date#leap?) Алгоритм опредления високосного года: docs.microsoft.com

months = [{ 'january' => 31 }, { 'february' => 28 }, { 'march' => 31 }, { 'april' => 30 }, { 'may' => 31 }, { 'june' => 30 }, { 'july' => 31 }, { 'august' => 31 },
          { 'september' => 30 }, { 'october' => 31 }, { 'november' => 30 }, { 'december' => 31 }]

puts 'Введите номер дня:'
d = gets.chomp.to_i - 1

puts 'Введите номер месяца от 1 до 12:'
m = gets.chomp.to_i - 1

puts 'Введите год:'
y = gets.chomp.to_i

months.slice(0, m).each do |item|
  sum += item.values.first
end

is_leap_year = y % 4 == 0 || (y % 100 == 0 && y % 400 == 0)

sum += d
sum += 1 if is_leap_year

puts sum
