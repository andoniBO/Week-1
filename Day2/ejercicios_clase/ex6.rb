class Person
	attr_reader :name

	def initialize(newname, newage)
		@name = newname
		@age = newage
	end

	def showinfo()
		puts "#{@name.capitalize} is #{@age} years old"
	end
end

juan = Person.new("Juan", 45)

juan.showinfo()