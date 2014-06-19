require 'csv'

class MusicDatabase
  def initialize(file)
    @database = {}
    CSV.foreach(file) do |row|
      artist = row[3]
      song = row[0]
      if !database[artist]
        database[artist] = [song]
      else
        database[artist] << song
      end
    end
  end

  def run
    loop do
      print "Query: "
      artist = gets.chomp
      if artist != ""
        puts
        print_heading(artist)
        puts query(artist)
        puts
      else
        break
      end
    end
  end

  private

  attr_reader :database

  def print_heading(artist)
    greeting = "* Songs by #{artist} *"
    puts "*" * greeting.size
    puts greeting
    puts "*" * greeting.size
  end

  def query(artist)
    database[artist]
  end
end

MusicDatabase.new("music.csv").run
