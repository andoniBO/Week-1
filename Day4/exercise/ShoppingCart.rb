require 'pry'

class ShoppingCart
	def initialize (stock)
		@stock = stock
		@content = Array.new
	end

	def add_item_to_cart (product)
		@stock.select do |key, value|
			if key == product
				@content.push([key.to_s, value])
			end
		end
	end

	def show_cart
#		@content.each_with_index do |item, index|
#			puts "#{item[0]}: #{item[1]}"
#		end
		fruitcount = Array.new
		fruitcount = [[0,0],[0,0],[0,0],[0,0],[0,0]]
		cont = 0
		@content.select do |key|
			if key == "apple"
				fruitcount[0][0] += 1
				fruitcount[0][1] += @content[cont][1]
			end
			if key == "orange"
				fruitcount[1][0] += 1
				fruitcount[1][1] += @content[cont][1]
			end
			if key == "grape"
				fruitcount[2][0] += 1
				fruitcount[2][1] += @content[cont][1]
			end
			if key == "banana"
				fruitcount[3][0] += 1
				fruitcount[3][1] += @content[cont][1]
			end
			if key == "watermelon"
				fruitcount[4][0] += 1
				fruitcount[4][1] += @content[cont][1]
			end
			cont += 1
		end
		cont = 0
		fruitcount.each_with_index do |item, index|
			if fruitcount[index][0] > 0
				puts "#{item[0]} #{@content[cont][0]}: #{@stock[item]*fruitcount[0][0]}"
				cont += 1
			end
		end
	end

	def cost
		total_cost = 0
		@content.select do |key, value|
			total_cost += value
		end
		puts "Total cost: #{total_cost}"
	end

end

def show_stock
	cont = 0
	@stock.select do |key, value|
		cont += 1
		puts "#{cont} #{key}: #{value * cont}$"
	end
end

stock = {:apple => 10, :orange => 5, :grape => 15, :banana => 20, :watermelon => 50}

cart = ShoppingCart.new(@stock)

#show_stock

cart.add_item_to_cart :apple
cart.add_item_to_cart :banana
cart.add_item_to_cart :banana

cart.show_cart

cart.cost

=begin

class Product
	attr_reader :amount, :name, :price

	def initialize
		@amount = 0
		@name = ""
		@price = 0
	end

	def increase_amount(amount)
		@amount += amount
	end

	def set_name(name)
		@name = name
	end

	def increase_price(price)
		@price += price
	end
end

inderx = cart.find_index_in_stock("banana")


cart.show
=end