require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'

class CellTest < Minitest::Test

  def test_cell_exist
    skip
    cell = Cell.new("B4")
    assert_instance_of Cell, cell
  end

  def test_if_cell_has_coordinate
    skip
    cell = Cell.new("B4")
    assert_equal 'B4', cell.coordinate
  end

#This test tests both cell.ship and cell.place_ship. Since the method cell.place_ship(cruiser) has no return value, you can't see that it's done what is' supposed to do until you call cell.ship again. I'll copy and paste this test in the cell.place_ship space, but I think we can confirm during our project check in and delete the duplicate.

  def test_if_cell_holds_ship
    skip
    cell = Cell.new("B4")
    assert_nil cell.ship
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    assert_equal cruiser, cell.ship
  end

  def test_if_cell_is_empty?
    skip
    cell = Cell.new("B4")
    assert_equal true, cell.empty?
    cruiser = Ship.new("Cruiser", 3)
    cell.place_ship(cruiser)
    assert_equal true, cell.empty?
  end

#See note above, I think the below test can be deleted after our project check in

#def test_if_cell_can_place_ship
#  skip
#  cell = Cell.new("B4")
#  assert_nil cell.ship
#  cruiser = Ship.new("Cruiser", 3)
#  cell.place_ship(cruiser)
#  assert_equal cruiser, cell.ship
#end

#Again, I think this is duplicative and the fired_upon? and fired.upon methods can both be tested with this single test. Copying below for now / to meet project requirements, but I think we can delete the second test.

  def test_if_cell_has_been_fired_upon?
    skip
    cell = Cell.new("B4")
    assert_equal false, cell.fired_upon?
    cell.fire_upon
    assert_equal true, cell.fired_upon?
  end

#See note above, I think the below test can be deleted after our project check in.

#def test_if_cell_has_fire_upon
#  cell = Cell.new("B4")
#  assert_equal false, cell.fired_upon?
#  cell.fire_upon
#  assert_equal true, cell.fired_upon?
#end

#Render
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
#    cruiser.hit
#    cruiser.hit
#    assert_equal 'X', cell_2.render
  end
end
