class Person
  attr_accessor :name
end

class Politician < Person
  attr_accessor :party

  def initialize(name, party)
    @name = name
    @party = party_validator(party)
  end

  def party= party
    @party = party_validator(party)
  end

  def party_validator(party)
    case party.downcase
    when "d"
      "Democrat"
    when "r"
      "Republican"
    else
      puts "Please enter a valid party:"
      input = gets.chomp.downcase
      party_validator(input) # Recursion
    end
  end

  def to_s # Only works within the scope of Politician
    "#{@name}: #{@party}"
  end

end

class Voter < Person
  attr_accessor :affiliation

  def initialize(name, affiliation)
    @name = name
    @affiliation = affiliation_validator(affiliation)
  end

  def affiliation= affiliation
    @affiliation = affiliation_validator(affiliation)
  end

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
      affiliation_validator(input) # Recursion
    end
  end

  def to_s
    "#{@name}: #{@affiliation}"
  end
end

class World

  def initialize
    @voters = []
    @politicians = []
    start
  end

  def start
    puts "What would you like to do"
    puts "Create List Update or Delete"
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
      puts "Please read what I said."
      start
    end
  end

  def create
    puts "Who would you like to create?"
    puts "(P)olitician or (V)oter"
    input = gets.chomp.downcase
    case input
    when "p"
      create_politician
    when "v"
      create_voter
    else
      puts "Please read what I said."
      create
    end
  end

  def create_politician
    puts "What is the polotician's name?"
    name = gets.chomp
    puts "What is the politician's party?"
    puts "(D)emocrat or (R)epublican"
    party = get_downcase
    @politicians << Politician.new(name, party)
    start
  end

  def create_voter
    puts "What is the voter's name?"
    name = gets.chomp
    puts "What is the politician's party?"
    puts "(L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral,"
    affiliation = get_downcase
    @voters << Voter.new(name, affiliation)
    start
  end

  def get_downcase
    gets.chomp.downcase
  end

  def update
    puts "Who would you like to update: (V)oter or (P)olitician?"
    input = get_downcase
    case input
    when "v"
      update_voter
    when "p"
      update_politician
    else
      puts "No matching name"
      update
    end
  end

  def update_voter
    puts "Voters:"
    puts "========"
    puts @voters
    puts "Who would you like to update?"
    name = gets.chomp
    @voters.each do |voter|
      if name == voter.name
        puts "New name?"
        new_name = gets.chomp
        puts "New Affiliation"
        puts "(L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral"
        new_affiliation = get_downcase
        voter.name = new_name
        voter.affiliation = new_affiliation
      end
    end
    start
  end

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
        politician.party = new_party
      end
    end
    start
  end

  def list
    puts @voters
    puts @politicians
    start
  end

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
      delete
    end
    start
  end

  def delete_politician
    puts "Politicians:"
    puts @politicians

    puts "Who would you like to destroy?"
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

    puts "Who would you like to destroy?"
    name = gets.chomp
    # insert delete
  end
end
World.new
