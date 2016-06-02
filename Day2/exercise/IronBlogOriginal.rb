
require 'date'
require 'colorize'

class Blog
	def initialize
		@container = Array.new
		@actualpage = 0
		@front_page = Array.new
	end

	def add_post(post)
		@container.push(post)
	end

	def calculate_pages
		@total_pages = ((@container.length / 3) + 1)
	end

	def create_front_page_with_slice
		@front_page = @container.slice(@actualpage*3,3)
	end

	def create_front_page_no_slice
		puts "Actual page is: #{@actualpage+1}".colorize(:color => :yellow, :background => :black)
		@front_page = Array.new
		initial_post = (@actualpage * 3) 
		last_post = initial_post + 2 
		@container.each_with_index do |item, index|
			if((index>=initial_post)&&(index<=last_post))
				@front_page.push(@container[index])
			end
		end
		puts "Initial post is number #{initial_post+1}".colorize(:color => :yellow, :background => :black)
		puts "Last post is number #{last_post+1}".colorize(:color => :yellow, :background => :black)
	end

	def publish_front_page
		calculate_pages
		puts "Press 1 to use slice"
		@choice = gets.chomp().to_i
		if(@choice == 1)
			create_front_page_with_slice
		else
			create_front_page_no_slice
		end
		@front_page.each do |item|
			item.printpost
		end
		(1..@total_pages).each do |item|
			if(item==@actualpage+1)
				print " #{item} ".colorize(:color => :yellow, :background => :black)
			else
				print " #{item} ".colorize(:color => :black, :background => :black)
			end
		end
		puts ""
		print ">"
		expectinput
	end

	def expectinput
		@input = gets.chomp
		if(@input == "previous")
			if(@actualpage+1 > @total_pages)
				@actualpage -= 1
				publish_front_page
			end
		elsif (@input == "next")
			if(@actualpage+1 < @total_pages)
				@actualpage += 1
				publish_front_page
			end
		else
			puts "wrong input mengz!!"
			publish_front_page
		end
	end
end

class Post
	def initialize(newtitle, newdate, newtext)
		@title = newtitle
		@date = newdate
		@text = newtext
	end

	def printpost
		puts "#{@title}".colorize(:color => :green)
		puts "***************".colorize(:color => :red)
		puts "#{@text}".colorize(:color => :blue)
		puts "---------------".colorize(:color => :white)
	end
end

class SponsoredPost < Post
	def initialize(newtitle, newdate, newtext)
		sponsoredTitle = "******" + newtitle + "******"
		super(sponsoredTitle, newdate, newtext)
	end
end

blog = Blog.new
blog.add_post(Post.new("Post title 1", Date.new(2001,2,3), "Post 1 text"))
blog.add_post(SponsoredPost.new("Post title 2", Date.new(2001,2,3), "Post 2 text"))
blog.add_post(Post.new("Post title 3", Date.new(2001,2,3), "Post 3 text"))
blog.add_post(Post.new("Post title 4", Date.new(2001,2,3), "Post 4 text"))
blog.add_post(Post.new("Post title 5", Date.new(2001,2,3), "Post 5 text"))

blog.publish_front_page