class Cake
	attr_reader :flavour
	def initialize(newflavour)
		@flavour = newflavour
	end
end

Choc_cake = Cake.new("Chocolate")
Straw_cake = Cake.new("Strawberry")
Lemon_cake = Cake.new("Lemon")

puts "Tarta de #{Choc_cake.flavour}"
puts "Tarta de #{Straw_cake.flavour}"
puts "Tarta de #{Lemon_cake.flavour}"

cakes = Array.new()
cakes.push(Choc_cake)
cakes.push(Straw_cake)
cakes.push(Lemon_cake)

puts "Nuestras tartas:"
cakes.each do |item|
	puts "Tarta de #{item.flavour}"
end