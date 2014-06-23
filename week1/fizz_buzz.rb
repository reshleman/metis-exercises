1.upto(100) do |index|
  if index % 15 == 0
    puts "FizzBuzz"
  elsif index % 3 == 0
    puts "Fizz"
  elsif index % 5 == 0
    puts "Buzz"
  else
    puts index
  end
end
