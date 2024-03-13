class tictactoe

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " "] # Initialize sets the @board variable to a new, empty array that represents the game board.
    end

    WIN_COMBINATIONS = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], 
        [0, 3, 6], [1, 4, 7], [2, 5, 8]
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
end
