class Lottery
  def initialize
    @names = []
  end

  def play
    welcome
    get_names
    print_winner
  end

  private

  attr_reader :names
  
  def welcome
    puts "Enter in a list of names followed by a blank line to start the lottery"
  end

  def get_names
    loop do
      print "> "

      name = gets.chomp
      if name != ""
        names << name
      else
        break
      end
    end
  end

  def print_winner
    winner = names.sample
    puts "#{winner} wins!"
  end
end

Lottery.new.play
