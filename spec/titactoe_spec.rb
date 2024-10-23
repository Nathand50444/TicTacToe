require '../lib/tictactoe'

# Check all outcomes for game_over to be triggered

# 1. When there are no " " entries left then 'game_over' is true

# 2. When "X X X" combination is present then 'game_over' is true

# Current player returns 'X' when the turn_count is even and 'O' when odd

# Check outcomes for position taken when provided with data.

describe TicTacToe do

  let(:game) { described_class.new }

  context 'when the board shows the "X" "X" "X" sequence' do
    let(:board) { ["X", "X", "X", "O", "O", " ", " ", " ", " "] }
    it 'game_over returns true' do
      expect(:board.game_over?).to eq true
    end
  end

  describe '#game_over' do
    context 'when the board shows the "X" "X" "X" sequence' do
      it 'returns "Player X wins!"' do
        @board = ["X", "X", "X", "O", "O", " ", " ", " ", " "] # Arrange
        game_over
        expect(game_over).to eq true # Assert
      end
    end
  end
end