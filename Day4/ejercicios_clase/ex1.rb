require 'pry'
require 'openssl'

class Login
	attr_reader :logged_in

	def initialize
		register
		@logged_in = false
	end

	def register
		system "clear"
		puts "               ***REGISTER***"
		puts ""
		print "Set your user: "
		@saved_user = gets.chomp
		print "Set your password: "
		@saved_pwd = gets.chomp
		system "clear"
	end

	def login
		system "clear"
		puts "               ***LOGIN***"
		puts ""
		print "User: "
		@user = gets.chomp
		print "Password: "
		@pwd = gets.chomp
		check_pwd
	end

	def check_pwd
		system "clear"
		if @saved_user == @user
			if @saved_pwd == @pwd
				puts "You have successfully logged in"
				@logged_in = true
			else
				puts "Password is incorrect"
			end
		else
			puts "User is incorrect"
		end
	end
end

class Text_Counter
	def initialize

	end

	def text_management
		system "clear"
		puts "Enter your text: "
		text = gets.chomp
		num_words = text.split.size
		puts "Your text has #{num_words} words"
	end
end

def menu
	puts "                 ***MENU***"
	puts ""
	puts "1. Login"
	puts "2. Count words"
	puts "3. Exit"
	puts ""
	puts "                    What do you want to do?"
	@op = gets.chomp.to_i
end

system "clear"
@op = 0
login_Tool = Login.new
word_Counter = Text_Counter.new

while @op !=3
	menu
	case @op
		when 1
			login_Tool.login
		when 2
			binding.pry
			if login_Tool.logged_in
				word_Counter.text_management
			else
				system "clear"
				puts "You need to log in first"
			end
	end	
end