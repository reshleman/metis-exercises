class Hotel
  attr_reader :name

  def initialize(name, city, phone, single_rooms, double_rooms)
    @name = name
    @city = city
    @phone = phone
    @single_rooms = single_rooms
    @double_rooms = double_rooms
  end
end
