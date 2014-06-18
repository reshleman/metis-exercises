# Multiples of 3 and 5
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

class MultiplesProblem
  def initialize(last_number)
    @numbers = []
    @last_number = last_number
  end

  def solve
    fill_array_with_multiples
    sum_array
  end

  private

  attr_reader :numbers, :last_number

  def fill_array_with_multiples
    1.upto(last_number) do |index|
      if index % 3 == 0
        numbers << index
      elsif index % 5 == 0
        numbers << index
      end
    end
  end

  def sum_array
    sum = 0

    numbers.each do |value|
      sum += value
    end

    puts sum
  end
end

MultiplesProblem.new(9).solve
MultiplesProblem.new(999).solve
