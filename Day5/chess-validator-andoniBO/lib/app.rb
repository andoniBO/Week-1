require 'pry'
require 'colorize'

module Translator

	def translate_pos(pos)
		position = Array.new
		pos2 = pos.split("")
		position[0] = pos2[0].ord.to_i - 97
		position[1] = 8 - pos2[1].to_i
		position[2] = pos2[3].ord.to_i - 97
		position[3] = 8 - pos2[4].to_i
		position
	end
end

class Rook
	include Translator

	def initialize()
	end

	def check_move(board, pos_start, pos_end)
		if pos_end[0] <= board.chessboard.length - 1 && pos_end[0] >= 0 && pos_end[1] <= board.chessboard.length - 1 && pos_end[1] >= 0
			if pos_start[0] == pos_end[0] || pos_start[1] == pos_end[1]
				if board.chessboard[pos_end[0]][pos_end[1]] == "--"
					puts "LEGAL"
				else
					puts "Occupied spot"
				end
			else
				puts "This piece doesnt move like that"
			end
		else
			puts "You cant move your piece outside the board"
		end
	end
end

class Bishop
	include Translator

	def initialize()
	end

	def check_move(board, pos_start, pos_end)
		if pos_end[0] <= board.chessboard.length - 1 && pos_end[0] >= 0 && pos_end[1] <= board.chessboard.length - 1 && pos_end[1] >= 0
			if pos_end[0] - pos_start[0] == pos_end[1] - pos_start[1] || pos_end[0] - pos_start[0] == (pos_end[1] - pos_start[1]) * -1
				if board.chessboard[pos_end[0]][pos_end[1]] == "--"
					puts "LEGAL"
				else
					puts "Occupied spot"
				end
			else
				puts "This piece doesnt move like that"
			end
		else
			puts "You cant move your piece outside the board"
		end
	end
end

class Queen
	include Translator

	def initialize()
	end
	
	def check_move(board, pos_start, pos_end)
		if pos_end[0] <= board.chessboard.length - 1 && pos_end[0] >= 0 && pos_end[1] <= board.chessboard.length - 1 && pos_end[1] >= 0
			if pos_start[0] == pos_end[0] || pos_start[1] == pos_end[1] || pos_end[0] - pos_start[0] == pos_end[1] - pos_start[1] || pos_end[0] - pos_start[0] == (pos_end[1] - pos_start[1]) * -1
				if board.chessboard[pos_end[0]][pos_end[1]] == "--"
					puts "LEGAL"
				else
					puts "Occupied spot"
				end
			else
				puts "This piece doesnt move like that"
			end
		else
			puts "You cant move your piece outside the board"
		end
	end
end

class Knight
	include Translator

	def initialize()
	end
	
	def check_move(board, pos_start, pos_end)
		if pos_end[0] <= board.chessboard.length - 1 && pos_end[0] >= 0 && pos_end[1] <= board.chessboard.length - 1 && pos_end[1] >= 0
			if (pos_end[0] - 2 == pos_start[0] || pos_end[0] + 2 == pos_start[0]) && (pos_end[1] + 1 || pos_end[1] -1) ||
				(pos_end[1] - 2 == pos_start[1] || pos_end[1] + 2 == pos_start[1]) && (pos_end[0] + 1 || pos_end[0] -1)
				if board.chessboard[pos_end[0]][pos_end[1]] == "--"
					puts "LEGAL"
				else
					puts "Occupied spot"
				end
			else
				puts "This piece doesnt move like that"
			end
		else
			puts "You cant move your piece outside the board"
		end
	end
end

class King
	include Translator

	def initialize()
	end
	
	def check_move(board, pos_start, pos_end)
		if pos_end[0] <= board.chessboard.length - 1 && pos_end[0] >= 0 && pos_end[1] <= board.chessboard.length - 1 && pos_end[1] >= 0
			if ((pos_end[0] > pos_start[0] - 2) && (pos_end[0] < pos_start[0] + 2)) &&
				((pos_end[1] > pos_start[1] - 2) && (pos_end[1] < pos_start[1] + 2))
				if board.chessboard[pos_end[0]][pos_end[1]] == "--"
					puts "LEGAL"
				else
					puts "Occupied spot"
				end
			else
				puts "This piece doesnt move like that"
			end
		else
			puts "You cant move your piece outside the board"
		end
	end
