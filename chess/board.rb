require_relative "piece"
require "byebug"
class Board
  
  def initialize 
    @grid = Array.new (8) { Array.new(8, NullPiece.new)}
  end
  
  def populate_board
    [0,1,-1,-2].each do |row|
      @grid[row].map! { |pos| pos = Piece.new }
    end
    
  end
  
  def display_board
    @grid.each do |row|
      p row
    end
  end
  
  def move_piece(start_pos, end_pos)
    raise StandardError.new("Start position empty") if self[start_pos].is_a?(NullPiece)
    raise StandardError.new("End position occupied") if self[end_pos].is_a?(Piece)
    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.new
  end
  
  private
  
  def [] (pos)
    x,y = pos
    @grid[x][y]
  end
  
  def []= (pos, val)
    x,y = pos
    @grid[x][y] = val
  end
  
end

if $PROGRAM_NAME == __FILE__
  brd = Board.new
  brd.populate_board
  brd.move_piece([0,0],[1,0])
  brd.display_board
end