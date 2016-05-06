class Hotel

  attr_accessor :name, :rooms, :guests

  def initialize(name, rooms)
    @name = name
    @rooms = rooms
    @guests = []
  end

  def set_room_types_to_numbers(room)
    type = room.type
    if type == "single"
      return 1
    elsif type == "double"
      return 2
    elsif type == "triple"
      return 3
    else
      return "No room available"
    end
  end

  # def check_availability(room)
  #   return room if room.has_guest.length == 0
  # end
  #
  # def find_all_suitable(guest)
  #   return @rooms.find_all { |i| set_room_types_to_numbers(i) == guest.number_in_group }
  # end

  def find_suitable(guest)
    return @rooms.find { |i| (set_room_types_to_numbers(i) == guest.number_in_group) && (i.has_guest.length == 0) }
    # return @rooms.find_index { |i| set_room_types_to_numbers(i) == guest.number_in_group }
  end

  def check_in(guest)
    room = find_suitable(guest)
    # avail = check_availability(@rooms[room])
    if room != nil # && avail != nil
      @rooms[room.number - 1].add_guest(guest)
      return @guests << guest
    else
      return "Sorry, we don't have a suitable room for you"
    end
  end

  def check_out(guest)
    room = @rooms.find { |i| i.has_guest == [guest] }
    @rooms[room.number - 1].remove_guest(guest)
    index = @guests.find_index { |i| i == guest }
    @guests.delete_at(index)
    return @guests
  end

end
