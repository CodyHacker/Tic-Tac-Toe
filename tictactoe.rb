class GameBoard

  def initialize
    @@tic_tac_toe_board = Array.new(3) { Array.new(3) }
  end

  def self.show_array #for debugging only
    @@tic_tac_toe_board
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
    if @@tic_tac_toe_board.flatten.first == x_or_o && @@tic_tac_toe_board.flatten[4] == x_or_o && @@tic_tac_toe_board.flatten.last == x_or_o ||
      @@tic_tac_toe_board.flatten[2] == x_or_o && @@tic_tac_toe_board.flatten[4] == x_or_o && @@tic_tac_toe_board.flatten[6] == x_or_o      
      true
    end
    @@tic_tac_toe_board.each do |row|
      if row.all? {|cell| cell == x_or_o}
        return true
      end
    end
    false
  end

end




my_game = GameBoard.new

GameBoard.display_board
puts

my_game.make_move(0,0,"O")
my_game.make_move(0,1,"X")
my_game.make_move(0,2,"X")




GameBoard.display_board
my_game.check_if_won("X")




# tic_tac_toe_board[2][2] = "O"
# tic_tac_toe_board[1][1] = "O"

