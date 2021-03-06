require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'


class ShipTest < Minitest::Test

  def test_ship_exist
    cruiser = Ship.new("Cruiser", 3)
    assert_instance_of Ship, cruiser
  end

  def test_ship_has_name
    cruiser = Ship.new("Cruiser", 3)
    assert_equal "Cruiser", cruiser.name
  end

  def test_ship_has_length
    cruiser = Ship.new("Cruiser", 3)
    assert_equal 3, cruiser.length
    end

  def test_ship_health
    cruiser = Ship.new("Cruiser", 3)
    assert_equal 3, cruiser.health
    cruiser.hit
    assert_equal 2, cruiser.health
    cruiser.hit
    assert_equal 1, cruiser.health
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
