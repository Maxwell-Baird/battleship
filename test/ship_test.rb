require './lib/ship'

class ShipTest

  def test_ship_exist
    cruiser = Ship.new("Cruiser", 3)
    assert_instance_of Ship, cruiser
  end

  def test_ship_has_length
    cruiser = Ship.new("Cruiser", 3)
    assert_equal 3, cruiser.length
  end

  def test_ship_has_been_sunk
    cruiser = Ship.new("Cruiser", 3)
    assert_equal false, cruiser.sunk?
    cruiser.hit
    cruiser.hit
    assert_equal false, cruiser.sunk?
    cruiser.hit
    assert_equal true, cruiser.sunk?
  end

end
