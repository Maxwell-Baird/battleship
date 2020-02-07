require './lib/board'
require './lib/computer'
require './lib/ship'

class Game

  attr_reader :start_message, :start_another_game, :computer_cruiser, :computer_submarine
  attr_accessor :player_cruiser_coordinates

  def initialize
    @start_message = "Welcome to BATTLESHIP \n Enter p to play. \n Enter q to quit. \n"
    @start_another_game = false
    @player_cruiser_coordinates = []
  end

  def new_game_prompt
    @start_prompt = gets.chomp.downcase

      if @start_prompt == "p"

        @start_another_game = true

        puts "Great! Let's play!"
      elsif @start_prompt == "q"
        puts "Goodbye!"
      else
        puts "Sorry, I don't understand. Goodbye!"
      end
    end

  def create_computer_ships
    computer = Computer.new
    board = Board.new
    @computer_cruiser = Ship.new('Computer Cruiser', 3)
    @computer_submarine = Ship.new('Computer Submarine', 2)
  end

  def place_computer_ships
    computer_cruiser_location = []
    computer_cruiser_location << computer.choose_location(computer_cruiser)
    computer_submarine_location = []
    computer_submarine_location << computer.choose_location(computer_submarine)
  end

  def prompt_player_initial_placement
    print "I have laid out my ships on the grid. \nYou now need to lay out your two ships. \nThe Cruiser is three units long and the Submarine is two units long. \n  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \nEnter three squares for the Cruiser (These should be in an horizontal or vertical line and correspond to the grid -- for example, A1, A2, A3):
> "
    player_cruiser_coordinates = []
    player_cruiser_coordinates << gets.chomp

  end

end
