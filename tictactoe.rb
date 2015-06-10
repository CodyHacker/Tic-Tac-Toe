class GameBoard
  def initialize
    @@tic_tac_toe_board = Array.new(3) { Array.new(3) }
  end

  def self.tic_tac_toe_board
    @@tic_tac_toe_board
  end

  def put_piece
    @@tic_tac_toe_board[@row][@column] = @x_or_o
  end

  def make_move(row, column, x_or_o)
    @row = row
    @column = column
    @x_or_o = x_or_o

    if @@tic_tac_toe_board.is_empty?
      put_piece(@row, @column, @x_or_o)
    else
      warn_user
    end

    def is_empty?
      
    end
end


my_game = GameBoard.new

my_game.make_move(1,1,"X")

# tic_tac_toe_board[2][2] = "O"
# tic_tac_toe_board[1][1] = "O"

p GameBoard.tic_tac_toe_board