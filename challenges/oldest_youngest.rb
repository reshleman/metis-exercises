class Person
  attr_reader :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end

class OldestYoungestGame
  def initialize
    @oldest = Person.new("Nobody", -Float::INFINITY)
    @youngest = Person.new("Nobody", Float::INFINITY)
  end

  def play
    welcome
    get_people
    print_oldest_youngest
  end

  private

  attr_accessor :oldest, :youngest

  def welcome
    puts "Enter people's names and ages followed by an empty line:"
  end

  def get_people
    loop do
      input_string = gets.chomp
      if input_string == ""
        break
      end
      arr = input_string.split
      person = Person.new(arr[0], arr[1].to_i)

      if person.age > oldest.age
        self.oldest = person
      end

      if person.age < youngest.age
        self.youngest = person
      end
    end
  end

  def print_oldest_youngest
    puts "#{oldest.name} is the oldest."
    puts "#{youngest.name} is the youngest."
  end

end

OldestYoungestGame.new().play
