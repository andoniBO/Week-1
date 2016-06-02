class Car
	def initialize(name)
		@name = name
		@cities = Array.new()
	end

	def add_city(city)
		@cities.push(city)
	end

	def cities()
		puts "#My #{@name} has visited:"
		@cities.each do |item|
			puts "#{item}"
		end
	end
end

punto = Car.new("Fiat Punto")
punto.add_city ("Oviedo")
punto.add_city ("Madrid")
punto.add_city ("Logroño")
punto.add_city ("San Sebastian")
punto.add_city ("Toledo")
punto.cities()