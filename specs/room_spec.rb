require 'minitest/autorun'
require('minitest/rg')
require_relative('../room.rb')
require_relative('../people.rb')

class TestRoom < MiniTest::Test

  def setup
    @guest1 = People.new("Dave Jnr", 5, 2)
    @guest2 = People.new("Sir Walter", 2, 2)
    @guest3 = People.new("Princess Leia", 1, 2)
    @guest4 = People.new("Bobba Fett", 10, 1)
    @guest5 = People.new("Mary Poppins", 2, 3)

    @room1 = Room.new(1, "double", 120, [])
    @room2 = Room.new(2, "single", 80, [])
    @room3 = Room.new(3, "twin", 100, [])
    @room4 = Room.new(4, "double", 120, [])
    @room5 = Room.new(5, "triple", 150, [])
    @room6 = Room.new(6, "single", 80, [@guest4])
  end

  def test_room1_has_number_1
    assert_equal(1, @room1.number)
  end

  def test_room2_has_type_single
    assert_equal("single", @room2.type)
  end

  def test_room3_has_price_of_100
    assert_equal(100, @room3.price)
  end

  def test_room4_has_no_guest
    assert_equal([], @room4.has_guest)
  end

  def test_room6_has_guest_Bobba_Fett
    assert_equal("Bobba Fett", @room6.has_guest[0].name)
  end


  def test_add_guest5_to_room5
    @room5.add_guest(@guest5)
    assert_equal("Mary Poppins", @room5.has_guest[0].name)
  end

  def test_remove_guest4_from_room6
    @room6.remove_guest(@guest4)
    assert_equal([], @room6.has_guest)
  end


end
