# frozen_string_literal: true

def display_board(board)
  puts " #{board[0][0]} " '|' " #{board[0][1]} " '|' " #{board[0][2]} "
  puts seperator = '-----------'
  puts " #{board[1][0]} " '|' " #{board[1][1]} " '|' " #{board[1][2]} "
  puts seperator
  puts " #{board[2][0]} " '|' " #{board[2][1]} " '|' " #{board[2][2]} "
end

def update_board(board, row_index, column_index, count)
  board[row_index][column_index] = if count.odd?
                                     'x'
                                   else
                                     'o'
                                   end
end

def reset_board(_board, _count)
  board = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
  count = 9
end

def get_player_choice(board)
  row_index = column_index = 0
  loop do
    print 'Enter row number #[1-3]: '
    row_index = gets.chomp.to_i - 1
    print 'Enter column number #[1-3]: '
    column_index = gets.chomp.to_i - 1
    if (row_index != 1 && row_index != 2 && row_index != 0) || (column_index != 1 && column_index != 2 && column_index != 0)
      puts 'Invalid input!'
      next
    end
    if board[row_index][column_index] == ' '
      break
    elsif board[row_index][column_index] != ' '
      puts 'Position already occupied!'
    end
  end
  [row_index, column_index]
end

def print_player_turn(count)
  if count.odd?
    puts 'X\'s turn'
  else
    puts 'O\'s turn'
  end
end

def check_winner(board, count)
  if check_row(board) || check_column(board) || check_diagonal(board)
    if count.odd?
      puts 'Winner is x'
    else
      puts 'Winner is o'
    end
    return 1
  elsif !check_row(board) && !check_column(board) && !check_diagonal(board) && count.zero?
    puts "It's a draw"
    return 1
  end
  false
end

def check_row(board)
  3.times do |i|
    return 1 if board[i][0] == board[i][1] && board[i][0] == board[i][2] && board[i][0] != ' '
  end
  false
end

def check_column(board)
  3.times do |i|
    return 1 if board[0][i] == board[1][i] && board[0][i] == board[2][i] && board[0][i] != ' '
  end
  false
end

def check_diagonal(board)
  if (board[0][0] == board[1][1] && board[0][0] == board[2][2] && board[0][0] != ' ') || (board[0][2] == board[1][1] && board[0][2] == board[2][0] && board[0][2] != ' ')
    return 1
  end

  false
end

count = 9
board = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
display_board(board)
while count.positive?
  print_player_turn(count)
  player_choice = get_player_choice(board)
  update_board(board, player_choice[0], player_choice[1], count)
  display_board(board)
  count -= 1
  break if check_winner(board, count)

  player_choice = []
end
reset_board(board, count)
