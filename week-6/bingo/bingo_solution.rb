# A Nested Array to Model a Bingo Board SOLO CHALLENGE

# I spent [#] hours on this challenge.

# Release 0: Pseudocode





=begin

if 0, call[0] = B
if 1, call[0] = I
if 2, call[0] = N
if 3, call[0] = G
if 4, call[0] = O



# Outline:

# Create a method to generate a letter ( b, i, n, g, o) and a number (1-100)

  DECLARE variable "call" = empty array
    call[0] = a random number between 0 and 4, inclusive
    call[1] = a random number between 1 and 100, inclusive

  RETURN call array

  (Note: Storing the first element of the call as a string forces us to keep
  switching it back to an integer every time we need to work with the board, which
  is a 2D array accessed by integer indices; it is more efficient to generate and
  store the first element of the call as an integer, and convert it to a string
  only when printing a board position to the screen.)


# Check the called column for the number called.

  FOR EACH row, check the number in the call[0] column
    IF board[row][ call[0] ] equals call[1], RETURN TRUE
    ELSE RETURN FALSE


# If the number is in the column, replace with an 'x'


# Display a column to the console
  #fill in the outline here

# Display the board to the console (prettily)
  #fill in the outline here

=end

# Initial Solution

class BingoBoard

  def initialize(board)
    @bingo_board = board
  end


end

# Refactored Solution



#DRIVER CODE (I.E. METHOD CALLS) GO BELOW THIS LINE
board = [[47, 44, 71, 8, 88],
        [22, 69, 75, 65, 73],
        [83, 85, 97, 89, 57],
        [25, 31, 96, 68, 51],
        [75, 70, 54, 80, 83]]

new_game = BingoBoard.new(board)


#Reflection

