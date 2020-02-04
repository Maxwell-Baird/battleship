class Cell

  attr_reader :ship

  def initialize(placement_parameter)
    @coordinate = placement_parameter
    @ship = nil
    @fired_upon = false
  end

  def place_ship (ship_parameter)
    @ship = ship_parameter
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
  end
  
end
