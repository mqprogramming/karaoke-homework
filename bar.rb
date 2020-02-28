class Bar

  attr_accessor :guests, :drinks_list
  attr_reader :cash_in_till

  def initialize(drinks_list, guests = [], cash_in_till = 0)
    @guests = guests
    @drinks_list = drinks_list
    @cash_in_till = cash_in_till
  end

end
