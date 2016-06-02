class Home
	attr_reader(:name, :city, :capacity, :price)

	def initialize(name, city, capacity, price)
		@name = name
		@city = city
		@capacity = capacity
		@price = price
	end
end

def separacion()
	puts ""
	puts "*************"
	puts ""
end

#Iteration 0: Create an array of homes
homes = [
	Home.new("Nizar's place", "San Juan", 2, 42),
	Home.new("Fernando's place", "Seville", 5, 47),
	Home.new("Josh's place", "Pittsburgh", 3, 41),
	Home.new("Gonzalo's place", "Málaga", 2, 45),
	Home.new("Ariel's place", "San Juan", 4, 49),
	Home.new("Casa de Fermin", "Oviedo", 7, 56),
	Home.new("Casa de Tomas", "Leon", 4, 45),
	Home.new("Casa de Jose", "Madrid", 6, 58),
	Home.new("Casa de Maria", "Valencia", 1, 41),
	Home.new("Casa de Tomasa", "Granada", 2, 34),
]

#Iteration1: List of homes
def printHomes(homes)
	homes.each_with_index do |hm, index|
		puts "Home number #{index+1}:"
		puts "#{hm.name}(#{hm.capacity} people) in #{hm.city}"
		puts "Price: $#{hm.price} a night"
	end
end

separacion()
puts "Our homes:"
printHomes(homes)
separacion()

#Iteration2: Sorting
sortedHomes = homes.sort {|x,y| x.price<=>y.price}
puts"Sorted homes by price: "
printHomes(sortedHomes)
separacion()

#Iteration3: Filter by city
puts "En que ciudad desea buscar?"
ciudad = gets.chomp()
city_homes = homes.select do |hm|
	#Keep hm only if its city is "San Juan"
	hm.city == ciudad
end

puts"Homes in #{ciudad}:"
printHomes(city_homes)
separacion()

#Iteration4: Average
prices =  city_homes.map do |hm|
	hm.price
end

#average_price = prices.reduce(0.0, :+)/prices.length.to_i
average_price = prices.reduce(0.0, :+)/prices.length.to_i

puts "Average price for homes in #{ciudad}: #{average_price}"
separacion()

#Iteration5: Name your own price
puts "Cual es tu precio?"
precio = gets.chomp().to_i
casadetuprecio = homes.find{|x| x.price == precio}
if(!casadetuprecio.nil?)
	puts "La casa que se adecua a su presupuesto es"	
	puts "#{casadetuprecio.name}(#{casadetuprecio.capacity} people) in #{casadetuprecio.city}"
	puts "Price: $#{casadetuprecio.price} a night"
else
	puts "Lo sentimos, no disponemos una casa que cumpla sus requisitos"
end

=begin
total_capacities = homes.reduce(0.0) do |sum, hm|
  sum + hm.capacity
end

puts "Total capacities: #{total_capacities}"
separacion()

# Homes with capacity 4 or more
high_capacity_homes = homes.select do |hm|
  # Keep hm only if its capacity is 4 or greater
  hm.capacity >= 4
end

puts"High capacity homes(4+ people):"
printHomes(high_capacity_homes)
separacion()

home_41_dollars = homes.find do |hm|
  # Is hm's price $41?
  hm.price == 41
end

puts "The first home that costs $41 is:"
puts home_41_dollars.name
separacion()

sorted = homes.sort do |home1, home2|
	# Compare the two homes by their capacity
	home1.capacity <=> home2.capacity
end
=end