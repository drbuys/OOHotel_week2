require 'minitest/autorun'
require('minitest/rg')
require_relative('../hotel.rb')
require_relative('../people.rb')
require_relative('../room.rb')

class TestHotel < MiniTest::Test

  def setup
    @guest1 = People.new("Dave Jnr", 5, 2)
    @guest2 = People.new("Sir Walter", 2, 2)
    @guest3 = People.new("Princess Leia", 1, 1)
    @guest4 = People.new("Bobba Fett", 10, 1)
    @guest5 = People.new("Mary Poppins", 2, 3)
    # @guests = [@guest1, @guest2, @guest3, @guest4, @guest5]

    @room1 = Room.new(1, "double", 120, [])
    @room2 = Room.new(2, "single", 80, [])
    @room3 = Room.new(3, "double", 100, [])
    @room4 = Room.new(4, "double", 120, [])
    @room5 = Room.new(5, "triple", 150, [])
    @room6 = Room.new(6, "single", 80, [@guest5])
    @rooms = [@room1, @room2, @room3, @room4, @room5, @room6]

    @sheldor = Hotel.new("Sheldor", @rooms)
  end

  def test_hotel_name_is_sheldor
    assert_equal("Sheldor", @sheldor.name)
  end

  def test_hotel_has_room_2
    assert_equal(2, @sheldor.rooms[1].number)
  end

  def test_hotel_has_no_guests
    assert_equal([], @sheldor.guests)
  end

  def test_checkin_guest_to_hotel
    @sheldor.check_in(@guest3)
    assert_equal("Princess Leia", @sheldor.guests[0].name)
    assert_equal("Princess Leia", @sheldor.rooms[1].has_guest[0].name)
  end

  def test_set_room_types_to_numbers
    assert_equal(3, @sheldor.set_room_types_to_numbers(@room5))
  end

  def test_check_availability_is_nil
    assert_equal(nil, @sheldor.check_availability(@room6))
  end

  def test_check_availability_is_available
    assert_equal(@room5, @sheldor.check_availability(@room5))
  end

  def test_suitability_of_rooms_for_guest3
    assert_equal(@room2, @sheldor.find_suitable(@guest3))
  end

  def test_suitability_of_rooms_and_and_return_full_for_guest5
    @room5.has_guest = [@guest3]
    assert_equal( "Sorry, we don't have a suitable room for you" , @sheldor.check_in(@guest5))
  end

  # def test_find_all_suitable_rooms_for_guest3
  #   assert_equal([@room2, @room6] , @sheldor.find_all_suitable(@guest3))
  # end

end
