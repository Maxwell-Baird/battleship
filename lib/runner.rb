require './lib/game'
require './lib/ship'
require './lib/cell'
require './lib/computer'
require './lib/board'

game = Game.new
print game.start_message

game.new_game_prompt

if game.start_another_game == true
  game.computer_board_setup
  game.create_player_board
  game.player_board_setup

end
