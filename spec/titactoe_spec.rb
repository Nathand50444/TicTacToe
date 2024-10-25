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
end
