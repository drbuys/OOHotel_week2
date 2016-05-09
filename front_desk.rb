require('colorize')
require_relative('hotel.rb')
require_relative('people.rb')
require_relative('room.rb')

class FrontDesk

  attr_accessor :all_guests

  def initialize
    @guest1 = People.new("Dave Jnr", 5, 2)
    @guest2 = People.new("Sir Walter", 2, 2)
    @guest3 = People.new("Princess Leia", 1, 1)
    @guest4 = People.new("Bobba Fett", 10, 1)
    @guest5 = People.new("Mary Poppins", 2, 3)
    @guest6 = People.new("Jean Grey", 3, 2)
    @all_guests = [@guest1, @guest2, @guest3, @guest4, @guest5, @guest6]
    @guests = []

    @room1 = Room.new(1, "double", 120, [])
    @room2 = Room.new(2, "single", 80, [])
    @room3 = Room.new(3, "double", 100, [])
    @room4 = Room.new(4, "double", 120, [])
    @room5 = Room.new(5, "triple", 150, [])
    @room6 = Room.new(6, "single", 80, [])
    @rooms = [@room1, @room2, @room3, @room4, @room5, @room6]

    @sheldor = Hotel.new("Sheldor", @rooms, @guests)
  end


  def greeting
    if @guests.length == @rooms.length
      puts "I'm afraid the hotel is full, we have no rooms available."
    else
      puts "\nGood day, and welcome to the #{@sheldor.name.red.bold}. How can I help? \n(Check In/ Check Out) "
      answer = gets.chomp.downcase
      if answer == "check in"
        puts "Do you have a booking? (y/n) "
        want = gets.chomp.downcase
        if want == "y"
          puts "Excellent, what is the name?"
          puts "Guests with bookings:".underline
          @all_guests.find { |n| print "#{n.name.cyan.on_yellow.bold}\n"}
          puts ""
          guest_answer = gets.chomp
          guest = @all_guests.find { |n| n.name == guest_answer}
          puts "\nThank you #{guest.name}, lets see if we have anything suitable and available for you..."
          room = @sheldor.check_in(guest)
          sleep(3)
          puts "It looks like we have a room available for you."
          puts "checking".red.on_cyan.blink
          sleep (3)
          puts "You will be staying in room #{room}, I'll have one of our bell boys take your bags up. \nI hope you enjoy your stay\n"
          @all_guests.delete_if { |g| g == guest}
          sleep(4)
        elsif want == "n"
          puts "I'm afraid if you don't have a reservation, we are unable to help you today!"
        else
          puts "Well, I don't really know what it is you want from me!?!?!?!?!"
        end
      elsif answer == "check out"
        puts "Excellent, what was the name?"
        puts "Guests currently checked in:".underline
        @guests.find { |n| print "#{n.name.cyan.on_yellow.bold}\n"}
        puts ""
        leaving_guest = gets.chomp
        guest = @guests.find { |n| n.name = leaving_guest}
        puts "Thank you #{guest.name}, lets get you checked out..."
        @sheldor.check_out(guest)
        puts "We hope you enjoyed your stay at the #{@sheldor.name.red.bold}"
      else
        "I don't I speak spanglish im afraid... try again."
      end
      greeting
    end
  end

end


hotel1 = FrontDesk.new()
hotel1.greeting
