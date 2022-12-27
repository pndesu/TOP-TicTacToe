def displayBoard(board)
    puts row = " #{board[0][0]} " "|" " #{board[0][1]} " "|" " #{board[0][2]} "
    puts seperator = "-----------"
    puts row = " #{board[1][0]} " "|" " #{board[1][1]} " "|" " #{board[1][2]} "
    puts seperator
    puts row = " #{board[2][0]} " "|" " #{board[2][1]} " "|" " #{board[2][2]} "
end

def updateBoard(board, rowIndex, columnIndex, count)
    if count % 2 == 1
        board[rowIndex][columnIndex] = 'x'
    else
        board[rowIndex][columnIndex] = 'o'
    end
end

def resetBoard(board, count)
    board = [[' ',' ',' '],[' ',' ',' '],[' ',' ',' ']]
    count = 9
end

def getPlayerChoice(board)
    rowIndex = columnIndex = 0
    loop do
        print "Enter row number #[1-3]: "
        rowIndex = gets.chomp.to_i - 1
        print "Enter column number #[1-3]: "
        columnIndex = gets.chomp.to_i - 1
        if ((rowIndex != 1 && rowIndex != 2 && rowIndex != 0) || (columnIndex != 1 && columnIndex != 2 && columnIndex != 0))
            puts "Invalid input!"
            next
        end
        if (board[rowIndex][columnIndex]  == ' ')
            break
        elsif (board[rowIndex][columnIndex]  != ' ')
            puts "Position already occupied!"
        end
    end
    return [rowIndex, columnIndex]
end

def printPlayerTurn(count)
    if count % 2 == 1
        puts 'X\'s turn'
    else
        puts 'O\'s turn'
    end
end

def checkWinner(board, count)
    if (checkRow(board) || checkColumn(board) || checkDiagonal(board))
        if count % 2 == 1
            puts "Winner is x"
            return 1
        else
            puts "Winner is o"
            return 1
        end
    elsif (!checkRow(board) && !checkColumn(board) && !checkDiagonal(board) && count == 0)
        puts "It's a draw"
        return 1
    end
    return false
end

def checkRow(board)
    for i in 0..2
        if (board[i][0] == board[i][1] && board[i][0] == board[i][2] && board[i][0] != ' ')
            return 1
        end
    end
    return false
end

def checkColumn(board)
    for i in 0..2
        if (board[0][i] == board[1][i] && board[0][i] == board[2][i] && board[0][i] != ' ')
            return 1
        end
    end
    return false
end

def checkDiagonal(board)
    if ((board[0][0] == board[1][1] && board[0][0] == board[2][2] && board[0][0] != ' ') || (board[0][2] == board[1][1] && board[0][2] == board[2][0] && board[0][2] != ' '))
        return 1
    end
    return false
end

count = 9
board = [[' ',' ',' '],[' ',' ',' '],[' ',' ',' ']]
displayBoard(board)
while count > 0
    printPlayerTurn(count)
    playerChoice = getPlayerChoice(board)
    updateBoard(board, playerChoice[0], playerChoice[1], count)
    displayBoard(board)
    count -= 1
    if checkWinner(board, count)
        break
    end
    playerChoice = []
end
resetBoard(board, count)