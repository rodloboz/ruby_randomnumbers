
module Menu
	def menu
	    "
	    Welcome to the GetRich Number Generator!
	    ********************************

	    Options:
	    (1) Generate Random Key 
	    (Q) Quit

	    ********************************
	    "
    end

    def show
    	menu
    end
end

module Promptable

	def prompt(message = 'What would you like to do?', symbol = ':> ')
		print message
		print symbol
		gets.chomp
	end
end

# Generate random numbers: 
# (t) amount of numbers to generate
# (r) range of number available
def randomize(t, r, array)
	while array.length < t do
		n = rand(r) + 1 
		unless array.include?(n) 
			array.push(n)
		end
	end
	array.sort!
end


if __FILE__ == $PROGRAM_NAME

	include Menu
	include Promptable
	my_numbers = []
	my_stars = []

	#menu
	until ['q'].include?(user_input = prompt(show).downcase)
	    case user_input
	     	when '1'
	     		#generate random key
	     		randomize(5, 50, my_numbers)
	            randomize(2, 12, my_stars)
	            puts "Numbers: #{my_numbers}"
	            puts "Stars: #{my_stars}"
	        else
	          	#error message
	          	puts 'Please select a valid option'
	    end
	    puts 'Press ENTER to continue'
	    gets.chomp
	    my_numbers = []
	    my_stars = []
	end
end

