class Hash
  def each
    #without using keys.each =)
    hash_keys = keys
    index = 0
    while index < hash_keys.length
      key = hash_keys[index]
      yield key, self[key]
      index += 1
    end
  end
end

{ dog: "woof", cat: "meow", snake: "ssss" }.each do |key, value|
  puts "#{key} says #{value}"
end
