#By the teacher

=begin
class Car
	def initialize
		@file = 'cities.txt'
	end

	def add_city(city)
		@cities_visited = IO.read(@file)
		IO.write(@file,@cities_visited)
	end
end
=end

#By me
class Car
	def initialize(name)
		@name = name
		@cities = Array.new()
		IO.write('cities.txt', "")
	end

	def add_city(city)
		@cities<<city
	end

	def save_file(name)
		IO.write(name, @cities.join(", "))
	end

	def read_file(name)
		@cities = []
		@cities = IO.read(name).split(", ")
	end

	def cities()
		@cities.each do |item|
			puts item
		end
	end
end

punto = Car.new("Fiat Punto")

punto.add_city("Madrid")
punto.add_city("Oviedo")
punto.add_city("Santiago de Compostela")
punto.add_city("Santander")

punto.save_file('cities.txt')

punto.read_file('cities.txt')

punto.cities()

