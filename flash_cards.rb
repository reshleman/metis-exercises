class Card
  def initialize(attributes)
    @front = attributes[:front]
    @back = attributes[:back]
  end

  def play
    print "#{front} > "
    guess = gets.chomp

    if correct?(guess)
      puts "Correct!"
    else
      puts "Sorry, the correct answer is #{back}."
    end
  end

  private

  attr_reader :front, :back

  def correct?(guess)
    guess.downcase == back.downcase
  end
end

class CardDeck
  def initialize(name, cards)
    @name = name
    @cards = cards
  end

  def play
    cards.shuffle.each do |card|
      card.play
    end
  end

  private

  attr_reader :cards, :name
end

spanish_cards = [
  Card.new({front: "gato", back: "cat"}),
  Card.new({front: "rojo", back: "red"}),
  Card.new({front: "mono", back: "monkey"})
]

spanish_deck = CardDeck.new("spanish", spanish_cards)
spanish_deck.play
