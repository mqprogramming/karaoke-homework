require_relative('./bar.rb')
require_relative('./drink.rb')
require_relative('./guest.rb')
require_relative('./room.rb')
require_relative('./song.rb')
require_relative('./establishment.rb')

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

@room_a.guests_fav_song_on_playlist(@guest1)
