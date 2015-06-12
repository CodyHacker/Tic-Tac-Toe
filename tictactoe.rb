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

  def check_if_won_or_even?(x_or_o)
    if three_in_line?(x_or_o)
      puts
      puts x_or_o + " wins!"
      puts
      true
    elsif no_nils?
      puts
      puts "A Tie!"
      puts
      return true
    else
      false
    end
  end

  def make_move(row, column, x_or_o)
    @row = row
    @column = column
    @x_or_o = x_or_o

    if @@tic_tac_toe_board[@row][@column].nil?
      @@tic_tac_toe_board[@row][@column] = @x_or_o
      true
    else
      warn_user
      false
    end
  end

  private
  def warn_user
    puts
    puts "That square is taken!"
    puts
  end

  def no_nils?
    if @@tic_tac_toe_board.flatten.any? {|cell| cell.nil?}
      false
    else
      true
    end
  end

  def three_in_line?(x_or_o)
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

x_or_o = "X" #X starts, change to O for O to start.
row = nil
column = nil
until my_game.check_if_won_or_even?(x_or_o)
  puts
  GameBoard.display_board
  puts
  print x_or_o + ", please enter your move: "

  loop do
    the_arguments = gets.chomp
    row = the_arguments[0]
    column = the_arguments[-1]
    if ['0','1','2'].include?(row) && ['0','1','2'].include?(column)
      row = row.to_i
      column = column.to_i
      break
    else
      puts
      print "Invalid entry, please enter as row, column where row and column are (0..2): "
    end
  end

  if my_game.make_move(row, column, x_or_o)
    if my_game.check_if_won_or_even?(x_or_o)
      puts
      GameBoard.display_board
      puts
      exit
    end
    x_or_o = x_or_o == "X" ? "O" : "X"
  end

end



