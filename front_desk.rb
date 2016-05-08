require_relative('../hotel.rb')
require_relative('../people.rb')
require_relative('../room.rb')

class FrontDesk

  def initialize
    @guest1 = People.new("Dave Jnr", 5, 2)
    @guest2 = People.new("Sir Walter", 2, 2)
    @guest3 = People.new("Princess Leia", 1, 1)
    @guest4 = People.new("Bobba Fett", 10, 1)
    @guest5 = People.new("Mary Poppins", 2, 3)
    # @guests = [@guest1, @guest2, @guest3, @guest4, @guest5]
    # @guests = [@guest5]
    @room1 = Room.new(1, "double", 120)
    @room2 = Room.new(2, "single", 80)
    @room3 = Room.new(3, "double", 100)
    @room4 = Room.new(4, "double", 120)
    @room5 = Room.new(5, "triple", 150)
    @room6 = Room.new(6, "single", 80)
    @rooms = [@room1, @room2, @room3, @room4, @room5, @room6]

    @sheldor = Hotel.new("Sheldor", @rooms)


  end


  def greeting
    if @guests.length == @rooms.length
      puts "I'm afraid the hotel is full, we have no rooms available."
    else
      puts "Good day, do you have a booking? (y/n) "
      want = answer.gets.chomp.downcase
      if want = "y"
        puts "Excellent, what is the name?\n "
        guest_answer = gets.chomp
        guest = @guests.find { |n| n.name = guest_answer}
        puts "Thank you #{guest.name}, lets see if we have anything suitable and available for you..."
        puts @sheldor.check_in(guest)
      else
        puts "I'm afraid we are fully booked, please try to make a reservation in the future."
      end
      greeting
    end
  end

end


hotel1 = FrontDesk.new()
hotel1.greeting
