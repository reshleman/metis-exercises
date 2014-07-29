require_relative 'moves'

class Round
  def initialize
    @user_move = get_user_move until valid_move?
    @ai_move = get_ai_move
  end

  def play
    print_result
  end

  private

  attr_reader :user_move, :ai_move

  VALID_MOVES = {
    "R" => Rock,
    "P" => Paper,
    "S" => Scissors
  }

  def valid_move?
    VALID_MOVES.values.include?(user_move)
  end

  def get_user_move
    print "Your move? (R/P/S, q to quit) > "
    VALID_MOVES[gets.chomp.upcase] || nil
  end

  def get_ai_move
    @ai_move = VALID_MOVES.values.sample
  end

  def print_result
    puts "You played #{user_move}"
    puts "AI played #{ai_move}"
    if ai_move == user_move
      puts "Tie"
    elsif ai_move.beats?(user_move)
      puts "AI wins"
    else
      puts "You win"
    end
  end
end

Round.new.play
