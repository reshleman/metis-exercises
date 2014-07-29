require_relative "round"

class Game
  def initialize(rounds_count)
    @rounds_count = rounds_count
  end

  def play
    play_rounds
  end

  private

  attr_reader :rounds_count

  def play_rounds
    rounds_count.times do |index|
      puts "===Round ##{index + 1}==="
      Round.new.play
      puts
    end
  end
end

Game.new(3).play
