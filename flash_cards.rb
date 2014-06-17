class Card

  def initialize(attributes)
    @front = attributes[:front]
    @back = attributes[:back]
  end

  def display
    puts "#{front} - #{back}"
  end

  private

  attr_accessor :front, :back
end

card = Card.new({front: "gato", back: "cat"})
card.display
