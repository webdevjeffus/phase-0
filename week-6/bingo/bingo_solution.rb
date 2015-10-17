# A Nested Array to Model a Bingo Board SOLO CHALLENGE
# by Jeff George on 10/16 & 10/17/15

# I spent 10 hours on this challenge.

# Release 0: Pseudocode
=begin

# Outline:

# Create a method to generate a letter (B, I, N, G, O) and a number (1-100)

  DECLARE variable "call" = empty array
    call[0] = a random number between 0 and 4, inclusive
    call[1] = a random number between 1 and 100, inclusive

  RETURN call array

  (Note: Storing the first element of the call as a letter (string) forces us
  to keep switching it back to an integer every time we need to work with the
  board, which is a 2D array accessed by integer indices; it is more efficient
  to generate and store the first element of the call as an integer, and
  convert it to a string only when printing a bingo call to the screen.)


# Check the called column for the number called.

  FOR EACH row, check the number in the call[0] column
    IF board[row][ call[0] ] equals call[1],
      replace number with an 'x'


# Display the board to the console (prettily)
  PRINT the column and row called for the turn
  PRINT a row of column headers, B I N G O
  PRINT each row of the board

=end

# Initial Solution - Meets requirements of Release 3

class BingoBoard

  def initialize(board)
    @bingo_board = board
    @call = [0,0]
  end


  def call
    @call[0] = rand(5)
    @call[1] = rand(100) + 1
  end


  def check
    self.call
    @bingo_board.each_index { |i|
      @bingo_board[i][@call[0]] = "XX" if @bingo_board[i][@call[0]] == @call[1]
    }
    display_board
  end


  def display_board
    col = "B" if @call[0] == 0
    col = "I" if @call[0] == 1
    col = "N" if @call[0] == 2
    col = "G" if @call[0] == 3
    col = "O" if @call[0] == 4
    puts "The call is #{col}-#{@call[1]}."

    print "__B__I__N__G__O_\n"
    @bingo_board.each_index { |i|
      @bingo_board.each_index { |j|
        if @bingo_board[i][j] == "XX" || @bingo_board[i][j] >= 10
          print " " + @bingo_board[i][j].to_s
        else
          print "  " + @bingo_board[i][j].to_s
        end
      }
      print "\n"
    }
    print "\n"
  end


  def play_turns(num)
    num.times {
      self.check
    }
  end

end

#DRIVER CODE for Initial Solution (Release 3)

# board = [[1, 2, 3, 4, 5],
        # [6, 7, 8, 9, 10],
        # [11, 12, 13, 14, 15],
        # [16, 17, 18, 19, 20],
        # [21, 22, 23, 24, 25]]

board = [[47, 44, 71, 8, 88],
        [22, 69, 75, 65, 73],
        [83, 85, 97, 89, 57],
        [25, 31, 96, 68, 51],
        [75, 70, 54, 80, 83]]

new_game = BingoBoard.new(board)

# p new_game.play_turns(100)

#==============================================================================

# Refactored Solution - A Better Bingo Game


=begin Pseudocode for changes from/additions to Initial Solution

NOTE: For this refactor, I pseudocoded each new or changed method as I
discovered that it needed work. The pseudocode below shows the methods in
the order that I created or altered them:

MAKE BOARD
  CREATE a 2-d array with five empty arrays as elements
  POPULATE each row of the board with 15 random numbers in the appropriate range:
    FOR EACH row
      SHUFFLE numbers from 1-15 in an array
      ADD (row number * 15) to each value, to put them in right range for
            each BINGO column ( B=1-15, I=16-30, N=31-45, G=46-60, O=61-75)
  FLIP columns and rows, so that bingo-range-sorted rows become the columns:
    FOR EACH item in each row (nested iteration!)
      Switch the row and column indices (change [x][y] to [y][x])
  SET the center space to covered (Free Space)

DISPLAY BOARD didn't need any modification from Initial version

INITIALIZE
  INITIALIZE variables:
    @call as an array of two integers
    @calls as an array of 75 numbers in random order;
      (There are 75 possible calls in a bingo game; each can appear only once
        on a board, and only in a specific column based on ranges of 15 numbers)
    @turn as turn counter; starts at 0
    @bingo_board as a 2-d array created by a call to MAKE BOARD

CALL  (Needed to be changed to use @calls array, to avoid calling same number
        more than once in a single game.)
  SET @call[1] (the number) to value popped off end of @calls array
  SET @call[0] (the letter) to @call[1] divided by 15

TAKE TURN  (Called "check" in Initial solution)
  Make a CALL
  If CALL value is on board, "cover" it with "XX"
    (This code is unchanged from previous version)
  Increment TURN value
  DISPLAY_BOARD

