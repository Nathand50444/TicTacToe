class TicTacToe

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " "] # Initialize sets the @board variable to a new, empty array that represents the game board.
    end

    WIN_COMBINATIONS = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], 
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]                    # Constant represents all winning combinations of the Tictactoe game.
    ]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]}"
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]}"
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]}"
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(index, token)
        @board[index] = token
    end
        
    def position_taken?(index)
        if @board[index] == " "
            return false
        else 
            return true
        end
    end

    def valid_move?(index)
        !position_taken?(index) && index.between?(0, 8)
    end 

    def turn_count
        @board.count{|square| square != " "}
    end   

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def turn
        puts "Choose a position (1-9): "
        position = gets.chomp
        index = input_to_index(position)
        if valid_move?(index)
            move(index, current_player)
            display_board
            if game_over?
              puts "Game Over!"
            else
              turn # Call the turn method recursively for the next turn
            end
        else
            turn # If the move is invalid, call the turn method recursively to allow the player to try again
        end
    end

    def game_over?
        WIN_COMBINATIONS.each do |combo|
          if combo.all? { |index| @board[index] == 'X' }
            puts "Player X wins!"
            return true
          elsif combo.all? { |index| @board[index] == 'O' }
            puts "Player O wins!"
            return true
          end
        end
      
        if @board.include?(' ')
          return false
        else
          puts "It's a draw!"
          return true 
        end
    end
end
