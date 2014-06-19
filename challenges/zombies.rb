class Scenario
  def initialize(file)
    @file = file
    @dictionary_size = file.gets.to_i
    @dictionary = read_lines(dictionary_size)
    @zombie_words_size = file.gets.to_i
    @zombie_words = read_lines(zombie_words_size)
  end

  def decipher
    zombie_words.each do |zombie_word|
      print_matches(zombie_word)
    end
  end

  private

  attr_reader :file, :dictionary_size, :dictionary, :zombie_words_size, :zombie_words

  def read_lines(count)
    count.times.map { file.gets.chomp }
  end

  def print_matches(zombie_word)
    matches = []
    dictionary.each do |dictionary_word|
      haystack = dictionary_word
      needle = /[#{Regexp.quote(zombie_word)}]{#{haystack.length}}/
      if haystack =~ needle
        matches << "#{haystack}?"
      end
    end
    if matches.length != 0
      puts "Did you mean:"
      puts matches
    else
      puts "No matches found."
    end
    puts
  end
end

file = File.new("io_files/zombies.in", "r")
scenario_count = file.gets.to_i
scenario_count.times do
  Scenario.new(file).decipher
end
