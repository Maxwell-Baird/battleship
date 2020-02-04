require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship.rb

class TurnTest < Minitest::Test

#Test Ship Exists --> Max

  def test_ship_has_name
    cruiser = Ship.new("Cruiser", 3)
    assert_equal "Cruiser", ship.name
  end

#Test Ship Has Length --> Max

  def test_ship_health
    cruiser = Ship.new("Cruiser", 3)
    assert_equal 3, cruiser.health
    cruiser.hit
    assert_equal 2, cruiser.health
    cruiser.hit
    assert_equal 1, cruiser.health
  end

#Test Ship is Sunk --> Max
