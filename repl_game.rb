def put_a_line
  puts "*" * 100
end

def get_input
  gets.chomp.capitalize
end

def invalid_input(valid_options)
  puts "Invalid input. Options are: " + valid_options + " If you'd like to quit enter 'Q':"
end

def choose_again
  puts "Choose Again?"
end

def quit_game
  puts "Bye!"
  abort
end

def intro
  put_a_line
  puts "WELCOME TO the Choose Your Own Adeventure Wyncode bootcamp REPL GAME"
  puts "It's 2016, you've recognized the trends in software development for the past year and codeAcademy ain't cutting it. What do you do?"
  put_a_line
  puts "Options: 'E' Enroll at a bootcamp, 'C' continue self studying, 'G' Give up. CASE DOES NOT MATTER"
end

def question2
  put_a_line
  puts "You decide to enroll in a bootcamp. Suprise, it's Wyncode!"
  puts "You pass the interview with flying colors and handed the CodeAcademy pre-work."
  puts "You finish the HTML & CSS courses. Now what do you do?"
  put_a_line
  puts "('R' for Ruby, 'J' for Javascript)"
end

def question3
  put_a_line
  puts "You work on Ruby. You go over the expected time of completion but you finish it."
  puts "The class starts tommorow and your mac isn't properly configured."
  put_a_line
  puts "What do you do? ('P' for Panic, 'H' for Get help at orientation.)"
end

intro
while option = get_input
  if option == "E"
    break
  elsif option == "C"
    puts "You continue self studying. It takes you another 10 years but you're a master in a now deprecated language."
    abort
  elsif option == "G"
    puts "You give up. You continue on with your life."
    abort
  elsif option == "Q"
    quit_game
  else
    invalid_input("'E' Enroll at a bootcamp, 'C' continue self studying, 'G' Give up. ")
    choose_again
  end
end

question2
while option = get_input
  if option == "J"
    puts "You choose Javascript. Your browser crashes somewhere between a hundred to a thousand times but you finish it within a week"
    break
  elsif option == "R"
    break
  elsif option == "Q"
    quit_game
  else
    invalid_input("('R' for Ruby, 'J' for Javascript)")
    choose_again
  end
end

question3
while option = get_input
  if option == "P" # Part 1
    puts "You panic. The computer catches on fire."
    abort
  elsif option == "H"
    puts "You wait until class starts and get help. The instructor helps you properly setup your environment."
    puts "The end, for now..."
    abort
  elsif option == "Q"
    quit_game
  else
    invalid_input("'P' for Panic, 'H' for Get help at orientation. 'Q' to quit")
    choose_again
  end
end
