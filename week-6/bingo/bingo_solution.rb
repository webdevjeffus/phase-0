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

    # Switch rows and columns, so columns become sorted by ranges
    @bingo_board = raw_board.transpose

    @bingo_board[2][2] = "XX"  # Cover center free space
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
      col = "O" if @call[0] >= 4
      puts "The call is #{col}-#{@call[1]}."
    end

    print "   B  I  N  G  O\n"
    print  "+----------------+\n"
    @bingo_board.each_index do |i|
      print "|"
      @bingo_board.each_index do |j|
        print " " if @bingo_board[i][j].to_s.length == 1
        print " " + @bingo_board[i][j].to_s
      end
      print " |\n"
    end
    print "+----------------+\n\n"
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
        puts "BINGO!\nYou won in #{@turn} turns!"
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


=begin ========================================================================

# Reflection

# How difficult was pseudocoding this challenge? What do you think of your pseudocoding style?

Basically, I just try to break the problem down into the smallest possible
steps, then explain logically how to accomplish them in an algorithmic way. I
like the style I'm evolving--which borrows from the DBC pseudocoding video as
well as the "pseudocode-to-code" approach Chris Pine demonstrates in "Learn to
Program"--because it converts readily into working code, sometimes on a
line-for-line basis. Some of my reviewers have commented that my pseudocode
reads too much like "real" code, but others have said that it is clear and
readable to them. Personally, I feel that my pseudocode reads like computer
code, hopefully in a language-agnostic way, because I'm trying to think about
the problem in algorithmic terms. I'm fairly confident that my pseudocode
could be coded in Python or Javascript almost as easily as it could in Ruby,
although I'm sure it's developing a Rubyist bias as time goes by and I get
closer and closer to the Ruby way of doing things.


# What are the benefits of using a class for this challenge?

Using a class for this challenge lets the methods share easy access the
important variables necessary to run the game. It also provides an almost
intangible organizational structure to the program that it might not have if
it were made up of global variables and "loose" methods.


# How can you access coordinates in a nested array?

Coordinates in a table stored as a nested array are accessed using bracket
notation: array_name[row_index][column_index]. Thinking in terms of x and y for
a nested-array table is confusing, because the first index actually indicates
the vertical position, or y-coordinate, while the second index indicates the horizontal position, or x-coordinate. Thus, in x-y terms, the bracketed indexes
are [y][x], which feels odd to me. Therefore, I just try to think of them in
terms of [row][col], which is more intuitive to me.


What methods did you use to access and modify the array?

In almost every case in this project, I accessed the coordinates in the nested
array using nested Array#each_index calls, which is really just the Ruby way of
doing FOR loops with a counter that equals the array lengths. Perhaps there's
some killer method for accessing values in a nested-array table, but I didn't
find it.

I did find two new, useful methods when writing and refactoring the BetterBingo#make_board method, though:
* Array#sample(number) returns a new array made up of (number) items randomly
chosen from the receiver array. I used this to pull five values for each column
on the board out of the possible 15 values for that column.
* Array#transpose switches the rows and columns in a two-dimensional array.
This allowed me to set up the values in each column within appropriate ranges
by working with them first as rows. Once the rows were populated with numbers
in the appropriate ranges, I simply called #transpose on the 2-d array to
convert the rows into columns, and vice versa! (I had originally written
another nested #each_index block which reversed the indexes of each array
element, which was about 5 or 6 lines long; #transpose let me replace that
code with a single method-call.)


How did you determine what should be an instance variable versus a local
variable?

There were four variables I needed to be able to access from any point in the
program: call, calls, turn, and bingo_board. The best way to make that
possible was to designate all four of them as instance variables when
initializing the game object. There are several other variables used in many
methods in the program, but none of them were needed beyond the run of a single
method call, nor was their value ever passed to another method, so they were
handled as variables local to each method.


What do you feel is most improved in your refactored solution?

When I set out to write the refactored solution, I wanted to make a version of
bingo that would randomly generate a legal board, play a whole game without
ever calling the same space twice, and know when the game had been won with an
actual, five-in-a-row bingo. The final, refactored version above will do all
of those things. To be 100% sure you win, set the #play_turns call in the
driver code to 75--there are only 75 possible values on a legal bingo board,
and a game with 75 turns will eventually call every single one of them. In
practice, most games are won with 45-55 turns of play, although I've seen
games won in 12 calls, or last until well into the 60s.

The reason that live bingo games run by ladies' auxiliary at the church don't
go 50 turns every time is that _someone_ in the room always has the lucky card
that wins 20 or 30 turns--just not you. With no competition, you _will_ win...
eventually. An obvious next step would be to have the game make bingo cards for
several rival players, and give them an equal chance to win the game with a
bingo.

I'd work on this if computer bingo were actually any fun, but it turns out
that it's not. The only element of skill "real" bingo is being alert enough
not to miss your numbers when they're called; apart from that, it's all luck.
We've written this game so that the computer covers your numbers for you automatically, and never misses a one, so the game is as much fun as a slot
machine that pays nothing even when you hit the jackpot. If I'm going to put
more than one day's work into a computer game, I'd like it to be one that's
actually fun to play!


=end