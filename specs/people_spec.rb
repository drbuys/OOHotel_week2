require 'minitest/autorun'
require('minitest/rg')
require_relative('../people.rb')

class TestPeople < MiniTest::Test

  def setup
    @guest1 = People.new("Dave Jnr", 5, 2)
    @guest2 = People.new("Sir Walter", 2, 2)
    @guest3 = People.new("Princess Leia", 1, 2)
    @guest4 = People.new("Bobba Fett", 10, 1)
    @guest5 = People.new("Mary Poppins", 2, 3)
  end

  def test_guest1_name_is_Dave_Jnr
    assert_equal("Dave Jnr", @guest1.name)
  end

  def test_guest2_length_of_stay_is_2_days
    assert_equal(2, @guest2.length_of_stay)
  end

  def test_guest3_number_in_group_is_2
    assert_equal(2, @guest3.number_in_group)
  end


end
