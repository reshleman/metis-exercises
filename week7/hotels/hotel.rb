class Hotel
  attr_reader :name

  def initialize(name, city, phone, single_rooms, double_rooms)
    @name = name
    @city = city
    @phone = phone
    @single_rooms = single_rooms
    @double_rooms = double_rooms
  end

  def to_s
    "Phone number: #{phone}\n"\
    "Location: #{city}\n"\
    "Number of rooms: #{total_rooms}"
  end

  private

  attr_reader :name, :city, :phone, :single_rooms, :double_rooms

  def total_rooms
    single_rooms.to_i + double_rooms.to_i
  end
end
