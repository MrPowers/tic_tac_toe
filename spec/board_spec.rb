require "spec_helper"

module TicTacToe
  describe Board do

    context "#initialize" do
      it "initializes the board with a grid" do
        expect { Board.new(grid: "grid") }.to_not raise_error
      end

      it "sets the grid with three rows by default" do
        board = Board.new
        expect(board.grid.size).to eq(3)
      end

      it "creates three things in each row by default" do
        board = Board.new
        board.grid.each do |row|
          expect(row.size).to eq(3)
        end
      end
    end

    context "#grid" do
      it "returns the grid" do
        board = Board.new(grid: "blah")
        expect(board.grid).to eq "blah"
      end
    end

    context "#get_cell" do
      it "returns the cell based on the (x, y) coordinate" do
        grid = [["", "", ""], ["", "", "something"], ["", "", ""]]
        board = Board.new(grid: grid)
        expect(board.get_cell(2, 1)).to eq "something"
      end
    end

    context "#set_cell" do
      it "updates the value of the cell object at a (x, y) coordinate" do
        Cat = Struct.new(:value)
        grid = [[Cat.new("cool"), "", ""], ["", "", ""], ["", "", ""]]
        board = Board.new(grid: grid)
        board.set_cell(0, 0, "meow")
        expect(board.get_cell(0, 0).value).to eq "meow"
      end
    end

TestCell = Struct.new(:value)
let(:x_cell) { TestCell.new("X") }
let(:y_cell) { TestCell.new("Y") }
let(:empty) { TestCell.new }

context "#game_over" do
  it "returns :winner if winner? is true" do
    board = Board.new
    allow(board).to receive(:winner?) { true }
    expect(board.game_over).to eq :winner
  end

  it "returns :draw if winner? is false and draw? is true" do
    board = Board.new
    allow(board).to receive(:winner?) { false }
    allow(board).to receive(:draw?) { true }
    expect(board.game_over).to eq :draw
  end

  it "returns false if winner? is false and draw? is false" do
    board = Board.new
    allow(board).to receive(:winner?) { false }
    allow(board).to receive(:draw?) { false }
    expect(board.game_over).to be_falsey
  end

  it "returns :winner when row has objects with values that are all the same" do
    grid = [
      [x_cell, x_cell, x_cell],
      [y_cell, x_cell, y_cell],
      [y_cell, y_cell, empty]
    ]
    board = Board.new(grid: grid)
    expect(board.game_over).to eq :winner
  end

  it "returns :winner when colum has objects with values that are all the same" do
    grid = [
      [x_cell, x_cell, empty],
      [y_cell, x_cell, y_cell],
      [y_cell, x_cell, empty]
    ]
    board = Board.new(grid: grid)
    expect(board.game_over).to eq :winner
  end

  it "returns :winner when diagonal has objects with values that are all the same" do
    grid = [
      [x_cell, empty, empty],
      [y_cell, x_cell, y_cell],
      [y_cell, x_cell, x_cell]
    ]
    board = Board.new(grid: grid)
    expect(board.game_over).to eq :winner
  end

  it "returns :draw when all spaces on the board are taken" do
    grid = [
      [x_cell, y_cell, x_cell],
      [y_cell, x_cell, y_cell],
      [y_cell, x_cell, y_cell]
    ]
    board = Board.new(grid: grid)
    expect(board.game_over).to eq :draw
  end

  it "returns false when there is no winner or draw" do
    grid = [
      [x_cell, empty, empty],
      [y_cell, empty, empty],
      [y_cell, empty, empty]
    ]
    board = Board.new(grid: grid)
    expect(board.game_over).to be_falsey
  end
end

  end
end


#module TicTacToe
  #describe Board do

    #context "#initialize" do
      #it "initializes the board with a grid" do
        #board = Board.new(grid: "grid")
        #expect(board.grid).to eq "grid"
      #end

      #it "initializes the board with a 3 X 3 Array by default" do
        #board = Board.new
        #expect(board.grid).to be_an_instance_of Array
        #board.grid.each do |row|
          #expect(row).to be_an_instance_of Array
        #end
      #end
    #end

    #context "#winner" do
      #it "returns 'X' if there are all Xs in a winning_position" do
        #board = Board.new
        #board.set_cell(0, 0, "X")
        #board.set_cell(1, 0, "X")
        #board.set_cell(2, 0, "X")
        #expect(board.winner).to eq "X"
      #end

      #it "returns 'O' if there are all Os in a winning_position" do
        #board = Board.new
        #board.set_cell(2, 0, "O")
        #board.set_cell(1, 1, "O")
        #board.set_cell(0, 2, "O")
        #expect(board.winner).to eq "O"
      #end

      #it "returns nil if there is no winner" do
        #expect(Board.new.winner).to be_nil
      #end
    #end

    #context "#draw" do
      #it "returns true if the game ended in a draw" do
        #pending
      #end
    #end

  #end
#end
