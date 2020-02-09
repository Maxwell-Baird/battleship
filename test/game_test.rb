require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
require './lib/ship'
require './lib/computer'
require './lib/cell'

class GameTest < Minitest::Test

  def test_new_game_exists
    skip
    game = Game.new
    assert_instance_of Game, game
  end

  def test_create_computer_ships
    skip
    game = Game.new
    game.create_computer_ships
    assert_instance_of Ship, game.computer_cruiser
    assert_instance_of Ship, game.computer_submarine
  end

  def test_place_computer_ships
    skip
    game = Game.new
    game.create_computer_ships
    game.place_computer_ships
    assert_equal 3, game.computer.choose_location(game.computer_cruiser).count
    assert_equal 2, game.computer.choose_location(game.computer_submarine).count
  end

  def test_cruiser_conversion
    skip
    game = Game.new
    game.board_setup
    game.cruiser_conversion
    assert_equal 6, game.cruiser_string.length
  end

  def test_create_cruiser_coordinate_array
    skip
    game = Game.new
    game.board_setup
    game.cruiser_conversion
    game.create_cruiser_coordinate_array
    assert_equal 3, game.cruiser_array.length
  end

  def test_validate_cruiser_coordinates
    game = Game.new
    game.board_setup
    game.cruiser_conversion
    game.create_cruiser_coordinate_array

    assert_equal true, game.board.valid_coordinate?(game.cruiser_array[0])
    assert_equal true, game.board.valid_coordinate?(game.cruiser_array[1])
    assert_equal true, game.board.valid_coordinate?(game.cruiser_array[2])
    assert_equal false, game.board.valid_coordinate?("G5")
  end

end
