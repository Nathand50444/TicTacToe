class TicTacToe

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]   # Initialize sets the @board variable to a new, empty array that represents the game board.
        turn
    end

    WIN_COMBINATIONS = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], 
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]                    # Constant represents all winning combinations of the Tictactoe game.
    ]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]}"  # display-board puts the game board and places each of the @board strings in place, where appropriate.
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]}"
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]}"
    end

    def input_to_index(input)     # As per the 'turn' method, the player will enter a number for what position they would like to take. 
        input.to_i - 1            # The player input is translated to the index position using 'input_to_index' bu using -1. (i.e. position 4 is @board[3])
    end

    def move(index, token)        # When 'move' is called, the position chosen is given the player's token (i.e. "X" or "O").
        @board[index] = token
    end
        
    def position_taken?(index)    # 'position_taken' checks that if the index chosen does NOT contain an empty string " ".
        @board[index] != " "      # i.e. if @board[1] == "X" then 'position_taken' == true.
    end

    def valid_move?(index)
        index.between?(0, 8) && !position_taken?(index)     # 'valid_move' ensures that the chosen index is between 0-8 and that 'position_taken' not false.
    end

    def turn_count
        @board.count{|square| square != " "} 
    end   

    def current_player
        turn_count.even? ? "X" : "O"    # Alongside 'turn_count', this keeps track of the player's turn and given token.
    end

    def turn
        puts "Choose a position (1-9): "          # The 'turn' method manages each player's turn in the game.
        position = gets.strip
        index = input_to_index(position)          # The player inputs their chosen position which is converted to an index of @board using 'input_to_index'.
        if valid_move?(index)                     # The index is checked using 'valid_move', if satisfied the move takes place.
            move(index, current_player)           # If 'valid_move' is not satisfied, 'turn' is called again.
            display_board
            if game_over?
              puts "Game Over!"
            else
              turn
            end
        else
            turn
        end
    end

    def game_over?                                                    # 'game-over?' checks whether the win, lose or draw conditions have been met for the game to end.
        WIN_COMBINATIONS.each do |combo|                              # Here we iterate through each winning combination as per the 'WON_COMBINATIONS' constant.
          if combo.all? { |index| @board[index] == 'X' }              # Within each iteration, we check if all elements of the current combination are the gievn token, here "X".
            puts "Player X wins!"
            return true                                             
          elsif combo.all? { |index| @board[index] == 'O' }           # Repeated for player "O" and both player victories will put "Player wins!" and return true for the method.
            puts "Player O wins!"
            return true
          end
        end
      
        if @board.include?(" ")                                       # If none of the win combinations are met, the method will return false indicating the game is NOT over yet.
          return false
        else
          puts "It's a draw!"                                         # If all other conditions aren't met, the game is a draw.
          return true 
        end                                                           # If 'game_over' is true, this will trigger a check in the 'turn' method that will indicate the game is over.
    end
end
