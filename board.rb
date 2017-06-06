require_relative 'piece.rb'
require_relative 'display.rb'

class Board
  attr_reader :grid
  def initialize
    @grid = populate_board
  end

  def populate_board
    # rows 0 and 1 => white pieces
    # rows 6 and 7 => black pieces
    @grid = Array.new(8) {Array.new(8)}
    (0..7).each do |row|
      if row < 2 || row > 5
        @grid[row] = Array.new(8) {Piece.new}
      else
        @grid[row] = Array.new(8) {NullPiece.new}
      end
    end
    @grid
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def move_piece(start_pos, end_pos)

    # CHANGE TO SYNTACTIC SUGAR INDEXING
    row1, col1 = start_pos
    row2, col2 = end_pos
    if @grid[row1][col1].is_a?(NullPiece)
      raise ArgumentError.new('No piece at starting position')
    elsif legal_move?(end_pos)
      raise ArgumentError.new('Invalid Move')
    end
    @grid[row2][col2] = @grid[row1][row1]
    @grid[row1][row1] = NullPiece.new
  end

  def legal_move?(end_pos)
    false
  end

  def in_bounds?(pos)
    pos.all? {|el| el.between?(0, 7)}
  end

end

if __FILE__ == $PROGRAM_NAME
  brd = Board.new
  disp = Display.new(brd)
  while true
    system 'clear'
    disp.render
    disp.cursor.get_input
    # disp.render
    # 1
  end
end
