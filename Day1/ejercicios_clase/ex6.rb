cities = ["miami", "madrid", "barcelona"]

answer = cities.reduce("") do |longest,x|
	if(x.length > longest.length)
		longest
	else
		x
	end
end

puts answer
