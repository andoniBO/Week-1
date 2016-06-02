require 'pry'
require 'openssl'

class Room
	attr_reader :open_doors
	attr_accessor :monster

	def initialize
		@open_doors = 0
		@doors = Array.new
		(1..4).each do |item|
			@doors.push(rand(2))
			if @doors[item-1] == 1
				@open_doors +=1
			end
		end
		if rand(3) == 1
			@treasure = rand(20)
		else
			@treasure = 0
		end
		if rand(3) == 1
			@monster = rand(3)
		else
			@monster = 0
		end
	end

	def room_description(player)
		if @open_doors == 0
			puts "Mutant mouse: EEEK!! You found me!! Damn you!"
			puts "The walls magically disappear and you are back in your bed"
		else
			describe_doors
			if @treasure > 0 || @monster > 0
				if @treasure > 0
					player.increase_money(@treasure)
					puts ""
					if @monster > 0
						system "clear"
					end
					puts "You found #{@treasure} golden coins"
				end
				if @monster > 0
					while @monster > 0 && player.hp > 0
						show_stats(player)
						puts "There are #{@monster} monster(s) on your way!"
						puts "Do you want to fight? (y/n)"
						answer = gets.chomp
						if(answer.downcase == "y")
							player.fight(@monster)
							@monster = 0
						else
							system "clear"
							puts "You can't run!"
							player.lose_hp
						end
						if player.hp == 0
							system "clear"
						end
					end
					system "clear"
					puts "You defeated the monster(s)!"
					puts ""
					describe_doors
					show_stats(player)
				else
					show_stats(player)
				end
			else
				puts ""
				puts "The room is empty"
				show_stats(player)
			end
		end
		puts ""
	end

	def describe_doors
		puts "Misterious voice: Welcome to my dungeon!!"
		puts ""
		@doors.each_with_index do |item,index|
			case index
				when 0
					if item == 1
						puts "Northern door is open"
					else
						puts "Northern door is closed"
					end
				when 1
					if item == 1
						puts "Eastern door is open"
					else
						puts "Eastern door is closed"
					end
				when 2
					if item == 1
						puts "Southern door is open"
					else
						puts "Southern door is closed"
					end
				when 3
					if item == 1
						puts "Western door is open"
					else
						puts "Western door is closed"
					end
			end
		end
	end

	def show_stats(player)
		puts ""
		puts "Hp: #{player.hp}    Mp: #{player.mp}    Coins: #{player.money}"
		puts ""
	end

	def check_door(dir)
		@doors[dir-1]
	end
end

