require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'
require 'mocha/minitest'

class GameTest < Minitest::Test

  def test_game_exist
    skip
    game = Game.new
    assert_instance_of Game, game
  end

  def test_game_can_read_commas
    skip
    game = Game.new
    array1 = ['A1,A2,A3']
    array2 = ['A1','b1','c1']
    assert_equal ['A1','A2','A3'], game.check_space(array1)
    assert_equal ['A1','b1','c1'], game.check_space(array2)
  end

  def test_game_checks_cap
    skip
    game = Game.new
    array1 = ['a1','b1','c1']
    array2 = ['A1','B1','C1']
    assert_equal ['A1','B1','C1'], game.check_capitalize(array1)
    assert_equal ['A1','B1','C1'], game.check_capitalize(array2)
  end

  def test_stardardize_input
    skip
    game = Game.new
    array1 = ['a1','b1','c1']
    array2 = ['A1','B1','C1']
    array3 = ['A1,A2,A3']
    array4 = ['A1','b1','c1']

    assert_equal ['A1','B1','C1'], game.standardize_input(array1)
    assert_equal ['A1','B1','C1'], game.standardize_input(array2)
    assert_equal ['A1','A2','A3'], game.standardize_input(array3)
    assert_equal ['A1','B1','C1'], game.standardize_input(array4)
  end

  def test_cruiser_player_input
    game = Game.new
    assert_instance_of Array, game.cruiser_player_input
  end

  def test_submarine_player_input
    game = Game.new
    assert_instance_of Array, game.submarine_player_input
  end

  def test_invalid_coordinates_loop

end
