require './lib/ship'

class Cell

  attr_reader :ship, :coordinate

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
    if @ship != nil
      @ship.hit
    end
    @fired_upon = true
    if @ship != nil
      ship.hit
    end
  end

  def empty?
    @cell_empty
  end

  def render(cell_status = nil)
    if cell_status == true && @ship != nil
      p "S"
    elsif fired_upon? == false
      p "."
    elsif fired_upon? == true && @cell_empty == true
      p 'M'
    elsif (fired_upon? == true && @ship != nil && @cell_empty == false &&
      @ship.sunk? == false)
      p "H"
    elsif @ship != nil && @ship.sunk? == true
      p "X"
    end
  end

end
