class Card
  attr_accessor :front, :back

  def initialize(attributes)
    @front = attributes[:front]
    @back = attributes[:back]
  end

  def show_card
    puts "#{@front} - #{@back}"
  end
end

card = Card.new({front: "gato", back: "cat"})
card.show_card
