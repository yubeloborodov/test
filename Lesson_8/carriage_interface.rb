require_relative 'cargo_carriage'
require_relative 'passenger_carriage'
require_relative 'template'
require_relative 'types'

class CarriageInterface
  def self.menu(train)
    @@train = train
    puts train
    loop do
      puts "Поезд: #{train.number}, типа #{train.type}, вагонов: #{train.carriages.size}"
      puts 'Введите цифру - выберите действие:'
      puts '1 - Прицепить вагон к поезду'

      if train.carriages.size > 0
        puts '2 - Отцепить вагон от поезда'
        puts '3 - Заполнить вагон'
        puts '4 - Вывести все вагоны поезда'
      end

      puts '0 - Вернуться в меню поезда'
      print '>> '

      operation = gets.chomp
      operation = -1 if operation.empty?

      puts "\n"

      case operation.to_i
      when 0
        break
      when 1
        puts '--> Прицепить вагон к поезду'
        add_carriage
      when 2
        puts '--> Отцепить вагоны от поезда'
        delete_carriage
      when 3
        puts '--> Заполнить вагон'
        fill_carriage
      when 4
        puts '--> Вывести все вагоны поезда'
        Template.show_carriage(@@train)
      else
        puts '! Неизвестная операция'
      end

      puts "\n"
    end
  end

  def self.add_carriage
    return puts '! Остановите сначала поезд' if @@train.speed > 0

    begin
      puts 'Введите номер вагона:'
      print '>> '
      number = gets.chomp.to_i

      puts 'Выберите тип вагона:'
      puts '1 - Грузовой'
      puts '2 - Пассажирский'
      print '>> '
      type = gets.chomp.to_i

      puts "Выбран тип вагона #{TYPES[type]}"

      puts "Поезд имеет тип вагона #{@@train.type}"

      if @@train.type != TYPES[type]
        raise TypeError, "! К поезду типа #{@@train.type} можно прицепить вагон только того же типа"
      end

      input_carriage_block = proc do |input_message, carriage_class|
        puts input_message
        print '>> '
        unit = gets.chomp.to_i

        carriage = carriage_class.new(unit)
        @@train.add_carriage(carriage)
      rescue ArgumentError => e
        puts "! Ошибка: #{e.message}"
        retry
      end

      if type == 1
        input_carriage_block.call('Введите объем грузового вагона:', CargoCarriage)
      elsif type == 2
        input_carriage_block.call('Введите кол-во мест в пассажирском вагоне:', PassengerCarriage)
      else
        raise TypeError, 'Нет такого типа вагонов'
      end
    rescue TypeError => e
      puts "! Ошибка: #{e.message}"
      retry
    end

    puts "\tВсего вагонов: #{@@train.carriages.size}"
  end

  def self.select
    return puts '! Остановите сначала поезд' if @@train.speed > 0

    Template.show_carriage(@@train)

    begin
      puts 'Введите порядковый номер вагона:'
      print '>> '
      index = gets.chomp.to_i
      raise ArgumentError, 'Вагона под таким номером не существует' if index <= 0 || index > @@train.carriages.length

      yield(index - 1)
    rescue ArgumentError => e
      puts "! Ошибка: #{e.message}"
      retry
    end
  end

  def self.delete_carriage
    select { |index| @@train.delete_carriage(index) }
  end

  def self.fill_carriage
    select { |index| @@train.carriages[index].fill }
  end
end
