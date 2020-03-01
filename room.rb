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

  def guests_fav_song_on_playlist(guest)
    found_song = @songs.find() do |song|
      song.name == guest.fav_song
    end

    return "Yaaaaas gurl!" if found_song != nil
  end

end
