require_relative 'hotel'
require_relative 'database'
require_relative 'user_prompter'

database = Database.new()

UserPrompter.new(database).prompt
