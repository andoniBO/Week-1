class Car
	def initialize(engine)
		@engine = engine
	end

	def start
		puts "hmmmmmmmmm"
		@engine.move_pistons
	end
end

class Engine 
	def initialize(new_move_pistons)
		@move_pistons=new_move_pistons
	end

	def move_pistons
		puts @move_pistons
	end
end

engines = Array.new
engines.push ({:name => "ferrari", :move_pistons => "BRUMMMMM"})
engines.push ({:name => "cuatrolatas", :move_pistons => "Po Po Po Po Po"})

ferrari = Car.new(Engine.new("BRUMMMMM"))
cuatrolatas = Car.new(Engine.new("Po Po Po Po Po"))

ferrari.start
cuatrolatas.start