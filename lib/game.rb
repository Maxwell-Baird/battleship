require './lib/board'
require './lib/computer'
require './lib/ship'
require './lib/cell'

class Game

  attr_reader :start_message,
              :start_another_game,
              :computer_cruiser,
              :computer_submarine,
              :computer_cruiser_location,
              :computer_submarine_location,
              :computer,
              :board,
              :player_cruiser,
              :validation_array
              :validation_value
  attr_accessor :player_cruiser_coordinates,
                :cruiser_response,
                :cruiser_string,
                :cruiser_array

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

  def board_setup
    create_computer_ships
    place_computer_ships

    print "I have laid out my ships on the grid. \nYou now need to lay out your two ships. \nThe Cruiser is three units long and the Submarine is two units long. \n  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \nEnter three squares for the Cruiser (These should be in an horizontal or vertical line and correspond to the grid -- for example, A1, A2, A3):
> "
    @cruiser_response = []
    @cruiser_response << gets.chomp
    @player_cruiser = Ship.new("Player_Cruiser", 3)
  end

  def player_cruiser_setup
    cruiser_conversion
    create_cruiser_coordinate_array
    validate_cruiser_coordinates(@cruiser_array)
      if @validation_array.include?(false)
        print "Hmmm...those aren't valid coordinates. Let's start again."
      else
        validate_cruiser_placement(@player_cruiser, @cruiser_array)
          if @validation_value.include?(false)
            print "Hmmm...that isn't a valid placement. Let's start again."
          elsif @validation_value.include?(true)
            board.place(@player_cruiser, @cruiser_array)
            print "Great, let's place your submarine!
            \nEnter two squares for the Submarine (These should be in an horizontal or vertical line and correspond to the grid -- for example, C2 and D2):
        > "
        require "pry"; binding.pry
            @submarine_response = []
            @submarine_response << gets.chomp
            @player_submarine = Ship.new("Player_Submarine", 2)
          end
      end
    end

  def cruiser_conversion
    initial_cruiser_string = @cruiser_response.join()
    remove_spaces = initial_cruiser_string.gsub!(/\s+/, '')
    @cruiser_string = remove_spaces.gsub!(/[[:punct:]]/, '')
  end

  def create_cruiser_coordinate_array
    @cruiser_array = []
    @cruiser_array << @cruiser_string[0] + @cruiser_string[1]
    @cruiser_array << @cruiser_string[2] + @cruiser_string[3]
    @cruiser_array << @cruiser_string[4] + @cruiser_string [5]
  end

  def validate_cruiser_coordinates(cells)
    @validation_array = []
     cells.each do |cell|
       @validation_array << board.cells.has_key?(cell)
     end
  end

  def validate_cruiser_placement(ship_parameter, ship_placement_array)
    @validation_value = []
    @validation_value << board.valid_placement?(ship_parameter, ship_placement_array)

  end

  def create_computer_ships
    @board = Board.new
    @computer = Computer.new
    @computer_cruiser = Ship.new('Computer Cruiser', 3)
    @computer_submarine = Ship.new('Computer Submarine', 2)
  end

  def place_computer_ships
    computer.choose_location(@computer_cruiser)
    computer.choose_location(@computer_submarine)
  end


end
