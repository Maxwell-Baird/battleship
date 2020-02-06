require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'

class GameTest < Minitest::Test
  def setup
    game = Game.new
  end

  def test_new_game_exists
    assert_instance_of Game, game
  end

  def should_new_game_start




end
