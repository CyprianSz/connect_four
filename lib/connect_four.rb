require_relative "player"
require_relative "board"

class ConnectFour
  def initialize
    @board = Board.new
    @row
    take_names
    lets_play
  end

  def take_names
    puts "\nWelcome to Connect Four."
    sleep 2
    puts "\nGive first player name: "
    @first_name = gets.chomp
    @player1 = Player.new(@first_name, "\u26AA")
    puts "\nHello #{@first_name} ! Your sign is: \"\u26AA \""
    sleep 2

    puts "\nGive second player name: "
    @second_name = gets.chomp
    @player2 = Player.new(@second_name, "\u26AB")
    puts "\nHello #{@second_name} ! Your sign is: \"\u26AB \""
    sleep 2
  end

  def lets_play
    loop do
      @board.view_board
      take_column(@player1.name)

      put_the_coin(@column, @player1.symbol, @player1.name)

      break if win_or_draw

      @board.view_board
      take_column(@player2.name)

      put_the_coin(@column, @player2.symbol, @player2.name)

      break if win_or_draw
    end
  end  

  def win_or_draw 
    @column = letter_to_number(@column)

    @horizontal = ""
    @vertical = ""
    @diagonal1 = ""
    @diagonal2 = ""

    3.downto(-3) do |x| 
      if @column + x <= 6 && @column + x >= 0
        @horizontal += @board.board[@row][@column + x]
      end

      if @row + x <= 5 && @row + x >= 0
        @vertical += @board.board[@row + x][@column]
      end

      if @column + x <= 6 && @column + x >= 0 && @row + x <= 5 && @row + x >= 0
        @diagonal1 += @board.board[@row + x][@column + x]
      end

      if @column + x <= 6 && @column + x >= 0 && @row - x <= 5 && @row - x >= 0
        @diagonal2 += @board.board[@row - x][@column + x]
      end
    end

    condition1 = @horizontal.include?(" #{@player1.symbol} " * 4) || @horizontal.include?(" #{@player2.symbol} " * 4)
    condition2 = @vertical.include?(" #{@player1.symbol} " * 4) || @vertical.include?(" #{@player2.symbol} " * 4)
    condition3 = @diagonal1.include?(" #{@player1.symbol} " * 4) || @diagonal1.include?(" #{@player2.symbol} " * 4)
    condition4 = @diagonal2.include?(" #{@player1.symbol} " * 4) || @diagonal2.include?(" #{@player2.symbol} " * 4)

    if condition1 || condition2 || condition3 || condition4
      puts @board.view_board
      puts "\nYou win the game."
      puts "Thanks for playing.\n"
      return true
    elsif @board.board.all? { |x| x.none? { |y| y == "   " } }
      @board.view_board
      puts "\nHere we have a draw."
      puts "Thanks for playing.\n"
      return true
    end
  end  

  def letter_to_number(letter)
    case letter
    when "a" then 0
    when "b" then 1
    when "c" then 2
    when "d" then 3
    when "e" then 4
    when "f" then 5
    when "g" then 6
    end
  end

  def put_the_coin(column, symbol, name)
    j = letter_to_number(column)

    if @board.board[0][j] != "   "
        puts "This column is full ! Choose different one."
        take_column(name)
        put_the_coin(@column, symbol, name)
    else 
      5.downto(0) do |i| 
        if @board.board[i][j] == "   "
          @board.board[i][j] = " #{symbol} "
          @row = i
          break
        end
      end
    end
  end

  def take_column(name)
    puts "\n#{name} - it's your turn. Which column put your coin ?"
    @column = gets.chomp.downcase

    until @column.match /^[a-g]$/
      puts 'Wrong input! Put letter from A to G.'
      take_column(name)
    end
  end

end

ConnectFour.new