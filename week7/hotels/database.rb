require_relative 'csv_parser'

class Database
  def initialize(options = {})
    @klass = options[:type] || Hotel
    @null_klass = options[:null_type] || Object.const_get("Null#{klass}")
    @filename = options[:filename] || "hotels.csv"

    @objects = load_database
  end

  def find_by(query_params = {})
    query_field = query_params.keys.first
    query_string = query_params[query_field]

    objects.find do |object|
      object.send(query_field) == query_string
    end || null_klass.new
  end

  private

  attr_reader :klass, :null_klass, :filename, :objects

  def load_database
    CSVParser.new(filename, klass).get_objects
  end
end

