require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'

class BoardTest < Minitest::Test


  def test_new_board_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_board_has_valid_coordinate
    board = Board.new
    assert_equal true, board.valid_coordinate?("A1")
    assert_equal true, board.valid_coordinate?("D4")
    assert_equal false, board.valid_coordinate?("A5")
    assert_equal false, board.valid_coordinate?("E1")
    assert_equal false, board.valid_coordinate?("")
    assert_equal false, board.valid_coordinate?("11")
  end


  def test_board_has_placement_equal_to_length?
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal true, board.placement_equal_to_length?(cruiser, ['A1','A2','A3'])
    assert_equal true, board.placement_equal_to_length?(submarine, ['A1','A2'])
    assert_equal false, board.placement_equal_to_length?(cruiser, ["A1",'A2','A3',
    'A4',"B4"])
    assert_equal false, board.placement_equal_to_length?(cruiser, [])
    assert_equal false, board.placement_equal_to_length?(cruiser, ["A1", "A2"])
    assert_equal false, board.placement_equal_to_length?(submarine, ["A2", "A3", "A4"])
  end

  def test_board_has_valid_placement_in_a_row
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal true, board.placement_in_a_row?(cruiser, ["A1", "A2", "A3"])
    assert_equal true, board.placement_in_a_row?(cruiser, ["A1", "B1", "C1"])
    assert_equal false, board.placement_in_a_row?(cruiser, ["A1", "A2", "A4"])
    assert_equal false, board.placement_in_a_row?(submarine, ["A1", "B2"])
    assert_equal false, board.placement_in_a_row?(cruiser, ["A3", "A2", "A1"])
    assert_equal false, board.placement_in_a_row?(submarine, ["C1", "B1"])
    assert_equal false, board.placement_in_a_row?(cruiser, ["A1", "B2", "C3"])
    assert_equal false, board.placement_in_a_row?(cruiser, ["C1", "D1", 'B1'])
  end

  def test_board_has_placement_not_empty?
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    submarine = Ship.new("Submarine", 2)
    assert_equal false, board.placement_not_empty?(["A1", "B1"])
    assert_equal false, board.placement_not_empty?(["A1", "A2"])
    assert_equal true, board.placement_not_empty?(["B4", "C4"])
    end

  def test_board_has_valid_placement
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal false, board.valid_placement?(cruiser, ["A1", "B2", "C3"])
    assert_equal false, board.valid_placement?(submarine, ["C2", "C3",'C4'])
    assert_equal true, board.valid_placement?(submarine, ["A1", "A2"])
    assert_equal true, board.valid_placement?(cruiser, ["B1", "C1", "D1"])
    board.place(cruiser, ["A1", "A2", "A3"])
    assert_equal false, board.valid_placement?(submarine, ["A1", "A2"])
    assert_equal true, board.valid_placement?(submarine, ['A4','B4'])
  end


  def test_board_has_cells
    board = Board.new
    assert_equal 16, board.cells.length
    board.cells.each_key do |key|
      assert_instance_of Cell, board.cells[key]
    end
  end

  def test_board_can_render
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    board.place(cruiser, ["A1", "A2", "A3"])
    test_rendering1 = "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
    test_rendering2 = "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n"
    assert_equal test_rendering1, board.render
    assert_equal test_rendering2, board.render(true)
  end
end
