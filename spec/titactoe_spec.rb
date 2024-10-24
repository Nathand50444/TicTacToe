require '../lib/tictactoe'

# Check all outcomes for game_over to be triggered

# 1. When there are no " " entries left then 'game_over' is true

# 2. When "X X X" combination is present then 'game_over' is true

# Current player returns 'X' when the turn_count is even and 'O' when odd

# Check outcomes for position taken when provided with data.

describe TicTacToe do

  let(:game) { TicTacToe.new }

  describe '#game_over' do
    it 'triggers the game_over sequence' do
      game.instance_variable_set(:@board, [" ", " ", " ", " ", " ", " ", " ", " ", " "])
      allow(game).to receive(:gets).and_return("0")
      allow(game).to receive(:gets).and_return("4")
      allow(game).to receive(:gets).and_return("1")
      allow(game).to receive(:gets).and_return("5")
      allow(game).to receive(:gets).and_return("2")
      expect { game.game_over? }.to output("Player X wins!").to_stdout
    end
  end
end