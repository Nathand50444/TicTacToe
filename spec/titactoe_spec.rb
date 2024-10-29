require '../lib/tictactoe'

# Checkk all outcomes for game_over to be triggered

# 1. When there are no " " entries left then 'game_over' is true

# 2. When "X X X" combination is present then 'game_over' is true

# Current player returns 'X' when the turn_count is even and 'O' when odd

# Check outcomes for position taken when provided with data.

describe TicTacToe do
  describe '#valid_move?' do
    it 'returns true for an empty spot' do
      game = TicTacToe.new
      expect(game.valid_move?(0)).to eq(true)
    end

    it 'returns false for a taken spot' do
      game = TicTacToe.new
      game.move(0, "X")
      expect(game.valid_move?(0)).to eq(false)
    end
  end

  describe '#game_over?' do
    context 'when three X values are in a row' do
      let(:game) { TicTacToe.new }

      before do
        game.instance_variable_set(:@board, ["X", "X", "X", "O", "O", " ", " ", " ", " "])
      end

      it 'returns true and outputs "Player X wins!"' do
        expect { game.game_over? }.to output("Player X wins!\n").to_stdout
        expect(game.game_over?).to eq(true)
      end
    end
  end

  describe '#game_over?' do
    context 'when three O values are in a row' do
      let(:game) { TicTacToe.new }

      before do
        game.instance_variable_set(:@board, ["X", "X", "O", " ", "O", "X", "O", " ", " "])
      end

      it 'returns true and outputs "Player O wins!"' do
        expect { game.game_over? }.to output("Player O wins!\n").to_stdout
        expect(game.game_over?).to eq(true)
      end
    end
  end

  describe '#display_board' do
    let(:game) { TicTacToe.new }

    before do
      game.instance_variable_set(:@board, ["X", "X", "O", " ", "O", "X", "O", " ", " "])
    end

    it 'outputs the game_board' do
      expected_output = <<~BOARD
       X | X | O
      -----------
         | O | X
      -----------
       O |   |  
    BOARD
      expect{ game.display_board }.to output(expected_output).to_stdout
    end
  end

  describe '#input_to_index' do
    it 'returns the input - 1' do
      game = TicTacToe.new
      expect(game.input_to_index(3)).to eq(2)
    end
  end

  describe '#move' do
    context 'when player X chooses position 3' do
      let(:game) { TicTacToe.new }

      before do
        game.instance_variable_set(:@board, [" ", " ", " ", " ", " ", " ", " ", " ", " "])
        game.move(2, "X")
      end

      it 'adds the X token to position 3' do
        expect(game.instance_variable_get(:@board)[2]).to eq("X")
      end
    end
  end

  describe '#turn_count' do
    context 'when the board has 4 positions occupied' do
      let(:game) { TicTacToe.new }

      before do
        game.instance_variable_set(:@board, ["O", "X", "O", "X", "X", "O", "X", "O", "X"])
      end

      it 'number of turns equals 9 and the game is a draw' do
        expect(game.turn_count).to eq(9)
        expect { game.game_over? }.to output("It's a draw!\n").to_stdout
      end
    end
  end

  describe '#turn_count' do
    context 'when the board has 4 spaces occupied' do
      let(:game) { TicTacToe.new }

      before do
        game.instance_variable_set(:@board, ["X", "O", "O", " ", " ", "X", " ", " ", " "])
      end

      it 'number of turns equals 4' do
        expect(game.turn_count).to eq(4)
      end
    end
  end

  describe '#current_player' do
    context 'when the turn count is even' do
      let(:game) { TicTacToe.new }

      before do
        game.instance_variable_set(:@board, ["X", "O", "O", " ", " ", "X", " ", " ", " "])
      end

      it 'sets the current player as X' do
        expect(game.current_player).to eq("X")
      end
    end
  end

  describe '#position_taken?' do
    context 'when the position chosen is occupied' do
      let(:game) { TicTacToe.new }

      before do
        game.instance_variable_set(:@board, ["X", "O", "O", " ", " ", "X", " ", " ", " "])
      end

      it 'returns true' do
        expect(game.position_taken?(0)).to eq(true)
      end
    end
  end
end