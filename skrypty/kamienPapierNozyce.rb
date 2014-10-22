#!/usr/local/bin/ruby -w

# Rock-paper-scissors-lizard-Spock template

# The key idea of this program is to equate the strings
# "rock", "paper", "scissors", "lizard", "Spock" to numbers
# as follows:
#
# 0 - rock
# 1 - Spock
# 2 - paper
# 3 - lizard
# 4 - scissors

# helper functions

@elements = {'rock'=> 0, 'Spock'=> 1, 'paper'=> 2, 'lizard'=> 3, 'scissors'=> 4}

def name_to_number(name)
    return @elements[name]
end

def number_to_name(number)
	return @elements.key(number) # ruby version 1.9 >
end

def rpsls(player_choice) 
    # print a blank line to separate consecutive games
    puts
    
    # print out the message for the player's choice
  puts "Player chooses #{player_choice}" 
    # convert the player's choice to player_number using the function name_to_number()
    pnum = name_to_number(player_choice)
    #pnum = 0
    # compute random guess for comp_number using random.randrange()
    comp_number = Random.rand(5)
    
    # convert comp_number to comp_choice using the function number_to_name()
    comp_choice = number_to_name(comp_number)
    
    # print out the message for computer's choice
    puts "Computer chooses #{comp_choice}"
    
    # compute difference of comp_number and player_number modulo five
    diff = (pnum - comp_number) % 5
    # print "Pnum = ", pnum, "Comp_Num = ", comp_number, " Diff = ", diff
    
    # use if/elif/else to determine winner, print winner message
  if (diff == 0)
        puts "Player and computer tie!"
    elsif (diff < 3)
        puts "Player wins!"
    else
        puts "Computer wins!"
  end
end

# test your code - THESE CALLS MUST BE PRESENT IN YOUR SUBMITTED CODE
rpsls("rock")
rpsls("Spock")
rpsls("paper")
rpsls("lizard")
rpsls("scissors")

# always remember to check your completed program against the grading rubric
