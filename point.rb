class Point
  attr_reader :x, :y

  def self.origin
    new(0, 0)
  end

  def initialize(x, y)
    @x = x
    @y = y
  end

  def distance_to(point)
    Math.sqrt((x - point.x) ** 2 + (y - point.y) ** 2)
  end

  def to_s
    "(#{x}, #{y})"
  end
end

point1 = Point.origin
point2 = Point.new(2, 2)

puts point1.distance_to(point2)
