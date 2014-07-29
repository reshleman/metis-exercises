class BaseMove
  WINS_AGAINST = []

  def self.beats?(another_move)
    self::WINS_AGAINST.include?(another_move)
  end
end

class Scissors < BaseMove; end

class Rock < BaseMove
  WINS_AGAINST = [Scissors]
end

class Paper < BaseMove
  WINS_AGAINST = [Rock]
end

class Scissors < BaseMove
  WINS_AGAINST = [Paper]
end
