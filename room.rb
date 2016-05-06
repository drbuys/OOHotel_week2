class Room

  attr_accessor :number, :type, :price, :has_guest

  def initialize(number, type, price, has_guest)
    @number = number
    @type = type
    @price = price
    @has_guest = has_guest
  end

  def add_guest(new_guest)
    @has_guest << new_guest
    return @has_guest
  end

  def remove_guest(guest)
    return@has_guest.pop
  end


end
