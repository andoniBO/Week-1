require 'date'
require 'colorize'

class Blog
	def initialize
		@container = Array.new
		@actual_page = 0
		@front_page = Array.new
	end

	def add_post(post)
		@container.push(post)
	end

	def publish_front_page
		@total_pages = @container.length / 3 + 1
		@container.sort {|item, item2| item2.date <=> item.date}
		@front_page = @container.slice(@actual_page * 3, 3)
		@front_page.each {|item|	print_post(item)}
		(1..@total_pages).each do |item|
			if(item == @actual_page + 1)
				print " #{item} ".colorize(:color => :yellow, :background => :black)
			else
				print " #{item} ".colorize(:color => :black, :background => :black)
			end
		end
		puts ""
		print ">"
		expect_input
	end

	def expect_input
		@input = gets.chomp
		if(@input == "previous")
			if(@actual_page + 1 > 1)
				@actual_page -= 1
			end
		elsif (@input == "next")
			if(@actual_page + 1 < @total_pages)
				@actual_page += 1
			end
		else
			puts "wrong input, try again"
		end
		publish_front_page
	end

	def print_post(item)
		if !item.is_sponsored
			puts "#{item.title}".colorize(:color => :green)
			puts "***************".colorize(:color => :red)
			puts "#{item.text}".colorize(:color => :blue)
			puts "---------------".colorize(:color => :white)
		else
			puts "******#{item.title}******".colorize(:color => :green)
			puts "***************".colorize(:color => :red)
			puts "#{item.text}".colorize(:color => :blue)
			puts "---------------".colorize(:color => :white)
		end
	end
end

class Post
	attr_reader :is_sponsored, :title, :date, :text
	def initialize(new_title, new_date, new_text, is_sponsored = false)
		@title = new_title
		@date = new_date
		@text = new_text
		@is_sponsored = is_sponsored
	end
end


blog = Blog.new

blog.add_post(Post.new("Post title 1", Date.new(2001,2,3), "Post 1 text"))
blog.add_post(Post.new("Post title 2", Date.new(2002,2,3), "Post 2 text", true))
blog.add_post(Post.new("Post title 3", Date.new(2005,2,3), "Post 3 text"))
blog.add_post(Post.new("Post title 4", Date.new(2003,2,3), "Post 4 text"))
blog.add_post(Post.new("Post title 5", Date.new(2008,2,3), "Post 5 text"))
blog.add_post(Post.new("Post title 6", Date.new(2012,2,3), "Post 6 text"))
blog.add_post(Post.new("Post title 7", Date.new(2015,2,3), "Post 7 text", true))
blog.add_post(Post.new("Post title 8", Date.new(2012,2,3), "Post 8 text"))
blog.add_post(Post.new("Post title 9", Date.new(2024,2,3), "Post 9 text"))
blog.add_post(Post.new("Post title 10", Date.new(2022,2,3), "Post 10 text"))

blog.publish_front_page
