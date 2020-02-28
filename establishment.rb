class Establishment

  attr_reader :name, :rooms, :total_cash

  def initialize(name, rooms = [], total_cash = 0)
    @name = name
    @rooms = rooms
    @total_cash = total_cash
  end

  def add_cash(amount)
    @total_cash += amount
  end

end
