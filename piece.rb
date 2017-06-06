class Piece
  def initialize(pos, board)
    @moves = []
    @pos = pos
    @board = board
  end

  def moves
    output_moves = []
    deltas = move_dirs
    deltas.each do |delta|
      if legal_move?
        output_moves << [@pos[0] + delta[0], @pos[1] + delta[1]]
      end
    end
  end

  def legal_move?(end_pos)

  end
end


module SlidingPiece
  def move_dirs
    delta_arr = []
    delta_arr << (-7..-1).to_a.zip(Array.new(7) {0}) if self.is_a?(Rook)
    delta_arr << (1..7).to_a.zip(Array.new(7) {0}) if self.is_a?(Rook)
    # delta_arr.concat((-7..7).to_a.zip(Array.new(15) {0})) if self.is_a?(Queen) || self.is_a?(Rook)
    # delta_arr.concat(Array.new(15) {0}.zip((-7..7).to_a)) if self.is_a?(Queen) || self.is_a?(Rook)
    delta_arr.concat((-7..7).to_a.zip((-7..7).to_a)) if self.is_a?(Queen) || self.is_a?(Bishop)
    delta_arr.concat((-7..7).to_a.zip((7..-7).to_a)) if self.is_a?(Queen) || self.is_a?(Bishop)
  end
end

module SteppingPiece

end

class NullPiece < Piece
  def initialize
  end
end
