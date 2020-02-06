class Game

  attr_reader :start_message

  def initialize
    @start_message = "Welcome to BATTLESHIP \n Enter p to play. \n Enter q to quit. \n"
  end

  def prompt_player_ship_placement
    print "I have laid out my ships on the grid. \nYou now need to lay out your two ships. \nThe Cruiser is three units long and the Submarine is two units long. \n  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \nEnter the squares for the Cruiser (3 spaces):
> "
    gets.chomp
  end

end
