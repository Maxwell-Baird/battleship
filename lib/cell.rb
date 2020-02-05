class Cell

  attr_reader :ship, :coordinate, :fired_upon

  def initialize(placement_parameter)
    @coordinate = placement_parameter
    @ship = nil
    @fired_upon = false
  end

  def place_ship(ship_parameter)
    @ship = ship_parameter
    @cell_empty = true
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
  end

  def empty?
    @cell_empty
  end

  def render()
    if @fired_upon == false
      p "."
    elsif @fired_upon == true
      p "M"
    end
  end

end
