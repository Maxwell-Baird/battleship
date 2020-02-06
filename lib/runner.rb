require './lib/game'
require './lib/game'

game = Game.new

print game.start_message

start_prompt = gets.chomp

  if start_prompt == "p"
    puts "Great! Let's play!"

    #Computer places their ships

    game.prompt_player_ship_placement

















  elsif start_prompt == "q"
    puts "Goodbye!"
  else
    puts "Sorry, I don't understand. Goodbye!"
  end
#Computer places their ships!
