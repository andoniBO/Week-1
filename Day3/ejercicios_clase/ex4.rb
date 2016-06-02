require 'openssl'

class CarDealer
	def initialize(inventory)
		@inventory = inventory 
	end

	def print_inv
		@inventory.each do |item|
			cont = 0
			print "#{item[:brand]}:"
			item[:model].each do |subitem|
				cont += 1
				print " #{subitem}"
				if cont < item[:model].length
					print ","
				end
			end
			puts ""
		end
	end

	def show_brands
		@inventory.each do |item|
			puts "#{item[:brand]}"
		end
	end

	def print_brand (brand)
		bool = false
		@inventory.each do |item|
			cont = 0
			if item[:brand] == brand.capitalize
				bool = true
				print "#{item[:brand]}:"
				item[:model].each do |subitem|
					cont += 1
					print " #{subitem}"
					if cont < item[:model].length
						print ","
					end
				end
				puts ""
			end
		end
		if bool == false
			puts "We dont have that brand in stock"
		end
	end
end

def menu
	puts ""
	puts "                ***MENU***"
	puts ""
	puts "1.Initialize array"
	puts "2.Print inventory"
	puts "3.Show our brands"
	puts "4.Search for a brand"
	puts "5.Exit"
	puts ""
	puts "					Select one option (number)"
	puts ""
	@op = gets.chomp().to_i
end

loop do
	menu
	system "clear"
	case @op
		when 1
			inventory = [{:brand => "Ford",
							:model => ["Fiesta", "Mustang"]},
						 {:brand => "Honda",
							:model => ["Civic", "CR-V"]}]

			@car_dealer = CarDealer.new(inventory)
		when 2
			@car_dealer.print_inv
		when 3
			@car_dealer.show_brands
		when 4
			puts "What Brand do you want to know about?"
			brand = gets.chomp
			puts ""
			@car_dealer.print_brand(brand)
		when 5
			puts "See you around!!"
			puts ""
			break
	end

end


