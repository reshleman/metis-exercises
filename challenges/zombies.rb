class Scenario
  def initialize(file)
    @file = file
    @dictionary_size = file.gets.to_i
    @dictionary = read_lines(dictionary_size)
    @dictionary_alpha_runs = remove_runs(dictionary)
    @zombie_words_size = file.gets.to_i
    @zombie_words = read_lines(zombie_words_size)
    @zombie_words_alpha_runs = remove_runs(zombie_words)
  end

  def decipher
    zombie_words_alpha_runs.each do |zombie_alpha_run|
      print_matches(zombie_alpha_run)
    end
  end

  private

  attr_reader :file,
              :dictionary_size,
              :dictionary,
              :dictionary_alpha_runs,
              :zombie_words_size,
              :zombie_words,
              :zombie_words_alpha_runs

  def read_lines(count)
    count.times.map { file.gets.chomp }
  end

  def remove_runs(string_array)
    string_array.map do |word|
      word.squeeze.chars.sort.join #remove duplicate characters and sort
    end
  end

  def print_matches(zombie_alpha_run)
    matches = []
    dictionary.length.times do |index|
      if dictionary_alpha_runs[index] == zombie_alpha_run
        matches << "#{dictionary[index]}?"
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
