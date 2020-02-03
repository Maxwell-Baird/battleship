require './lib/ship'

class ShipTest

  def test_ship_exist
    cruiser = Ship.new("Cruiser", 3)
    assert_instance_of Ship, cruiser
  end

  def test_ship_has_health
    cruiser = Ship.new("Cruiser", 3)
    assert_equal 3, cruiser.health
  end

end
