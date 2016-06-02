lemonade_revenue = {
	:monday => { :revenue => 20, :costs => 5, :feedback => ["Good", "Too sweet"]},
	:tuesday => { :revenue => 15, :costs => 4, :feedback => ["Meh"]},
	:wednesday => { :revenue => 5, :costs => 3, :feedback => ["Wow"]},
	:thursday => { :revenue => 9, :costs => 3, :feedback => ["Best", "Not sweet"]},
	:friday => { :revenue => 17, :costs => 4, :feedback => []}
}

puts "On thursday, the feedback was:"
lemonade_revenue[:thursday][:feedback].each do |item|
	puts "#{item}"
end

puts "Tuesday benefit was:"