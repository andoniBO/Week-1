class Car
	def initialize(newnoise, newcolor)
		@noise = newnoise
		@color = newcolor
	end

	def make_noise()
		puts "#{@noise}"
		puts "#{@color.capitalize} car's coming through!!!"
	end
end

class RacingCar < Car
	def initialize(newnoise, newcolor)
		super(newnoise,newcolor)
	end

	def make_noise()
		puts "BRRRAAAAANGGGGG!!!"
		puts "A fucking #{@color} car is coming through!!!"
	end
end

punto = Car.new("Fiunnnnn!!", "black")
ferrari = RacingCar.new("brumbrum", "red")

punto.make_noise()
ferrari.make_noise()