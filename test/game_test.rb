require 'minitest/autorun'
require 'minitest/pride'

class GameTest < Minitest:: Test

  def test_new_game_exists
    game = Game.new
    assert_instance_of Game, game 
