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

  def check_if_won?(x_or_o)
    if three_in_line(x_or_o)
      puts
      puts x_or_o + " wins!"
      puts
      return true
    else
      return false
    end
  end

  def make_move(row, column, x_or_o)
    @row = row
    @column = column
    @x_or_o = x_or_o

    if @@tic_tac_toe_board[@row][@column].nil?
      @@tic_tac_toe_board[@row][@column] = @x_or_o
      return true
    else
      warn_user
      return false
    end
  end

private
  def warn_user
    puts
    puts "That square is taken!"
    puts
  end

  def three_in_line(x_or_o)
    #check columns
    if @@tic_tac_toe_board.flatten[0] == x_or_o && @@tic_tac_toe_board.flatten[3] == x_or_o && @@tic_tac_toe_board.flatten[6] == x_or_o ||
      @@tic_tac_toe_board.flatten[1] == x_or_o && @@tic_tac_toe_board.flatten[4] == x_or_o && @@tic_tac_toe_board.flatten[7] == x_or_o ||  
      @@tic_tac_toe_board.flatten[2] == x_or_o && @@tic_tac_toe_board.flatten[5] == x_or_o && @@tic_tac_toe_board.flatten.last == x_or_o    
      return true
    end

    #check diags
    if @@tic_tac_toe_board.flatten.first == x_or_o && @@tic_tac_toe_board.flatten[4] == x_or_o && @@tic_tac_toe_board.flatten.last == x_or_o ||
      @@tic_tac_toe_board.flatten[2] == x_or_o && @@tic_tac_toe_board.flatten[4] == x_or_o && @@tic_tac_toe_board.flatten[6] == x_or_o      
      return true
    end
    #check rows
    @@tic_tac_toe_board.each do |row|
      if row.all? {|cell| cell == x_or_o}
        return true
      end
    end
    false
  end

end





my_game = GameBoard.new
x_or_o = "X"

until my_game.check_if_won?(x_or_o)
  puts
  GameBoard.display_board
  puts
  puts x_or_o + ", please enter your move: "
  the_arguments = gets.chomp
  row = the_arguments[0].to_i
  column = the_arguments[-1].to_i
  if my_game.make_move(row, column, x_or_o)
    if my_game.check_if_won?(x_or_o)
      puts
      GameBoard.display_board
      puts
      exit
    end
      x_or_o = x_or_o == "X" ? "O" : "X"
  end
end



#check left to right diags
# my_game.make_move(0,0,"X")
# my_game.make_move(1,1,"X")
# my_game.make_move(2,2,"X")

#check right to left left diags
# my_game.make_move(0,2,"X")
# my_game.make_move(1,1,"X")
# my_game.make_move(2,0,"X")

#Top row
# my_game.make_move(0,0,"X")
# my_game.make_move(0,1,"X")
# my_game.make_move(0,2,"X")

#Middle row
# my_game.make_move(1,0,"X")
# my_game.make_move(1,1,"X")
# my_game.make_move(1,2,"X")

#Bottom row
# my_game.make_move(2,0,"X")
# my_game.make_move(2,1,"X")
# my_game.make_move(2,2,"X")

#First column
# my_game.make_move(0,0,"X")
# my_game.make_move(1,0,"X")
# my_game.make_move(2,0,"X")

#Second column
# my_game.make_move(0,1,"X")
# my_game.make_move(1,1,"O")
# my_game.make_move(2,1,"O")

#Third column
# my_game.make_move(0,2,"X")
# my_game.make_move(1,2,"X")
# my_game.make_move(2,2,"X")

# p GameBoard.show_array.flatten



# GameBoard.display_board
# my_game.check_if_won("X")




# tic_tac_toe_board[2][2] = "O"
# tic_tac_toe_board[1][1] = "O"

