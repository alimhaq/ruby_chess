# require_relative 'board.rb'
# require_relative 'player.rb'
#
# class Game
#   def initialize
#   end
#
#   def run
#     brd = Board.new
#     puts "Welcome to Chess!" ; sleep(1)
#     player = Player.new("white")
#     disp = Display.new(brd)
#     while true
#       system 'clear'
#       disp.render
#       disp.cursor.get_input
#       break if brd.checkmate?("white")
#       @@player = p2
#     end
#   end
# end
#
# game = Game.new
# game.run
