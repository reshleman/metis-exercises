require_relative 'csv_parser'

class Database
  def initialize(type = Hotel)
    @type = type
    @objects = load_database
  end

  def find_by(query_params = {})
    query_field = query_params.keys.first
    query_string = query_params[query_field]

    objects.select do |object|
      object.send(query_field) == query_string
    end
  end

  private

  attr_reader :type, :objects

  def load_database
    CSVParser.new("hotels.csv", type).get_objects
  end
end

