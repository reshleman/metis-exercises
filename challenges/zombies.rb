class Scenario
  def initialize(file)
    @file = file
    @dictionary_size = file.gets.to_i
    @dictionary = get_words_runs(dictionary_size)
    @zombie_words_size = file.gets.to_i
    @zombie_words = get_words_runs(zombie_words_size)
  end

  def decipher
    zombie_words.each do |zombie_word, run|
      print_matches(run)
    end
  end

  private

  attr_reader :file,
              :dictionary_size,
              :dictionary,
              :zombie_words_size,
              :zombie_words

  def get_words_runs(count)
    words_hash = {}

    count.times do
      word = file.gets.chomp
      words_hash[word] = get_runs(word)
    end

    words_hash
  end

  # Replace runs of any character with a single character, then sort
  def get_runs(word)
    word.squeeze.chars.sort.join
  end

  def print_matches(zombie_word_run)
    matches = []
    dictionary.each do |dictionary_word, dictionary_word_run|
      if dictionary_word_run == zombie_word_run
        matches << "#{dictionary_word}?"
      end
    end
    if matches.length != 0
      puts "Did you mean:"
      puts matches.sort
    else
      puts "No matches found."
    end
    puts
  end
end

file = File.new("io_files/zombies.in", "r")
scenario_count = file.gets.to_i
scenario_count.times do |index|
  puts "Scenario ##{index + 1}:"
  Scenario.new(file).decipher
end
