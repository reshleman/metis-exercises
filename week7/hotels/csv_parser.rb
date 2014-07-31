require 'csv'

class CSVParser
  def initialize(filename, klass = Hotel)
    @klass = klass
    @csv_file = CSV.table(filename)
  end

  def get_objects()
    csv_file.map { |row| klass.new(row) }
  end

  private

  attr_reader :csv_file, :klass
end

