class Array
  def each
    index = 0

    while index < length
      yield self[index]
      index += 1
    end
  end
end

[1, 2, "wombat"].each do |element|
  puts element
end
