require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test

  def test_cell_exist
    cell = Cell.new("B4")
    assert_instance_of Cell, cell
  end

  def test_if_cell_has_coordinate
    cell = Cell.new("B4")
    assert_equal 'B4', cell.coordinate
  end

  def test_if_cell_holds_ship
    cell = Cell.new("B4")
    assert_nil cell.ship
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    assert_equal cruiser, cell.ship
  end

  def test_if_cell_is_empty?
    cell = Cell.new("B4")
    assert_equal true, cell.empty?
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    assert_equal false, cell.empty?
  end

  def test_if_cell_has_been_fired_upon?
    cell = Cell.new("B4")
    assert_equal false, cell.fired_upon?
    cell.fire_upon
    assert_equal true, cell.fired_upon?
  end

  def test_if_cell_is_render
    cell_1 = Cell.new("B4")
    assert_equal ".", cell_1.render

    cell_1.fire_upon
    assert_equal "M", cell_1.render

    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)
    cell_2.place_ship(cruiser)
    assert_equal ".", cell_2.render
    assert_equal "S", cell_2.render(true)
    cell_2.fire_upon
    assert_equal "H", cell_2.render
    cruiser.hit
    cruiser.hit
    assert_equal "X", cell_2.render
  end
end
