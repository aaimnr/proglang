# University of Washington, Programming Languages, Homework 6, hw6runner.rb

# This is the only file you turn in, so do not modify the other files as
# part of your solution.

class MyTetris < Tetris
  # your enhancements here

  def set_board
    @canvas = TetrisCanvas.new
    @board = MyBoard.new(self)
    @canvas.place(@board.block_size * @board.num_rows + 3,
                  @board.block_size * @board.num_columns + 6, 24, 80)
    @board.draw
  end

  def key_bindings
    super
    @root.bind('u', proc {@board.rotate_180})
  end

end

class MyPiece < Piece
  # The constant All_My_Pieces should be declared here
  All_My_Pieces = All_Pieces +
[rotations([[0,0],[1,0],[0,1],[1,1],[2,1]]),
 [[[-2,0],[-1,0],[0,0],[1,0],[2,0]], #long, horizontal
  [[0,-2],[0,-1],[0,0],[0,1],[0,2]]],#long, vertical
 rotations([[0,0],[0,1],[1,1]])]

  # your enhancements here

end

class MyBoard < Board
  # your enhancements here
  def rotate_180
    rotate_clockwise
    rotate_clockwise
  end

end
