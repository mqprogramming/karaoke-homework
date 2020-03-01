require('pry')

require('minitest/autorun')
require('minitest/reporters')

MiniTest::Reporters.use!
MiniTest::Reporters::SpecReporter.new()

require_relative('../bar.rb')
require_relative('../drink.rb')
require_relative('../guest.rb')
require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../establishment.rb')

class KaraokeTest < MiniTest::Test

  def setup

    @karaoke = Establishment.new("ABBA Karaoke", [@room_a, @room_b])

    @guest1 = Guest.new('Donna', "Dancing Queen", 20)
    @guest2 = Guest.new('Sophie', "Honey Honey", 30)
    @guest3 = Guest.new('Tanya', "Does Your Mother Know", 50)
    @guest4 = Guest.new('Rosie', "Take a Chance on Me", 5)

    @song1 = Song.new("Dancing Queen")
    @song2 = Song.new("Honey Honey")
    @song3 = Song.new("Does Your Mother Know")
    @song4 = Song.new("Take a Chance on Me")
    @song5 = Song.new("Mamma Mia")

    @song_list = [@song1, @song2, @song3]

    @bar = Bar.new(@drinks_list)

    @drink1 = Drink.new("Screwdriver", 4)
    @drink2 = Drink.new("Sex on the Beach", 6)
    @drink3 = Drink.new("Mojito", 3)

    @drinks_list = [@drink1, @drink2, @drink3]

    @room_a = Room.new(@song_list, 2, [@guest1, @guest2])
    @room_b = Room.new(@song_list, 4)

  end

  def test_number_of_guests_in_room()
    assert_equal(2, @room_a.guests.count())
  end

  def test_guest_enters_room()
    @room_b.guest_enters(@guest3)
    assert_equal(1, @room_b.guests.count())
  end

  def test_guest_leaves_room()
    @room_a.guest_leaves(@guest1)
    assert_equal(1, @room_a.guests.count())
  end

  def test_add_song()
    @room_a.add_song(@song4)
    assert(@room_a.songs.include?(@song4))
  end

  def test_guest_denied_if_room_at_max_capacity()
    @room_a.guest_enters(@guest4)
    assert_equal(2, @room_a.guests.count())
  end

  def test_guest_has_paid_entry_fee()
    @karaoke.add_cash(@room_a.price())
    @guest1.remove_cash(@room_a.price())

    assert_equal(10, @karaoke.total_cash())
    assert_equal(10, @guest1.cash())
  end

  def test_guests_fav_song_on_playlist__found()
    assert_equal("Yaaaaas gurl!", @room_a.guests_fav_song_on_playlist(@guest1))
  end

  def test_guests_fav_song_on_playlist__not_found()
    assert_nil(@room_a.guests_fav_song_on_playlist(@guest4))
  end

end
