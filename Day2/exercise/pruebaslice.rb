data_array = Array.new
data_array<<'Hola'<<'que'<<'pasa'<<'tia'<<'tomasa'
sliced_blog = data_array.slice(0,3)
sliced_blog.each do |item|
	puts item
end