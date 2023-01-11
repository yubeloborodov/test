# require './station'
# require './route'
# require './passenger_train'
# require './passenger_carriage'
# require './cargo_train'
# require './cargo_carriage'

# Черновик

# class Car
#   attr_reader :current_rpm

#   def initialize
#     @current_rpm = 0
#   end

#   def start_engine
#     start_engine! if engine_stopped?
#   end

#   protected

#   attr_writer :current_rpm

#   def initial_rpm
#     700
#   end

#   def engine_stopped?
#     current_rpm.zero?
#   end

#   def start_engine!
#     self.current_rpm = INITIAL_RPM
#   end
# end

# class Truck < Car
#   def loading; end

#   protected

#   def initial_rpm
#     500
#   end
# end

# class SportCar < Car
#   def start_engine
#     super
#     puts 'Wroom!'
#   end

#   protected

#   def initial_rpm
#     1000
#   end
# end

# class Driver
#   def drive(car)
#     car.start_engine
#     puts 'Drive'
#   end
# end