WIN_GAME?
  Check all rows for 5 covered spaces in a row
    FOR EACH space in each row (nested interation, checking [i][j])
      SET x_counter to 0
      IF space is a string, increment x-counter variable
      RETURN TRUE if x_counter == 5

  Check all columns for 5 covered spaces in column
    FOR EACH space in each column (nested interation, checking [j][i])
      SET x_counter to 0
      IF space is a string, increment x-counter variable
      RETURN TRUE if x_counter == 5

  Check top-lft to btm-rt diagonal for 5 covered spaces
    FOR EACH space in diagonal (single-level iteration, checking [i][i])
      SET x_counter to 0
      IF space is a string, increment x-counter variable
      RETURN TRUE if x_counter == 5

  Check btm-lft to top-rt diagonal for 5 covered spaces
    FOR EACH space in diagonal (single-level iteration, checking [i][4-i])
      SET x_counter to 0
      IF space is a string, increment x-counter variable
      RETURN TRUE if x_counter == 5

  RETURN false  (Flow falls through to this if none of the win-conditions
                  is true.)

PLAY TURNS - takes an INTEGER as argument
  A number of times equal to the INTEGER...
    TAKE TURN
    CHECK WIN_GAME?
      IF WIN_GAME is true
        PRINT winning game message, including number of turns
        BREAK loop to end game

=end # Pseudocode


class BetterBingo

  def initialize
    @call = [-1,-1]
    @calls = (1..75).to_a.shuffle
    @turn = 0
    @bingo_board = self.make_board
  end


  def make_board
    # Create board with rows with proper ranges for B, I, N, G, and O
    raw_board = [ [], [], [], [], [] ]
    raw_board.each_index do |i|
      raw_board[i] = (1..15).to_a.sample(5)
      raw_board[i].each_index { |j| raw_board[i][j] += (i * 15) }
    end

    # Flip board on diagonal so that rows become columns
    flipped_board = [ [], [], [], [], [] ]
    raw_board.each_index do |i|
      raw_board.each_index do |j|
        flipped_board[i][j] = raw_board[j][i]
      end
    end

    flipped_board[2][2] = "XX"  # Cover center free space
    @bingo_board = flipped_board
    self.display_board
    return @bingo_board
  end


  def call
    called_num = @calls.pop
    @call = [ called_num / 15, called_num ]
  end


  def display_board
    if @call[0] >= 0
      col = "B" if @call[0] == 0
      col = "I" if @call[0] == 1
      col = "N" if @call[0] == 2
      col = "G" if @call[0] == 3
      col = "O" if @call[0] == 4
      puts "The call is #{col}-#{@call[1]}."
    end

    print "__B__I__N__G__O_\n"
    @bingo_board.each_index do |i|
      @bingo_board.each_index do |j|
        print " " if @bingo_board[i][j].to_s.length == 1
        print " " + @bingo_board[i][j].to_s
      end
      print "\n"
    end
    print "\n"
  end


  def win_game?
    # Check rows for win
    @bingo_board.each_index do |row|
      x_count = 0
      @bingo_board[row].each_index do |col|
        x_count += 1 if @bingo_board[row][col].is_a? String
      end
      return true if x_count == 5
    end

    # Check columns for win
    @bingo_board.each_index do |col|
      x_count = 0
      @bingo_board[col].each_index do |row|
        x_count += 1 if @bingo_board[row][col].is_a? String
      end
      return true if x_count == 5
    end

    # Check top-left to bottom-right diagonal for win
    x_count = 0
    @bingo_board.each_index do |i|
      x_count += 1 if @bingo_board[i][i].is_a? String
      return true if x_count == 5
    end

    # Check bottom-left to top-right diagonal for win
    x_count = 0
    @bingo_board.each_index do |i|
      x_count += 1 if @bingo_board[i][4-i].is_a? String
      return true if x_count == 5
    end

    # No win
    return false
  end


  def take_turn
    self.call
    @bingo_board.each_index do |i|
      @bingo_board[i][@call[0]] = "XX" if @bingo_board[i][@call[0]] == @call[1]
    end
    @turn += 1
    self.display_board
  end


  def play_turns(num)
    num.times do
      self.take_turn
      if self.win_game?
        puts "BINGO!"
        puts "You won in #{@turn} turns!"
        break
      end
    end
  end

end


#DRIVER CODE (I.E. METHOD CALLS) GO BELOW THIS LINE

new_game = BetterBingo.new

# No bingo game can last more than 75 turns, since there are only 75 possible
# values on a bingo board; thus, 75 calls will fill any board.
new_game.play_turns(75)


#Reflection

