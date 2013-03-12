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
 [[[0,0],[0,1],[1,1]]]
]
  # your enhancements here
  def self.next_piece (board)
   MyPiece.new(All_My_Pieces.sample, board)
   # puts All_My_Pieces.to_json
  end


end

class MyBoard < Board
  # your enhancements here

  def initialize (game)
    @grid = Array.new(num_rows) {Array.new(num_columns)}
    @current_block = MyPiece.next_piece(self)
    @score = 0
    @game = game
    @delay = 500
  end

  def rotate_180
    rotate_clockwise
    rotate_clockwise
  end

def next_piece
  @current_block = MyPiece.next_piece(self)
  @current_pos = nil
end

  # gets the information from the current piece about where it is and uses this
  # to store the piece on the board itself.  Then calls remove_filled.
  def store_current
    locations = @current_block.current_rotation
    displacement = @current_block.position
    elements_count = locations.length

    #range high value adjusted dynamically
    (0..(elements_count-1)).each{|index| 
      current = locations[index];
      @grid[current[1]+displacement[1]][current[0]+displacement[0]] = 
      @current_pos[index]
    }
    remove_filled
    @delay = [@delay - 2, 80].max
  end


end
