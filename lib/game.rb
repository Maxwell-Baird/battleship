class Game

  attr_reader :start_message, :start_another_game

  def initialize
    @start_message = "Welcome to BATTLESHIP \n Enter p to play. \n Enter q to quit. \n"
    @start_another_game = false
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

  def prompt_player_initial_cruiser_placement
    print "I have laid out my ships on the grid. \nYou now need to lay out your two ships. \nThe Cruiser is three units long and the Submarine is two units long. \n  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \nEnter the first square for the Cruiser (This should be 1 space and correspond to the grid -- for example, A3):
> "
    @player_cruiser_coordinates = []

    @player_cruiser_coordinates << gets.chomp

    print "Great! Now enter the next coordinate. > "

    @player_cruiser_coordinates << gets.chomp

    print "Great! Now enter the last coordinate. > "

    @player_cruiser_coordinates << gets.chomp

  end


end
