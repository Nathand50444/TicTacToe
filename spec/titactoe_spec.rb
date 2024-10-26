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
      end

      it 'adds the X token to position 3' do
        expect {  }.to output("Player O wins!\n").to_stdout
        expect(game.game_over?).to eq(true)
      end
    end
  end
end