require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'


class ShipTest < Minitest::Test

  def test_ship_exist
    cruiser = Ship.new("Cruiser", 3)
    assert_instance_of Ship, cruiser
  end

#  def test_ship_has_name
#    skip
#    cruiser = Ship.new("Cruiser", 3)
#    assert_equal "Cruiser", ship.name
#  end

  def test_ship_has_length
    skip
    cruiser = Ship.new("Cruiser", 3)
    assert_equal 3, cruiser.length
    end

#  def test_ship_health
#    skip
#    cruiser = Ship.new("Cruiser", 3)
#    assert_equal 3, cruiser.health
#    cruiser.hit
#    assert_equal 2, cruiser.health
#    cruiser.hit
#    assert_equal 1, cruiser.health
#  end

  def test_ship_has_been_sunk
    skip
    cruiser = Ship.new("Cruiser", 3)
    assert_equal false, cruiser.sunk?
    cruiser.hit
    cruiser.hit
    assert_equal false, cruiser.sunk?
    cruiser.hit
    assert_equal true, cruiser.sunk?
  end

#  def test_ship_has_been_hit
#    cruiser = Ship.new("Cruiser", 3)
#    cruiser.hit
#    assert_equal 2, cruiser.health
#  end

end
