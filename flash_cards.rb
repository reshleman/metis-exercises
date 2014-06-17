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
  attr_reader :cards, :name

  def initialize(name, cards)
    @name = name
    @cards = cards
  end

  def play
    cards.shuffle.each do |card|
      card.play
    end
  end
end

class FlashCardGame
  def initialize(decks)
    @decks = decks
  end

  def play
    loop do
      welcome
      deck = get_selected_deck
      if deck
        deck.play
      else
        break
      end
    end
  end

  private

  attr_reader :decks

  def welcome
    message = "Please select a deck."
    puts message
    puts "-" * message.size
  end

  def get_selected_deck
    selected_deck = gets.chomp
    decks.find do |deck|
      deck.name.downcase == selected_deck.downcase
    end
  end
end

spanish_cards = [
  Card.new({front: "gato", back: "cat"}),
  Card.new({front: "rojo", back: "red"}),
  Card.new({front: "mono", back: "monkey"})
]

japanese_cards = [
  Card.new({front: "ichi", back: "one"}),
  Card.new({front: "ni", back: "two"}),
  Card.new({front: "shiba", back: "dog"})
]

spanish_deck = CardDeck.new("spanish", spanish_cards)
japanese_deck = CardDeck.new("japanese", japanese_cards)

game = FlashCardGame.new([spanish_deck, japanese_deck])
game.play
