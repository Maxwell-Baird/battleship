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

end
