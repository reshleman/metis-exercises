require 'csv'

class CSVParser
  def initialize(filename, klass = Hotel)
    @klass = klass
    @csv_file = CSV.table(filename)
  end

  def get_objects()
    Array.new(csv_file.length).map.with_index do |x, row_index|
      row_as_object(csv_file[row_index])
    end
  end

  private

  attr_reader :csv_file, :klass

  def row_as_object(row)
    klass.new(*row_as_array(row))
  end

  def row_as_array(row)
    Array.new(csv_file.headers.size).map.with_index do |x, col_index|
      row[col_index]
    end
  end
end

