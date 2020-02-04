class Cell

  attr_reader :ship
  def initialize(placement_parameter)
    @coordinate = placement_parameter
    @ship = nil
  end

  def place_ship (ship_parameter)
    @ship = ship_parameter
  end
end
