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

  def test_validate_cruiser_placement
    game1 = Game.new
    game1.board_setup
    require "pry"; binding.pry
    game1.place_player_cruiser(game1.player_cruiser, game1.cruiser_coordinate_response)

    game2 = Game.new
    game2.board_setup
    game2.place_player_cruiser(game2.player_cruiser, game2.cruiser_coordinate_response)

    assert_equal true, game1.validate_cruiser_placement(game1.player_cruiser, game1.cruiser_coordinate_response)
    assert_equal false, game2.validate_cruiser_placement(game2.player_cruiser, game2.cruiser_coordinate_response)
  end

  def test_prompt_player_initial_placement
    skip
    game = Game.new
    assert_equal player_cruiser_coordinates != [], player_cruiser_coordinates
  end

end
