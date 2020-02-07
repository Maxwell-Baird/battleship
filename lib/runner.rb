require './lib/game'
require './lib/ship'
require './lib/cell'
require './lib/computer'
require './lib/board'

game = Game.new

print game.start_message

game.new_game_prompt


if game.start_another_game == true

  computer = Computer.new
  board = Board.new
  cruiser = Ship.new('Cruiser', 3)
  submarine = Ship.new('Submarine', 2)
  computer.choose_location(cruiser).length
  computer.choose_location(submarine).length

  game.prompt_player_initial_cruiser_placement
  board.valid_placement?(cruiser, @player_cruiser_coordinates)


end
