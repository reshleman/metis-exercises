require_relative 'database'

class UserPrompter
  def initialize(database)
    @database = database || Database.new()
    @current_query = ""
    @current_result = ""
  end

  def prompt
    display_prompt
    get_response
    execute_query
    print_result
  end

  private

  attr_reader :database, :current_query, :current_result

  def display_prompt
    print "What property? > "
  end

  def get_response
    @current_query = gets.chomp
  end

  def execute_query
    @current_result = database.find_by(name: current_query)
  end

  def print_result
    puts current_result.inspect
  end
end
