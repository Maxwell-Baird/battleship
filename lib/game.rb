require './lib/computer'
require './lib/board'
require './lib/ship'
require './lib/cell'

class Game

  def initialize
    @input_welcome = ''
    @computer = Computer.new
    @player_board = Board.new
    @computer_board = Board.new
    @cruiser = Ship.new('Cruiser', 3)
    @submarine = Ship.new('Submarine', 2)
    @c_cruiser = Ship.new('cruiser', 3)
    @c_submarine = Ship.new('submarine', 2)
    @player_health = 5
    @computer_health = 5
  end

  def start
    welcome
    while @input_welcome == 'p'
      computer_setup
      setup
      while !win_status
        turn
      end
      welcome
    end
  end

  def welcome
    puts 'Welcome to BATTLESHIP'
    puts 'Enter p to play. Enter q to quit'
    @input_welcome = gets.chomp
    while !(@input_welcome == 'p' || @input_welcome == 'q')
      puts "Please enter in again either p or q"
      @input_welcome = gets.chomp
    end
    @player_health = 5
    @computer_health = 5
  end

  def setup
    puts 'I have laid out my ships on the grid.'
    puts 'You now need to lay out your two ships'
    puts 'The Cruiser is three units long and the Submarine is two units long.'
    @player_board.render
    puts 'Enter the squares for the Cruiser (3 spaces):'
    input = gets.chomp
    three_array = input.split(' ')
    while !@player_board.valid_placement?(@cruiser, three_array)
      puts 'Those are invalid coordinates. Please try again:'
      input = gets.chomp
      three_array = input.split(' ')
    end
    @player_board.place(@cruiser, three_array)
    @player_board.render(true)
    puts ' '
    puts 'Enter the squares for the Submarine (2 spaces):'
    input = gets.chomp
    two_array = input.split(' ')
    while !@player_board.valid_placement?(@submarine, two_array)
      puts 'Those are invalid coordinates. Please try again:'
      input = gets.chomp
      two_array = input.split(' ')
    end
    @player_board.place(@submarine, two_array)
    @player_board.render(true)
    puts ' '

  end

  def computer_setup
    cruiser_array = @computer.choose_location(@c_cruiser)
    while !(@computer_board.valid_placement?(@c_cruiser, cruiser_array))
      cruiser_array = @computer.choose_location(@c_cruiser)
    end
    @computer_board.place(@c_cruiser, cruiser_array)
    submarine_array = @computer.choose_location(@c_submarine)
    while !(@computer_board.valid_placement?(@c_submarine, submarine_array))
      submarine_array = @computer.choose_location(@c_submarine)
    end
    @computer_board.place(@c_submarine, submarine_array)
    puts ' '
  end

  def turn
    puts ' '
    puts '=============COMPUTER BOARD============='
    @computer_board.render
    puts '==============PLAYER BOARD=============='
    @player_board.render(true)
    puts ''
    puts 'Enter the coordinate for your shot:'
    input_coord = gets.chomp
    while !@player_board.valid_coordinate?(input_coord)
      puts "Please enter a valid coordinate:"
      input_coord = gets.chomp
    end
    @computer_board.cells[input_coord].fire_upon
    player_result = @computer_board.cells[input_coord].render
    computer_coord = @computer.shot_at
    @player_board.cells[computer_coord].fire_upon
    computer_result = @player_board.cells[computer_coord].render
    if player_result == 'M'
      puts "Your shot on #{input_coord} was a miss"
    elsif player_result == 'H'
      puts "Your shot on #{input_coord} was a hit"
      @computer_health -= 1
    elsif player_result == 'X'
      puts "Your shot on #{input_coord} sunk a ship"
      @computer_health -= 1
    end

    if computer_result == 'M'
      puts "My shot on #{computer_coord} was a miss"
    elsif computer_result == 'H'
      puts "My shot on #{computer_coord} was a hit"
      @player_health -= 1
    elsif computer_result == 'X'
      puts "My shot on #{computer_coord} sunk a ship"
      @player_health -= 1
    end
    puts ' '
  end

  def win_status
    check = false
    if @player_health == 0
      puts 'I have WON!!!!!'
      check = true
    elsif @computer_health == 0
      puts 'You have WON!!!!'
      check = true
    end
    check
  end

end
