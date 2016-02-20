
WIN_COMBINATIONS = [
    [0,1,2],[3,4,5],[6,7,8],
    [0,3,6],[1,4,7],[2,5,8],
    [0,4,8],[6,4,2]
    ]
# ***********************************************************************
def display_board (board)
  
  cell = "   ";
  pipe = "|";
  row = "-----------";
  puts " #{board[0]} " + pipe + " #{board[1]} " + pipe + " #{board[2]} "
  puts row
  puts " #{board[3]} " + pipe + " #{board[4]} " + pipe + " #{board[5]} "
  puts row
  puts " #{board[6]} " + pipe + " #{board[7]} " + pipe + " #{board[8]} "
end
# ************************************************************************
def move(board, position, token)
  
  position = position.to_i
  board[position - 1] = token
  display_board(board)
end
# ************************************************************************
def position_taken?(board, position)
  
  if board[position] == " "
    false
  elsif board[position] == ""
    false
  elsif board[position] == nil
    false
  else board[position] == "X" || board[position] == "O"
    true
  end
end
# *******************************************************************
def valid_move?(board, position)
  position = position.to_i
  position = position - 1
 
  if position_taken?(board, position) || !(position.between?(0, 8))
    false
  else
    true
  end
end  
# ***************************************************************
def turn(board)
  puts "Please enter 1-9:"
  token = current_player(board)
  position = gets.strip
  if valid_move?(board, position) == true
    move(board, position, token)
    display_board(board)
  else
    turn(board)
  end
end
# ********************************************************************
def turn_count (board)
  count = 0
  board.each do |token|
    if token == "X" || token == "O"
      count += 1
      else
      count += 0
    end
  end
  return count
end
# *********************************************************************
def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
    else
    return "O"
  end
end
# *********************************************************************
def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
  board[win_combo[0]] == board[win_combo[1]] && board[win_combo[1]] == board[win_combo[2]] && position_taken?(board, win_combo[0])
  end
  end
# ****************************************************************************************

def full?(board)
  board.all? {|token| token == "X" || token == "O"}
end
# *********************************************************************

def draw?(board)
  !won?(board) && full?(board)
end
# *********************************************************************

def over?(board)
  won?(board) || full?(board) || draw?(board)
end
# **********************************************************************

def winner(board)
  if win_combo = won?(board)
    board[win_combo.first]
  end
 
end # end method
# *********************************************************************
def play(board)
  while over?(board) == !true
    turn(board)
  end
  
  if winner(board) == "X"
    puts "Congratulations X!"
    elsif winner(board) == "O"
    puts "Congratulations O!"
    else
    puts "Cats Game!"
  end
end

