arr = [
	{ :lat => 25, :lng => 80, :name => "Miami"   }, #0
	{ :lat => 48, :lng => 2, :name => "Paris"    }, #1
	{ :lat => 40, :lng => 3, :name => "Madrid"   }, #2
	{ :lat => 18, :lng => 66, :name => "San Juan"}, #3
]

arr.each do |item|
	puts "En #{item[:name]} la latitud es de #{item[:lat]} y la longitud es de #{item[:lng]}"
end