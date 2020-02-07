require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
require './lib/computer'

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
    game = Game.new
    game.create_computer_ships
    game.place_computer_ships
    assert_equal game.computer_cruiser_location, computer.choose_location(game.computer_cruiser)
    assert_equal game.computer_submarine_location, computer.choose_location(game.computer_submarine)
  end

  def test_prompt_player_initial_placement
    skip
    game = Game.new
    assert_equal player_cruiser_coordinates != [], player_cruiser_coordinates
  end

end
