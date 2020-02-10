require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game'

class GameTest < Minitest::Test

  def test_game_exist
    game = Game.new
    assert_instance_of Game, game
  end

  def test_game_win_status
    game = Game.new
    assert_equal false, game.win_status
    game.player_health = 0
    assert_equal true, test_game_win_status
  end
end
