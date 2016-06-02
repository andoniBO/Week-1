require 'ruby-dictionary'
require 'pry'

class WordChain
    def initialize(dictionary)
        @dictionary = dictionary
    end

    def find_chain (word1, word2)
    	array_w1 = word1.split("")
    	array_w2 = word2.split("")
    	array_used = [false,false,false]
    	puts word1
    	while array_w1.join != word2
    		pos = 0
    		while !@dictionary.exists?(array_w1.join) || pos < array_w2.length
	    		array_aux = array_w1
    			if !array_used[pos]
	    			array_aux[pos] = array_w2[pos]
	    			if @dictionary.exists?(array_aux.join)
	    				#binding.pry
	    				puts "word exists #{array_aux.join}"
	    				#array_w1 = array_aux
	    				array_used[pos] = true
	    			else
	    				puts "Word dont exist #{array_aux.join}"
	    			end
	    		end
    			pos += 1
    		end 
    	end
    	#if @dictionary.exists?
    	#end
    end
end

dictionary = Dictionary.from_file("/usr/share/dict/words")
my_chain = WordChain.new(dictionary)
my_chain.find_chain("cat","dog")