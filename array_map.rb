class Array
  def map
    index = 0
    new_array = []

    while index < length
      element = self[index]
      new_element = yield element
      new_array << new_element
      index += 1
    end

    new_array
  end
end

i = [1, 2, 3].map do |element|
  element * 3
end

puts i
