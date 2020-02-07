require './lib/game'
require './lib/ship'
require './lib/cell'
require './lib/computer'
require './lib/board'

game = Game.new

print game.start_message

game.new_game_prompt

if game.start_another_game == true
  game.create_board

end
