module TicTacToe
  class Board
    attr_reader :grid
    def initialize(grid = Array.new(3) { Array.new(3) { Cell.new } })
      @grid = grid
    end

    def get_cell(x, y)
      grid[x][y]
    end

    def set_cell(x, y, value)
      get_cell(x, y).value = value
    end

    def winning_positions
      grid + # rows
      grid.transpose + # columns
      diagonals # two diagonals
    end

    def diagonals
      [
        [grid.get_cell(0, 0), grid.get_cell(1, 1), grid.get_cell(2, 2)],
        [grid.get_cell(0, 2), grid.get_cell(1, 1), grid.get_cell(2, 0)]
      ]
    end
  end
end
