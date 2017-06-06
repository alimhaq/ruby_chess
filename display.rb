require 'colorize'
require_relative 'cursor.rb'

class Display
  attr_reader :cursor, :board
  def initialize(board)
    @cursor = Cursor.new([1,1], board)
    @board = board
  end

  # def board
  #   @board = @cursor.board
  # end

  def render
    # MAP THE TOP LABELS TO LETTERS
    # puts @cursor.cursor_pos
    print "   0  1  2  3  4  5  6  7\n"
    @board.grid.each_with_index do |row, i|
      print "#{i}  "
      row.each_with_index do |piece, j|
        if [i,j] == @cursor.cursor_pos
          if piece.is_a?(NullPiece)
            (print "-".colorize(:color => :white, :background => :black) + "  ")
          else
            (print "P".colorize(:color => :white, :background => :black) + "  ")
          end
        else
          piece.is_a?(NullPiece) ? (print "-  ") : (print "P  ")
        end
      end
      puts
    end
  end
end
