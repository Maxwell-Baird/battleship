require './lib/computer'
require './lib/board'
require './lib/ship'
require './lib/cell'
require 'pry'

class Game

  attr_reader :input_welcome, :player_board, :computer_board

  def initialize
    @input_welcome = ''
    @player_board = Board.new
    @computer_board = Board.new
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
    @computer = Computer.new
    @player_board = Board.new
    @computer_board = Board.new
    @cruiser = Ship.new('Cruiser', 3)
    @submarine = Ship.new('Submarine', 2)
    @c_cruiser = Ship.new('cruiser', 3)
    @c_submarine = Ship.new('submarine', 2)
  end

  def setup

    puts 'I have laid out my ships on the grid.'
    puts 'You now need to lay out your two ships'
    puts 'The Cruiser is three units long and the Submarine is two units long.'
    @player_board.render
    puts 'Enter the squares for the Cruiser (3 spaces):'
    input = gets.chomp
    three_array = input.split(' ')
    check_cru_space = check_space(three_array)
    check_cru = check_capitalize(check_cru_space)
    while !@player_board.valid_placement?(@cruiser, check_cru)
      puts 'Those are invalid coordinates. Please try again:'
      input = gets.chomp
      three_array = input.split(' ')
      check_cru_space = check_space(three_array)
      check_cru = check_capitalize(check_cru_space)
    end
    @player_board.place(@cruiser, check_cru)
    @player_board.render(true)
    puts ' '
    puts 'Enter the squares for the Submarine (2 spaces):'
    input = gets.chomp
    two_array = input.split(' ')
    check_sub_space = check_space(two_array)
    check_sub = check_capitalize(check_sub_space)
    while !@player_board.valid_placement?(@submarine, check_sub)
      puts 'Those are invalid coordinates. Please try again:'
      input = gets.chomp
      two_array = input.split(' ')
      check_sub_space = check_space(two_array)
      check_sub = check_capitalize(check_sub_space)
    end
    @player_board.place(@submarine, check_sub)
    @player_board.render(true)
    puts ' '

  end

  def computer_setup

    cruiser_array = @computer.choose_location(@c_cruiser)
    while !(@computer_board.valid_placement?(@c_cruiser, cruiser_array))
      binding.pry
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
    input_coord = turn_check(input_coord)
    input_cap = input_coord.capitalize()
    computer_coord = @computer.shot_at
    results(input_cap, computer_coord, render_computer(computer_coord), render_player(input_cap))
  end

  def render_player(input_cap)
    @computer_board.cells[input_cap].fire_upon
    player_result = @computer_board.cells[input_cap].render
    player_result
  end

  def render_computer(computer_coord)
    @player_board.cells[computer_coord].fire_upon
    computer_result = @player_board.cells[computer_coord].render
    computer_result
  end

  def turn_check(input_coord)
    input_cap = input_coord.capitalize()
    while !@computer_board.valid_coordinate?(input_cap)
      puts "Please enter a valid coordinate:"
      input_coord = gets.chomp
      input_cap = input_coord.capitalize()
    end
    check = @computer_board.cells[input_cap].fired_upon?
    while check
      puts "You already fired at this place, Please type in a different location:"
      input_coord = gets.chomp
      input_cap = input_coord.capitalize()
      while !@computer_board.valid_coordinate?(input_cap)
        puts "Please enter a valid coordinate:"
        input_coord = gets.chomp
        input_cap = input_coord.capitalize()
      end
      check = @computer_board.cells[input_cap].fired_upon?
    end
    input_cap
  end


  def results(input_cap, computer_coord, player_result, computer_result)
    puts ''
    if computer_result == 'M'
      puts "Your shot on #{input_cap} was a miss"
    elsif computer_result == 'H'
      puts "Your shot on #{input_cap} was a hit"
    elsif computer_result == 'X'
      puts "Your shot on #{input_cap} sunk a ship"
    end
    if player_result == 'M'
      puts "My shot on #{computer_coord} was a miss"
    elsif player_result == 'H'
      puts "My shot on #{computer_coord} was a hit"
    elsif player_result == 'X'
      puts "My shot on #{computer_coord} sunk a ship"
    end
    puts ' '
  end

  def win_status
    check = false
    if @cruiser.health == 0 && @submarine.health == 0
      puts 'I have WON!!!!!'
      check = true
    elsif @c_cruiser.health == 0 && @c_submarine.health == 0
      puts 'You have WON!!!!'
      check = true
    end
    check
  end

  def check_capitalize(input_array)
    output = []
    check_cap = false
    input_array.each do |part|
      @player_board.cells.each_key do |cell_name|
        if @player_board.cells[cell_name].coordinate == part.capitalize
          check_cap = true
        end
      end
    end
    if check_cap == true
      output = []
      input_array.each do |part|
        output << part.capitalize
      end
    else
      output = input_array
    end
    output
  end

  def check_space(input_array)
    output = []
    test = input_array.join('')
    if test.include?(',')
      output = test.split(',')
    else
      output = input_array
    end
    output
  end

end
