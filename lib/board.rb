class Board
  attr_accessor :board
  def initialize 
    @f = "\u2551"
    @l = "\u255A"
    @r = "\u255D"
    @d = "\u2550\u2550\u2550"

    @board = [["   ", "   ", "   ", "   ", "   ", "   ", "   "],
              ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
              ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
              ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
              ["   ", "   ", "   ", "   ", "   ", "   ", "   "],
              ["   ", "   ", "   ", "   ", "   ", "   ", "   "]]
  end

  def view_board
    puts
    puts @f + @board[0][0] + @board[0][1] + @board[0][2] + @board[0][3] + @board[0][4] + @board[0][5] + @board[0][6] + @f
    puts @f + @board[1][0] + @board[1][1] + @board[1][2] + @board[1][3] + @board[1][4] + @board[1][5] + @board[1][6] + @f
    puts @f + @board[2][0] + @board[2][1] + @board[2][2] + @board[2][3] + @board[2][4] + @board[2][5] + @board[2][6] + @f
    puts @f + @board[3][0] + @board[3][1] + @board[3][2] + @board[3][3] + @board[3][4] + @board[3][5] + @board[3][6] + @f
    puts @f + @board[4][0] + @board[4][1] + @board[4][2] + @board[4][3] + @board[4][4] + @board[4][5] + @board[4][6] + @f
    puts @f + @board[5][0] + @board[5][1] + @board[5][2] + @board[5][3] + @board[5][4] + @board[5][5] + @board[5][6] + @f
    puts @l + @d * 7 + @r
    puts "  A  B  C  D  E  F  G  "
  end
end