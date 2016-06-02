require 'pry'
require 'colorize'
=begin
module Translator
	#no funciona

	def translate_pos(position)
		position.each_with_index do |b, index|
			case b[0].to_s
				when "a"
					b[index] = 0
				when "b"
					b[index] = 1
				when "c"
					b[index] = 2
				when "d"
					b[index] = 3
				when "e"
					b[index] = 4
				when "f"
					b[index] = 5
				when "g"
					b[index] = 6
				when "h"
					b[index] = 7
			end
		end
		puts position
	end
end
=end

class Translator
	def initialize()
	end

	def translate_pos(pos)
		pos2 = pos.split(" ")
		position = Array.new
		pos2.each do |c|
			position.push (c.split(""))
		end
		position[0].to_s
		position[2].to_s
		#position = pos2.split("")
		position.each_with_index do |b, index|
			case b
				when "a"
					position[index] = 0
				when "b"
					position[index] = 1
				when "c"
					position[index] = 2
				when "d"
					position[index] = 3
				when "e"
					position[index] = 4
				when "f"
					position[index] = 5
				when "g"
					position[index] = 6
				when "h"
					position[index] = 7
			end
		end
		puts position
	end
end

class Rook
	#include Translator

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
	#include Translator

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
	#include Translator

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
	#include Translator

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
	#include Translator

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
	#include Translator

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

	def initialize()
#		chessline = Array.new(10)
#		@chessboard = Array.new(10,chessline)

		boardinfo = IO.read(simple_board.txt).split("\n")

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

				print "#{@chessboard[ind_x][ind_y].to_s} "
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

chessboard = Board.new()
#chessboard = Board.new("simple_board.txt")
rook = Rook.new

movements = IO.read("simple_moves.txt")
mov_array = movements.split("\n")
#mov_array.map{|a| a.split(" ")}

#chessboard.fill_board
#chessboard.show_board

traductor = Translator.new
#traductor.translate_pos(mov_array[0])
#pos = mov_array[0]
#traductor.translate_pos(pos)
#puts mov_array[0]