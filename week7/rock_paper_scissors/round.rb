class Round
  def initialize
    @user_move = ""
    @ai_move = ""
  end

  def play
    user_move
    ai_move
    print_result
  end

  private

  VALID_MOVES = %w(R P S)

  def user_move
    print "Your move? (R/P/S, q to quit) > "
    @user_move = gets.chomp.upcase
  end

  def ai_move
    @ai_move = VALID_MOVES[rand(VALID_MOVES.count)]
    puts "AI played #{@ai_move}"
  end

  def print_result
    if @ai_move == @user_move
      puts "Tie"
    elsif(
      (@ai_move == "P" && @user_move == "R") ||
      (@ai_move == "R" && @user_move == "S") ||
      (@ai_move == "S" && @user_move == "P")
    )
      puts "AI wins"
    else
      puts "You win"
    end
  end
end

Round.new.play
