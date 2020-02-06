require './lib/game'
require './lib/game'

game = Game.new

print game.start_message

game.new_game_prompt


if game.start_another_game == true

  #Computer Places Ships

  game.prompt_player_ship_placement

end
