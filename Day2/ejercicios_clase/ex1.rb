class Car
	attr_reader :noise, :color
	def initialize(newnoise, newcolor)
		@noise = newnoise
		@color = newcolor
	end
	def make_noise()
		puts noise
		puts "#{color.capitalize} car coming through!!"
	end

	def self.doublehonk(car)
		puts "#{car.noise}"
		puts "#{car.noise}"
	end
end

normal_car = Car.new("Broom", "blue")
noisy_car = Car.new("WRAAAAANG!!", "red")
normal_car.make_noise()
noisy_car.make_noise()

Car.doublehonk(normal_car)