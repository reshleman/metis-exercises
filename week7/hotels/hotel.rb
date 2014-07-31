require_relative 'digit_extractor'

class Hotel
  attr_reader :name

  def initialize(options)
    @name = options.fetch(:hotel)
    @city = options.fetch(:city)
    @phone = options.fetch(:phone_number)
    @single_rooms = DigitExtractor.new(options.fetch(:number_of_singles)).extract
    @double_rooms = DigitExtractor.new(options.fetch(:number_of_doubles)).extract
  end

  def to_s
    "Phone number: #{phone}\n"\
    "Location: #{city}\n"\
    "Number of rooms: #{total_rooms}"
  end

  private

  attr_reader :name, :city, :phone, :single_rooms, :double_rooms

  def total_rooms
    single_rooms + double_rooms
  end
end

class NullHotel
  def to_s
    "No property found"
  end
end
