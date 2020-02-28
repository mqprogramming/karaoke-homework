class Guest

  attr_reader :name, :cash, :fav_song, :consumed_drinks

  def initialize(name, fav_song, cash = 0, consumed_drinks = [])
    @name = name
    @cash = cash
    @fav_song = fav_song
    @consumed_drinks = consumed_drinks
  end

  def remove_cash(amount)
    @cash -= amount
  end

end
