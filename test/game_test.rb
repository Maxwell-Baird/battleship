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
    game = Game.new
    game.board_setup
    game.cruiser_conversion
    assert_equal 6, game.cruiser_string.length
  end



end
