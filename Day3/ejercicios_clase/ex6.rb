class Vehicle1
	attr_reader :num_wheels, :noise
	def initialize(wheels,noise)
		@num_wheels = wheels
		@noise = noise
	end
end

class Vehicle2
	attr_reader :num_wheels, :noise
	def initialize(wheels,noise)
		@num_wheels = wheels
		@noise = noise
	end
end

class Wheel_count
	def initialize(vehicles)
		@vehicles = vehicles
		@total_wheels = 0
	end

	def count_wheels
		@vehicles.each do |item|
			@total_wheels += item.num_wheels.to_i
		end
		puts @total_wheels
	end
end

class Print_noises
	def initialize(vehicles)
		@vehicles = vehicles
	end

	def make_some_noise
		@vehicles.each do |item|
			puts item.noise
		end
	end
end

moto = Vehicle1.new(2, "MEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE")
hibrido = Vehicle2.new(4, "phshsssssssssssssssssss")
utilitario = Vehicle1.new(4, "brrrrrrrrrrrrrrr")
camion = Vehicle2.new(20, "BRUUUUUUUUUUUUM")

vehiculos = Array.new
vehiculos.push (moto)
vehiculos.push (hibrido)
vehiculos.push (utilitario)
vehiculos.push (camion)

rat = Wheel_count.new(vehiculos)
rat.count_wheels

speaker = Print_noises.new(vehiculos)
speaker.make_some_noise