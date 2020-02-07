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
  computer_cruiser = Ship.new('Computer Cruiser', 3)
  computer_submarine = Ship.new('Computer Submarine', 2)
  computer.choose_location(computer_cruiser).length
  computer.choose_location(computer_submarine).length

  game.prompt_player_initial_placement
  player_cruiser = Ship.new('Human Cruiser', 3)
  player_submarine = Ship.new('Human Submarine', 2)

  #Create cruiser coordinates
  player_cruiser_coordinates = []

    player_cruiser_coordinate1 = gets.chomp
      if board.valid_coordinate?(player_cruiser_coordinate1)
        player_cruiser_coordinates << player_cruiser_coordinate1
        print "Great! Now enter the next coordinate. > "

        player_cruiser_coordinate2 = gets.chomp
          if board.valid_coordinate?(player_cruiser_coordinate2)
            player_cruiser_coordinates << player_cruiser_coordinate2
            print "Great! Now enter the last coordinate. > "

            player_cruiser_coordinate3 = gets.chomp
              if board.valid_coordinate?(player_cruiser_coordinate3)
                player_cruiser_coordinates << player_cruiser_coordinate3
              else
                print "Hmmm...that isn't a valid coordinate. Start again. \n "
              end

          else
            print "Hmmm...that isn't a valid coordinate. Start again. \n "
          end
      else
        print "Hmmm...that isn't a valid coordinate. Start again. \n "
      end
    end

    if board.valid_placement?(player_cruiser, player_cruiser_coordinates)
      print "Your cruiser looks great! Now let's place your submarine (2 spaces). \nPick your first coordinate. > "
    else
      print "Hmmm...that doesn't look like a valid placement. Let's start again. \n "
    end

    #Create submarine coordinates
    player_submarine_coordinates = []

      player_submarine_coordinate1 = gets.chomp
        if board.valid_coordinate?(player_submarine_coordinate1)
          player_submarine_coordinates << player_submarine_coordinate1
          print "Great! Now enter the next coordinate. > "

          player_submarine_coordinate2 = gets.chomp
            if board.valid_coordinate?(player_submarine_coordinate2)
              player_submarine_coordinates << player_submarine_coordinate2
            else
              print "Hmmm...that isn't a valid coordinate. Start again. \n "
            end
        else
          print "Hmmm...that isn't a valid coordinate. Start again. \n "
        end

      if board.valid_placement?(player_submarine, player_submarine_coordinates)
        print "Your submarine looks great! Now let's play the game! \n "
      else
        print "Hmmm...that doesn't look like a valid placement. Let's start again. \n "
      end
