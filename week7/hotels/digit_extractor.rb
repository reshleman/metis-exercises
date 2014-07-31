class DigitExtractor
  def initialize(str)
    @str = str.to_s
  end

  def extract
    str.chars.select { |char| is_digit?(char) }.join.to_i
  end

  private

  attr_accessor :str

  def is_digit?(char)
    ("0".."9").cover?(char)
  end
end
