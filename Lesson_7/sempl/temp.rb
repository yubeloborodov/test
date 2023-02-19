begin
  puts 'Before exception'
  1 / 0
  puts 'After exception'
rescue StandardError => e
  puts 'Error'
  raise
rescue NoMemmoryError => e
  puts 'No Memmory Error'
end

puts 'After Exception'

# def method_with_error
# raise ArgumentError, 'Oh no!'
# end
#
# begin
# method_with_error
# rescue StandardError => e
# puts e.inspect
# end
#
# puts 'After Exception'

# def connect_to_site
  ....
  # raise 'Connection error'
# end
# 
# attempt = 0
# begin
  # connect_to_site
# rescue StandardError => e
  # attempt += 1
  # puts 'Check your enternet connection!'
  # retry if attempt < 3
# ensure
  # puts "There was #{attempt} attempts"
# end


# regexp = /.+/
# соотвествует ли строка слева регулярному выржению
# '' =~ regexp 

# regexp = /^[а-яА-Я]{1}\d{3}[а-яА-Я]{2}$/
# 's343df' =~ regexp # совпадает
# 's343df' !~ regexp # не совпадает
