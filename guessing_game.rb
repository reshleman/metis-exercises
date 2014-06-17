class GuessingGameRound
  def initialize(round_number = 1)
    @won = false
    @answer = rand(1..10)
    @round_number = round_number
    @guesses_used = 0
    @guesses_allowed = 3
  end

  def play
    puts "===Round #{@round_number}==="

    @guesses_allowed.times do
      make_guess

      if @won
        break
      end
    end

    print_result
  end

  def won?
    @won
  end

  def guesses_used
    @guesses_used
  end

  private

  def make_guess
    print "Guess a number 1-10 (hint: #{@answer}): "
    guess = gets.to_i

    if guess == @answer
      @won = true
    else
      puts "Incorrect."
    end

    @guesses_used += 1
  end

  def print_result
    if @won
      puts "Correct!"
    else
      puts "The answer was #{@answer}."
    end
    puts
  end
end

class GuessingGame
  def initialize
    @rounds = 5
    @rounds_won = 0
    @total_guesses = 0
  end

  def play
    @rounds.times do |current_round|
      round = GuessingGameRound.new(current_round + 1)

      round.play

      gather_statistics(round)
   end

    print_result
  end

  private

  def gather_statistics(round)
    if round.won?
      @rounds_won += 1
    end

    @total_guesses += round.guesses_used
  end

  def print_result
    puts "You won #{@rounds_won} out of #{@rounds} rounds."
    puts "You made an average of #{@total_guesses / @rounds} guesses each round."
  end

end

guessing_game = GuessingGame.new
guessing_game.play
