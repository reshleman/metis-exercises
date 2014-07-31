require_relative 'database'

class SearchEngine
  def initialize(database, options = {})
    @database = database || Database.new()
    @prompt_text = options[:prompt_text] || "What property? > "
    @search_field = options[:search_field] || :name

    @current_query = ""
    @current_result = ""
  end

  def prompt
    until current_query == "q" do
      display_prompt
      get_response
      execute_query
      print_result
    end
  end

  private

  attr_reader :database, :prompt_text, :search_field, :current_query, :current_result

  def display_prompt
    print prompt_text
  end

  def get_response
    @current_query = gets.chomp
  end

  def execute_query
    @current_result = database.find_by(search_field => current_query)
  end

  def print_result
    puts
    puts current_result
    puts
  end
end
