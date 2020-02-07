require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'

class GameTest < Minitest::Test

  def test_new_game_exists
    game = Game.new
    assert_instance_of Game, game
  end

  def create_board_test
    require "pry"; binding.pry
    game.create_board
    assert_equal Ship.new('Computer Cruiser', 3), computer_cruiser
    assert_equal Ship.new('Computer Submarine', 2), computer_submarine
    assert_equal 3, computer.choose_location(computer_cruiser).length
    assert_equal 2, computer.choose_location(computer_submarine).length

  end


end
