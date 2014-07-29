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

  VALID_MOVES = %w(R P S)

  def valid_move?
    VALID_MOVES.include?(user_move)
  end

  def get_user_move
    print "Your move? (R/P/S, q to quit) > "
    @user_move = gets.chomp.upcase
  end

  def get_ai_move
    @ai_move = VALID_MOVES[rand(VALID_MOVES.count)]
  end

  def print_result
    puts "AI played #{ai_move}"
    if ai_move == user_move
      puts "Tie"
    elsif(
      (ai_move == "P" && user_move == "R") ||
      (ai_move == "R" && user_move == "S") ||
      (ai_move == "S" && user_move == "P")
    )
      puts "AI wins"
    else
      puts "You win"
    end
  end
end

Round.new.play
