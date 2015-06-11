class GameBoard

  def initialize
    @@tic_tac_toe_board = Array.new(3) { Array.new(3) }
  end

  def self.display_board
    @@tic_tac_toe_board.each do|row| 
      row.each {|cell| print ' ' + (cell ? cell : '_') + ' '}
      puts
    end
  end

  def check_if_won(x_or_o)
    if three_in_line(x_or_o)
      puts x_or_o + " wins!"
      exit
    end
  end

  def make_move(row, column, x_or_o)
    @row = row
    @column = column
    @x_or_o = x_or_o

    if @@tic_tac_toe_board[@row][@column].nil?
      @@tic_tac_toe_board[@row][@column] = @x_or_o
    else
      warn_user
    end
  end

private
  def warn_user
    puts "That square is taken!"
  end

  def three_in_line(x_or_o)
    true
  end
end




my_game = GameBoard.new

GameBoard.display_board
puts



my_game.make_move(0,1,"X")

my_game.make_move(1,1,"X")
my_game.make_move(2,1,"O")


my_game.make_move(0,0,"X")
my_game.make_move(2,2,"X")
GameBoard.display_board

my_game.check_if_won("X")




# tic_tac_toe_board[2][2] = "O"
# tic_tac_toe_board[1][1] = "O"

