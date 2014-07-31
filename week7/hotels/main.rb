require_relative 'database'
require_relative 'search_engine'

database = Database.new()

SearchEngine.new(database).prompt
