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

class Deck
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
    decks.each do |deck|
      print "#{deck.name} "
    end
    puts
  end

  def get_selected_deck
    selected_deck = gets.chomp
    decks.find do |deck|
      deck.name.downcase == selected_deck.downcase
    end
  end
end

class FlashCardReader
  def initialize(input_file)
    @file = File.open(input_file, "r")
    @deck_count = file.gets.to_i
  end

  def get_decks
    deck_count.times.map do
      deck_name = file.gets.chomp
      Deck.new(deck_name, get_cards)
    end
  end

  private

  attr_reader :file, :deck_count

  def get_cards
    card_count = file.gets.to_i
    card_count.times.map do
      front = file.gets.chomp
      back = file.gets.chomp
      Card.new(front: front, back: back)
    end
  end
end

decks = FlashCardReader.new("flash_cards_decks.txt").get_decks
game = FlashCardGame.new(decks)
game.play
