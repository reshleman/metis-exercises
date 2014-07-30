require 'csv'

class CSVReader
  def initialize(filename, type = Hotel)
    @type = type
    @csv_file = CSV.read(filename, headers: true)
  end

  def get_objects()
    Array.new(csv_file.length).map.with_index do |x, row_index|
      create_object(csv_file[row_index])
    end
  end

  private

  attr_reader :csv_file, :type

  def create_object(row)
    type.new(*row_as_array(row))
  end

  def row_as_array(row)
    Array.new(csv_file.headers.size).map.with_index do |x, col_index|
      row[col_index]
    end
  end
end

require_relative 'hotel'

CSVReader.new("hotels.csv").get_objects.each { |object| puts object.name }