class Player
	attr_reader :hp, :money, :mp
	def initialize
		@hp = 5
		@mp = 20
		@money = 0
	end

	def low_hp
		@hp = 0
	end

	def lose_hp
		puts "Misterious voice: HaHaHa! Wrong door nitwit!!"
		puts "Ill take one of your lives as payment"
		puts ""
		@hp -= 1
	end

	def lose_mp(cost)
		@mp -= cost
	end

	def increase_mp(value)
		if @mp < 19
			@mp += value
		elsif @mp == 19
			@mp += 1
		end
	end

	def increase_money(coins)
		@money += coins
	end

	def pay(coins)
		@money -= coins
	end

	def fight_menu(monsters)
		puts "There are still monster(s) left!"
		puts ""
		puts "What attack do yo want to do?"
		puts "1. Kame hame ha (2 mana points)"
		puts "2. Hadouken (5 mana points)"
		puts "3. Tecnica secreta de la hoja: Mil años de dolor (10 mana points)"
		puts "4. Defender (0 mana points)"
		puts ""
		@fight_op = gets.chomp().to_i
		puts ""
	end

	def fight(monsters)
		system "clear"
		cont = monsters
		while cont > 0
			fight_menu(monsters)
			while @mp == 0 && @op != 4
				if @mp == 0
					puts "You have no mp left \n Think twice your strategy!"
				end
				fight_menu(monsters)
			end
			case  @fight_op
				when 1
					lose_mp(2)
					500.times do
						system "clear"
						puts ""
						puts ""
						puts "KAAA!!!"
						puts ""
						puts ""
						puts ""
						puts ""
						puts ""
						puts "   o"
						puts ""
					end
					500.times do
						system "clear"
						puts ""
						puts ""
						puts "KAAA"
						puts "     MEEEEE!!!"
						puts ""
						puts ""
						puts ""
						puts ""
						puts "   O"
						puts ""
					end
					500.times do
						system "clear"
						puts ""
						puts ""
						puts "KAAA"
						puts "     MEEEEE"
						puts "            HAAAAA!!!"
						puts ""
						puts ""
						puts ""
						puts "   (O)"
						puts ""
					end
					500.times do
						system "clear"
						puts ""
						puts ""
						puts "KAAA"
						puts "     MEEEEE"
						puts "            HAAAAA"
						puts "                   MEEEE!!!"
						puts ""
						puts ""
						puts "              =>D)"
						puts ""
					end
					500.times do
						system "clear"
						puts ""
						puts ""
						puts "KAAA"
						puts "     MEEEEE"
						puts "            HAAAAA"
						puts "                   MEEEE"
						puts "                         HAAAAAAAAAAAAAAAAAAAAAA!!!"
						puts ""
						puts "                                        ---=>>D)"
						puts ""
					end
				when 2
					lose_mp(5)
					500.times do
						system "clear"
						puts ""
						puts ""
						puts ""
						puts ""
						puts "HADOUUUUUUUUUUUUUKEN!!"
						puts ""
						puts ""
						puts ""
						puts ""
						puts ""
					end
					500.times do
						system "clear"
						puts ""
						puts ""
						puts ""
						puts ""
						puts ""
						puts "HADOUUUUUUUUUUUUUKEN!!"
						puts ""
						puts ""
						puts ""
						puts ""
					end
					500.times do
						system "clear"
						puts ""
						puts ""
						puts ""
						puts ""
						puts ""
						puts ""
						puts "HADOUUUUUUUUUUUUUKEN!!"
						puts ""
						puts ""
						puts ""
					end
					500.times do
						system "clear"
						puts ""
						puts ""
						puts ""
						puts ""
						puts ""
						puts ""
						puts ""
						puts "HADOUUUUUUUUUUUUUKEN!!"
						puts ""
						puts ""
					end
					500.times do
						system "clear"
						puts ""
						puts ""
						puts ""
						puts ""
						puts ""
						puts ""
						puts ""
						puts "HADOUUUUUUUUUUUUUKEN!!"
						puts ""
					end	
				when 3	
					lose_mp(10)
					500.times do
						system "clear"
						puts ""
						puts ""
						puts ""
						puts ""
						puts ""
						puts "o=         (( |"
						puts ""
						puts ""
						puts ""
						puts ""
					end
					500.times do
						system "clear"
						puts ""
						puts ""
						puts ""
						puts ""
						puts ""
						puts "  o=      (( |"
						puts ""
						puts ""
						puts ""
						puts ""
					end
					500.times do
						system "clear"
						puts ""
						puts ""
						puts ""
						puts ""
						puts ""
						puts "    o=    (( |"
						puts ""
						puts ""
						puts ""
						puts ""
					end
					500.times do
						system "clear"
						puts ""
						puts ""
						puts ""
						puts ""
						puts ""
						puts "      o=  (( |"
						puts ""
						puts ""
						puts ""
						puts ""
					end
					500.times do
						system "clear"
						puts ""
						puts ""
						puts ""
						puts ""
						puts ""
						puts "        o=(( |"
						puts ""
						puts ""
						puts ""
						puts ""
					end		
			end
			if @fight_op != 4
				cont -= 1
			else
				500.times do
						system "clear"
						puts ""
						puts "D"
						puts "  E"
						puts ""
						puts ""
						puts ""
						puts ""
						puts ""
						puts ""
						puts ""
					end
					500.times do
						system "clear"
						puts ""
						puts "D"
						puts "  E"
						puts "    F"
						puts "      E"
						puts ""
						puts ""
						puts ""
						puts ""
						puts ""
					end
					500.times do
						system "clear"
						puts ""
						puts "D"
						puts "  E"
						puts "    F"
						puts "      E"
						puts "        N"
						puts ""
						puts ""
						puts ""
						puts ""
					end
					500.times do
						system "clear"
						puts ""
						puts "D"
						puts "  E"
						puts "    F"
						puts "      E"
						puts "        N"
						puts "          S"
						puts "            E"
						puts ""
						puts ""
					end
					500.times do
						system "clear"
						puts ""
						puts "D"
						puts "  E"
						puts "    F"
						puts "      E"
						puts "        N"
						puts "          S"
						puts "            E"
						puts "              !!"
						puts ""
					end	
			end
		end
	end

	def check_alive
		if @hp == 0 
			false
		else
			true
		end
	end
end

system "clear"
@player = Player.new

def menu
	puts "The dungeon master is awaiting for your decision, what will you do?"
	puts ""
	puts "(1) Go north"
	puts "(2) Go east"
	puts "(3) Go south"
	puts "(4) Go west"
	puts "(5) End your suffering and die"
	puts ""
	puts "                          Beware of your choice!!"
	puts ""
	@op = gets.chomp().to_i
	puts ""
end

def generate_room
	@habitacion = Room.new
	@player.increase_mp (2)
	#if(@habitacion.open_doors > 0)
	@habitacion.room_description(@player)
end

def enter_new_room
	if(@habitacion.check_door(@op)==1)
		generate_room
	else
		if(@player.money > 5)
			puts "Would you like to pay 5 golden coins to open the door? (Input y to open)"
			pay_response = gets.chomp
			if(pay_response == "y")
				puts ""
				puts "Thank you, you may now pass"
				puts ""
				@player.pay(5)
			else
				puts ""
				puts "You shall not pass!!"
				puts ""
				@player.lose_hp
			end
		else
			@player.lose_hp
		end
		if !@player.check_alive
			puts "HAHAHAHA!! Rot in hell noobie!!!"
			puts ""
		else
			generate_room
		end
	end
end

generate_room

while @player.check_alive do
	#@habitacion.room_description(@player)
	if @habitacion.open_doors > 0 
		menu
		system "clear"
	else
		@op = 999111999
	end
	case @op
		when 1
			enter_new_room
		when 2
			enter_new_room
		when 3
			enter_new_room
		when 4
			enter_new_room
		when 5
			@player.low_hp
			puts "Misterious voice: HA! Coward! You will now rot in my magical realm forever!!!"
			break
		when 999111999
			break
	end
end