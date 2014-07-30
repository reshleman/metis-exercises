require 'csv'

class CSVParser
  def initialize(filename, object_type = Hotel)
    @object_type = object_type
    @csv_file = CSV.read(filename, headers: true)
  end

  def get_objects()
    Array.new(csv_file.length).map.with_index do |x, row_index|
      row_as_object(csv_file[row_index])
    end
  end

  private

  attr_reader :csv_file, :object_type

  def row_as_object(row)
    object_type.new(*row_as_array(row))
  end

  def row_as_array(row)
    Array.new(csv_file.headers.size).map.with_index do |x, col_index|
      row[col_index]
    end
  end
end

