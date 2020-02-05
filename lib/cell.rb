require './lib/ship'

class Cell

  attr_reader :ship, :coordinate, :fired_upon

  def initialize(placement_parameter)
    @coordinate = placement_parameter
    @ship = nil
    @fired_upon = false
    @cell_empty = true
  end

  def place_ship(ship_parameter)
    @ship = ship_parameter
    @cell_empty = false
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

  def render(cell_status = nil)
   if cell_status == true
     p "S"
   elsif @fired_upon == false
     p "."
   elsif ship.sunk? == true
     p "X"
   elsif @fired_upon == true && @cell_empty == false
     ship.hit
     p "H"
   elsif @fired_upon == true
     p "M"
   end
 end



end
