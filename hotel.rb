class Hotel

  attr_accessor :name, :rooms, :guests

  def initialize(name, rooms, guests)
    @name = name
    @rooms = rooms
    @guests = guests
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

  def find_suitable(guest)
    return @rooms.find { |i| (set_room_types_to_numbers(i) == guest.number_in_group) && (i.has_guest.length == 0) }
  end

  def check_in(guest)
    room = find_suitable(guest)
    if room != nil
      @rooms[room.number - 1].add_guest(guest)
      @guests << guest
      return room.number
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
