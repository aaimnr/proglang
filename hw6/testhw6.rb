require 'minitest/autorun'

require_relative './hw6provided'
require_relative './hw6assignment'
require 'json'

class TetrisTest < MiniTest::Unit::TestCase

  def setup
    mt = MyTetris.new
    @brd = MyBoard.new(mt)
  end

  def test_My_Pieces_count
    @brd.next_piece
    #p = @brd.instance_variable_get(:@current_block)
    assert MyPiece::All_My_Pieces.count, 10
  end

  

end

