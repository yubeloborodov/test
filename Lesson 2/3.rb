# Заполнить массив числами фибоначчи до 100

fibonachi_nums = [0, 1]

loop do
  num = fibonachi_nums[-1] + fibonachi_nums[-2]
  break if num >= 100

  fibonachi_nums << num
end

puts fibonachi_nums
