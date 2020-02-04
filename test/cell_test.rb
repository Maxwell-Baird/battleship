require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test

  def test_if_cell_has_coordinate
    cell = Cell.new("B4")
    assert_equal 'B4', cell.coordinate
  end

  def test_if_cell_is_empty?
    cell = Cell.new("B4")
    assert_equal true, cell.empty?
    cruiser = Ship.new("Cruiser", 3)
    assert_equal false, cell.empty?
  end

  def test_if_cell_has_been_fired_upon?
    cell = Cell.new("B4")
    assert_equal false, cell.fired_upon?
    cell.fire_upon
    assert_equal true, cell.fired_upon?
  end
end
