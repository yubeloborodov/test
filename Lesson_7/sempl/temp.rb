# 3.times { |i| puts i }

h = { a: 1, b: 2, c: 3 }

h.each do |v|
  puts v.inspect
end

# Сохраняем блок как объкт

# a = Proc.new { |x| x = x * 10; puts x }

# proc Обертка над блоком, позволющая блок представить ввиде объекта
b = proc { |x|
  x *= 10
  puts x
}

# lambda Обертка над блоком, позволющая блок представить ввиде объекта
c = lambda { |x|
  x *= 10
  puts x
}

b.call(100)
c.call(50)

b.call(1, 2, 3, 4)

# lambda контролирует количество аргументов, которые передаются в блок и количество аргументов которые передаются при вызове метода call
# lambda - Это более строгая запись блока через объект
# c.call(1, 2, 3, 4)

# Блоки в ruby являются замыканиями
# Замыканиями - называются функции, которые сохраняют состояния окружения, т.е сохраняют состояния локальных переменных в той области видимости в которой они были определены

x = 'hello'
block = -> { puts x }
block.call

def m(block)
  x = 'Goodbye'
  puts "X from method: #{x}"
  block.call
end

m(block)

# Как писать свои функции, которые принимают блок

def meth
  puts 'Before block'
  # выходим из области метода, попадаем в блок. Вызывает блок не как именовая аргумент
  yield
  puts 'After block'
end

meth { puts 'Inside block' }

# ------------------------

# Передача блока как именованого аргумента
# def caps(str)
#   puts 'Before block'
#   str.capitalize!
#   # выходим из области метода, попадаем в блок. Вызывает блок не как именовая аргумент
#   yield(str)
#   puts 'After block'
# end

# caps('abc') { |str| puts str[0] }

# def caps(str, block)
#   puts 'Before block'
#   str.capitalize!
#   # выходим из области метода, попадаем в блок. Вызывает блок не как именовая аргумент
#   block.call(str)
#   puts 'After block'
# end

# block = ->(str) { puts str[0] }
# caps('abc', block)

# def caps(str, &block)
#   puts 'Before block'
#   str.capitalize!
#   # выходим из области метода, попадаем в блок. Вызывает блок не как именовая аргумент
#   block.call(str)
#   puts 'After block'
# end

# # block = ->(str) { puts str[0] }
# caps('abc')

# Блоки мощная концепция. Они позволяют динамически исполнять код, который можно определеить в одном месте и передать в другое

def m(str)
  if block_given?
    yield(str)
  else
    puts str
  end
end

m('abs') do |x|
  x.capitalize!
  puts x
end
