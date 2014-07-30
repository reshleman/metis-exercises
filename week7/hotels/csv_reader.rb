require 'csv'

class CSVReader
  def initialize(filename, type = Hotel)
    @type = type
    @csv_file = CSV.read(filename, headers: true)
  end

  def get_objects()
    objects = []
    csv_file.each do |row|
      objects << create_object(row)
    end
    objects
  end

  private

  attr_reader :csv_file, :type

  def create_object(row)
    type.new(*row_as_array(row))
  end

  def row_as_array(row)
    Array.new(csv_file.headers.count).map.with_index do |field, index|
      row[index]
    end
  end
end

require_relative 'hotel'

CSVReader.new("hotels.csv").get_objects.each { |object| puts object.name }
