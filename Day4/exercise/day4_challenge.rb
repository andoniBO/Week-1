require 'pry'

class Shopping_cart
  def initialize(list_of_prices)
    @cart = {}
    @list_of_prices = list_of_prices
  end

  def add_item_to_cart(item)
    @cart[item] ? @cart[item]+=1 : @cart[item]=1
  end

  def show
    @cart.each do |fruit, quantity|
      total_price = get_fruit_total_price(@list_of_prices[fruit], quantity)
      puts "#{quantity} #{fruit}: #{total_price}"
    end
  end

  def get_fruit_total_price(price_per_unit, quantity)
    price_per_unit*quantity
  end
end

prices_reference = {
  :apple => 10,
  :banana => 20
}
cart = Shopping_cart.new prices_reference

cart.add_item_to_cart :apple
cart.add_item_to_cart :banana
cart.add_item_to_cart :banana
cart.add_item_to_cart :banana
cart.add_item_to_cart :banana


cart.show
