class Room

  attr_accessor :guests, :songs
  attr_reader :max_capacity, :price

  def initialize(songs, max_capacity, guests = [], price = 10)
    @songs = songs
    @max_capacity = max_capacity
    @guests = guests
    @price = price
  end

  def guest_enters(guest)
    if(@guests.count() < @max_capacity)
      @guests.push(guest)
    end
  end

  def guest_leaves(guest)
    @guests.delete(guest)
  end

  def add_song(song)
    @songs.push(song)
  end

end
