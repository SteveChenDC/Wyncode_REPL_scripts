# Declares Person class
class Person
  # Creates getter and setter method for name
  attr_accessor :name
end

# Declares politician method, inherits name method from Person class
class Politician < Person
  # Creates getter and setter method for party
  attr_accessor :party
  # Initialize method for Politician.new
  def initialize(name, party)
    # name parameter is set to @name instance variable
    @name = name
    # party parameter is passed through the validator then set to @party
    @party = party_validator(party)
  end

  # Unecessary, already accessable in attr_accessor
  # def party= party
  #   @party = party_validator(party)
  # end

  # Party validator method, passes party argument
  def party_validator(party)
    # Downcases party
    case party.downcase
    # Returns democrat when input is d
    when "d"
      "Democrat"
    # Returns democrat when input is r
    when "r"
      "Republican"
    else # For invalid inputs
      puts "Please enter a valid party:"
      input = gets.chomp.downcase
      # Uses recursion to re-run in a loop before until valid
      party_validator(input)
    end
  end

  # Instances interpolated whenever puts is used or converted to string.
  def to_s # Only works within the scope of Politician
    "#{@name}- #{@party}"
  end

end

# Voter class inherits name from Person
class Voter < Person
  # Getter and setter method for affiliation
  attr_accessor :affiliation

  # When a voter is created it sets name and affiliation
  def initialize(name, affiliation)
    @name = name
    @affiliation = affiliation_validator(affiliation)
  end

  # def affiliation= affiliation
  #   @affiliation = affiliation_validator(affiliation)
  # end

  # Validates affiliation
  def affiliation_validator(affiliation)
    case affiliation.downcase
    when "l"
      "Liberal"
    when "c"
      "Conservative"
    when "t"
      "Tea Party"
    when "s"
      "Socialist"
    when "n"
      "Neutral"
    else
      puts "Please enter a valid party:"
      input = gets.chomp.downcase
      affiliation_validator(input)
    end
  end

  def to_s
    # Instances interpolated whenever puts is used or converted to string.
    "#{@name}- #{@affiliation}"
  end
end

# World class. Has general CRUD methods and intialize voter and politican arrays
class World
  # Intializes sim when World.new is ran and starts.
  def initialize
    @voters = []
    @politicians = []
    start
  end
  # Quick method for readability.
  def put_line
    puts "-------------" * 5
  end
  # Starts CRUD/CLUD loop. Prompts user for input.
  def start
    put_line
    puts "What would you like to do"
    puts "Create List Update or Delete"
    put_line
    input = gets.chomp.downcase
    case input
    when "c"
      create
    when "l"
      list
    when "u"
      update
    when "d"
      delete
    else
      puts "Invalid input. Please enter (C)reate, (L)ist, (U)pdate or (Delete)"
      start
    end
  end

  # Create method that runs when user inputs "c"
  def create
    put_line
    puts "Who would you like to create?"
    puts "(P)olitician or (V)oter"
    put_line
    input = gets.chomp.downcase
    case input # Based on input, will run create_politician or create_voter
    when "p"
      create_politician
    when "v"
      create_voter
    else
      puts "Invalid input. Re-enter:"
      create # Restarts create method loop
    end
  end

  # Create method for politician
  def create_politician
    puts "What is the polotician's name?"
    name = gets.chomp
    puts "What is the politician's party?"
    puts "(D)emocrat or (R)epublican"
    party = get_downcase
    # Creates a new politician instance and passes arguments based off input.
    @politicians << Politician.new(name, party)
    start # Begins CRUD/CLUD loop again
  end
  # Similar method as create_politician
  def create_voter
    puts "What is the voter's name?"
    name = gets.chomp
    puts "What is the politician's party?"
    puts "(L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral,"
    affiliation = get_downcase
    @voters << Voter.new(name, affiliation)
    start
  end

  # Downcases a string input for user options.
  def get_downcase
    gets.chomp.downcase
  end

  # Update method, runs when user inputs 'u' in start method
  def update
    put_line
    puts "Who would you like to update: (V)oter or (P)olitician?"
    put_line
    input = get_downcase
    case input
    when "v"
      update_voter
    when "p"
      update_politician
    else
      puts "No matching name"
      update # Loops method after invalid input
    end
  end

  def new_party_validator(party)
    # Downcases party
    case party.downcase
    # Returns democrat when input is d
    when "d"
      "Democrat"
    # Returns democrat when input is r
    when "r"
      "Republican"
    else # For invalid inputs
      puts "Please enter a valid party:"
      input = gets.chomp.downcase
      # Uses recursion to re-run in a loop before until valid
      party_validator(input)
    end
  end

  def new_affiliation_validator(new_affiliation)
    case new_affiliation.downcase
    when "l"
      "Liberal"
    when "c"
      "Conservative"
    when "t"
      "Tea Party"
    when "s"
      "Socialist"
    when "n"
      "Neutral"
    else
      puts "Please enter a valid party:"
      input = gets.chomp.downcase
      affiliation_validator(input)
    end
  end

  # Updates whenever user inputs v in update method
  def update_voter
    puts "Voters:"
    puts "========"
    puts @voters # Displays voter instances
    puts "Who would you like to update?"
    name = gets.chomp
    # Runs block.each statement accross all voters
    @voters.each do |voter|
      if name == voter.name # if voter matches a name it'll run below
        puts "New name?"
        new_name = gets.chomp
        puts "New Affiliation"
        puts "(L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral"
        new_affiliation = get_downcase
        voter.name = new_name
        # Passes new_affiliation into validator to pass actual word, not letter
        voter.affiliation = new_affiliation_validator(new_affiliation)
      end
    end
    start # else it will just restart
  end
  # Updates whenever user inputs p in update method
  def update_politician
    puts "Politicians:"
    puts "========"
    puts @politicians
    puts "Who would you like to update?"
    name = gets.chomp
    @politicians.each do |politician|
      if name == politician.name
        puts "New name?"
        new_name = gets.chomp
        puts "New Party"
        puts "(D)emocrat or (R)epublican"
        new_party = get_downcase
        politician.name = new_name
        # Passes new_party into validator to pass actual word, not letter
        politician.party = new_party_validator(new_party)
      end
    end
    start
  end



  # Ran whenever user inputs l within start method.
  # Prints all instances of person
  def list
    puts "LIST OF VOTERS AND POLITICIANS"
    put_line
    puts "Voters:"
    # Prints all instances within @voters array. Interpolated using to_s.
    puts @voters
    put_line
    # Prints all instances within @politicians array. Interpolated using to_s.
    puts "Politicians:"
    puts @politicians
    start
  end
  # Ran whenever user inputs 'd' in start method
  def delete
    puts "Who would you like to delete?"
    puts "(P)olitician or Voter"
    input = get_downcase
    case input
    when "p"
      delete_politician
    when "v"
      delete_voter
    else
      puts "Read the directions."
      delete # Loops delete method
    end
    start
  end

  def delete_politician
    puts "Politicians:"
    puts @politicians

    puts "Who would you like to delete?"
    name = gets.chomp
    @politicians.each do |politician|
      if politician.name == name
        @politicians.delete(politician)
      end
    end
    start
  end

  def delete_voter
    puts "Voters:"
    puts @voters

    puts "Who would you like to delete?"
    name = gets.chomp
    @voters.each do |voter|
      if voter.name == name
        @voters.delete(politician)
      end
    end
    start
  end
end
World.new
