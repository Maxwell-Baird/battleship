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
              :computer_board,
              :player_board,
              :player_cruiser,
              :cruiser_validation_array,
              :cruiser_validation_value,
              :player_submarine,
              :submarine_validation_array,
              :submarine_validation_value,
              :computer_cells,
              :player_cells
  attr_accessor :player_cruiser_coordinates,
                :cruiser_response,
                :cruiser_string,
                :cruiser_array,
                :player_submarine_coordinates,
                :submarine_response,
                :submarine_string,
                :submarine_array

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

  def game_setup
    create_computer_ships_and_both_boards
    place_computer_ships

    print "I have laid out my ships on the grid. \nYou now need to lay out your two ships. \nThe Cruiser is three units long and the Submarine is two units long. \n  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \nEnter three squares for the Cruiser (These should be in an horizontal or vertical line and correspond to the grid -- for example, A1, A2, A3): > "
    @cruiser_response = []
    @cruiser_response << gets.chomp
    @player_cruiser = Ship.new("Player_Cruiser", 3)
  end

  def player_board_setup_and_gameplay
    cruiser_conversion
    create_cruiser_coordinate_array
    validate_cruiser_coordinates(@cruiser_array)
      if @cruiser_validation_array.include?(false)
        print "Hmmm...those aren't valid coordinates. Let's start again. \n"
      else
        validate_cruiser_placement(@player_cruiser, @cruiser_array)
          if @cruiser_validation_value.include?(false)
            print "Hmmm...that isn't a valid placement. Let's start again."
          elsif @cruiser_validation_value.include?(true)
            player_board.place(@player_cruiser, @cruiser_array)
            player_board.render(true)
            print "Great, let's place your submarine!
            \nEnter two squares for the Submarine (These should be in an horizontal or vertical line and correspond to the grid -- for example, C2 and D2): > "

            @submarine_response = []
            @submarine_response << gets.chomp
            @player_submarine = Ship.new("Player_Submarine", 2)
            player_submarine_setup
            take_turn
          end
      end
    end

  def player_submarine_setup
    submarine_conversion
    create_submarine_coordinate_array
    validate_submarine_coordinates(@submarine_array)
      if @submarine_validation_array.include?(false)
        print "Hmmm...those aren't valid coordinates. Let's start again. \n"
      else
        validate_submarine_placement(@player_submarine, @submarine_array)
          if @submarine_validation_value.include?(false)
            print "Hmmm...that isn't a valid placement. Let's start again."
          elsif @submarine_validation_value.include?(true)
            @player_board.place(@player_submarine, @submarine_array)
            print "Great, let's play! \n"
          end
    end
  end

  def create_array_of_player_cells
    @player_cells = []
    @player_cells << submarine_array
    @player_cells << cruiser_array
  end

  def take_turn
    loop do
    display_boards
    player_take_turn
      if player_cruiser.health + player_submarine.health == 0
        print "I won!"
        break
      end
    computer_take_turn
      if computer_cruiser.health + computer_submarine.health == 0
        print "You won!"
        break
      end
    end
  end

  def display_boards
    print "=============COMPUTER BOARD============="
    computer_board.render(false)
    print "==============PLAYER BOARD=============="
    player_board.render(true)
  end


  def player_take_turn
    print "Choose a coordinate to fire on: > "
    player_coordinate_choice = gets.chomp
    require "pry"; binding.pry
    @computer_cells.each do |cell|
      if cell == player_coordinate_choice
        cell.fire_upon
          if cell.ship.health > 0
            print "Your shot was a hit!"
            break
          elsif cell.ship.health == 0
            print "Your shot was a hit and sink!"
            break
          end
      else
        print "Your shot was a miss!"
      end
    end
  end

  def computer_take_turn
    computer_shot = computer.shot_at
    @player_cells.each do |cell|
      if cell == computer_shot
        cell.fire_upon
          if cell.ship.health > 0
            print "My shot was a hit!"
            break
          elsif cell.ship.health == 0
            print "My shot was a hit and sink!"
            break
          end
      else
        print "My shot was a miss!"
      end
    end
  end


#Helper Methods to Set Up Player Cruiser

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
    @cruiser_validation_array = []
     cells.each do |cell|
       @cruiser_validation_array << player_board.cells.has_key?(cell)
     end
  end


  def validate_cruiser_placement(ship_parameter, ship_placement_array)
    @cruiser_validation_value = []
    @cruiser_validation_value << player_board.valid_placement?(ship_parameter, ship_placement_array)

  end

#Helper Methods to Set Up Player Submarine

  def submarine_conversion
    initial_submarine_string = @submarine_response.join()
    remove_spaces = initial_submarine_string.gsub!(/\s+/, '')
    @submarine_string = remove_spaces.gsub!(/[[:punct:]]/, '')
  end

  def create_submarine_coordinate_array
    @submarine_array = []
    @submarine_array << @submarine_string[0] + @submarine_string[1]
    @submarine_array << @submarine_string[2] + @submarine_string[3]
  end

  def validate_submarine_coordinates(cells)
    @submarine_validation_array = []
    cells.each do |cell|
      @submarine_validation_array << player_board.cells.has_key?(cell)
    end
  end

  def validate_submarine_placement(ship_parameter,  ship_placement_array)
    @submarine_validation_value = []
    @submarine_validation_value << player_board.valid_placement?(ship_parameter, ship_placement_array)
  end


#Helper Methods to Set Up Computer Ships

  def create_computer_ships_and_both_boards
    @computer_board = Board.new
    @player_board = Board.new
    @computer = Computer.new
    @computer_cruiser = Ship.new('Computer Cruiser', 3)
    @computer_submarine = Ship.new('Computer Submarine', 2)
  end

  def place_computer_ships
    @computer_cells = []
    cruiser_location = computer.choose_location(@computer_cruiser)
    submarine_location = computer.choose_location(@computer_submarine)
    @computer_cells = cruiser_location.concat submarine_location
  end

end