end

class Pawn
	include Translator

	def initialize()
	end
	
	def check_move(board, pos_start, pos_end)
		if pos_end[0] <= board.chessboard.length - 1 && pos_end[0] >= 0 && pos_end[1] <= board.chessboard.length - 1 && pos_end[1] >= 0
			if pos_start[1] > 3
				if pos_start[1] == 6
					margin = 2
				else
					margin = 1
				end
				if pos_end[1] >= pos_start[1] - margin && pos_end[0] == pos_start[0]
					if board.chessboard[pos_end[0]][pos_end[1]] == "--"
						puts "LEGAL"
					else
						puts "Occupied spot"
					end
				else
				puts "This piece doesnt move like that"
				end
			else
				if pos_start[1] == 1
					margin = 2
				else
					margin = 1
				end
				if pos_end[1] <= pos_start[1] + margin && pos_end[0] == pos_start[0]
					if board.chessboard[pos_end[0]][pos_end[1]] == "--"
						puts "LEGAL"
					else
						puts "Occupied spot"
					end
				else
				puts "This piece doesnt move like that"
				end
			end
		else
			puts "You cant move your piece outside the board"
		end
	end
end

class Board
	attr_reader :chessboard

	def initialize(file)
		chessline = Array.new
		@chessboard = Array.new(8, chessline)

		oldboardinfo = IO.read(file).split("\n")

		(0..7).each do |i|
			boardinfo = oldboardinfo[i].split(" ")
			boardinfo.each_with_index do |d, index|
				if index % 2 != 0
					@chessboard[i].push(d)
				end
			end
		end
#		print (boardinfo[0][0] + boardinfo[0][1])
#		puts ""


=begin
		@chessboard = [[:bR, :bN, :bB, :bQ, :bK, :bB, :bN, :bR], 
						[:bP, :bP, :bP, :bP, :bP, :bP, :bP, :bP], 
						["--", "--", "--", "--", "--", "--", "--", "--"], 
						["--", "--", "--", "--", "--", "--", "--", "--"], 
						["--", "--", "--", "--", "--", "--", "--", "--"], 
						["--", "--", "--", "--", "--", "--", "--", "--"], 
						[:wP, :wP, :wP, :wP, :wP, :wP, :wP, :wP], 
						[:wR, :wN, :wB, :wQ, :wK, :wB, :wN, :wR]]
=end
	end

	def fill_board
		@chessboard.each_with_index do |x, ind_x|
			x.each_with_index do |y, ind_y|
				#board[ind_x][ind_y] = "#{ind_x}, #{ind_y}"
				@chessboard[ind_x][ind_y] = "-"
			end
		end
	end

	def show_board
		@chessboard.each_with_index do |x, ind_x|
#			print "["
			x.each_with_index do |y, ind_y|
#				if ind_y == x.length-1

#colorize
#				if (ind_x % 2 == 0 && ind_y % 2 == 0) || (ind_x != ind_y && ((ind_y % 2 != 0 && ind_x % 2 == 0) || (ind_x % 2 != 0 && ind_x % 2 == 0)))
#					print "#{@chessboard[ind_x][ind_y]} ".colorize(:color => :white, :background => :black)
#				else
#					print "#{@chessboard[ind_x][ind_y]} ".colorize(:color => :black, :background => :white)
#				end

				print "#{@chessboard[ind_x][ind_y].to_s} |"
#				else
#					print "#{@chessboard[ind_x][ind_y]}]["
#				end
			end
#			puts "]"
			puts ""
		end
	end
end

def exec_mov(data)
end


#chessboard = Board.new()
chessboard = Board.new("simple_board.txt")
rook = Rook.new

movements = IO.read("simple_moves.txt")
mov_array = movements.split("\n")
#mov_array.map{|a| a.split(" ")}

#chessboard.fill_board
chessboard.show_board

#traductor = Translator.new
#traductor.translate_pos(mov_array[0])
#pos = mov_array[0]
#traductor.translate_pos(pos)
#puts mov_array[0][4]