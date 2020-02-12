require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/ship'
require './lib/cell'
require './lib/computer'

class ComputerTest < Minitest::Test

  def test_computer_exist
    computer = Computer.new
    assert_instance_of Computer, computer
  end

  def test_computer_chooses_v_or_h
    cruiser = Ship.new('Cruiser', 3)
    submarine = Ship.new('Submarine', 2)
    computer = Computer.new
    assert_equal 3, computer.choose_location(cruiser).length
    assert_equal Array, computer.choose_location(cruiser).class
    assert_equal 2, computer.choose_location(submarine).length
    assert_equal Array, computer.choose_location(submarine).class
  end

  def test_computer_shot
    computer = Computer.new
    computer.shot_at
    assert_equal 15, computer.unfired.length
    computer.shot_at
    assert_equal 14, computer.unfired.length
    computer.shot_at
    assert_equal 13, computer.unfired.length
  end
end
