class Card
  attr_accessor :front, :back

  def initialize(front, back)
    @front = front
    @back = back
  end

  def show_card
    puts "#{@front} - #{@back}"
  end
end

card = Card.new("gato", "cat")
card.show_card
