# Build a simple guessing game
# Challenge 6.3
# by Jeff George, 10/13/15
# for DBC Phase 0


# I worked on this challenge by myself.
# I spent [#] hours on this challenge.

# Pseudocode ==================================================================

# Input: Create a guessing game object with the correct answer, an integer, as
#        as its only argument.

# Output: The user should be able to make enter guesses from the command line,
#         receive feedback as to whether his guess was too high, too low, or
#         correct, and ask if the game has been solved.

# Steps: The guessing game object must be able to do the following things:

# INITIALIZE a new game
#    * Accept an integer as an argument, which will be the correct answer.
#    * Save that answer.
#    * Prepare a variable to accept the players' guesses.

# ACCEPT a guess
#    * Set the guess variable to equal the player's latest guess.
#    * Report whether the guess is too high, too low, or correct.

# CHECK if the game has been solved
#    * Return whether the player's last guess is equal to the answer (true)
#      or not equal to the answer (false)


# Initial Solution ============================================================

class GuessingGame

  def initialize(answer)
    raise ArgumentError, "Please enter an integer." unless answer.is_a? Integer
    @answer = answer
    @guess = nil
  end

  def guess(guess)
    @guess = guess
    if @guess > @answer
      return :high
    elsif @guess < @answer
      return :low
    else
      return :correct
    end
  end

  def solved?
    return true if @guess == @answer
    return false
  end

end



# Refactored Solution =========================================================
# Syntax for conditionals has been streamlined, but logic is unchanged.

class GuessingGame

  def initialize(answer)
    raise ArgumentError, "Please enter an integer." unless answer.is_a? Integer
    @answer = answer
    @guess = nil
  end

  def guess(guess)
    @guess = guess
    return :high if @guess > @answer
    return :low if @guess < @answer
    return :correct
  end

  def solved?
    @guess == @answer
  end

end


# Game Runner Code ============================================================

game = GuessingGame.new rand(100)
last_guess  = nil
last_result = nil

until game.solved?
  unless last_guess.nil?
    puts "Oops!  Your last guess (#{last_guess}) was #{last_result}."
    puts ""
  end

  print "Enter your guess: "
  last_guess  = gets.chomp.to_i
  last_result = game.guess(last_guess)
end

puts "#{last_guess} was correct!"

=begin

# Reflection ==================================================================

How do instance variables and methods represent the characteristics and
behaviors (actions) of a real-world object?

Instance variables allow an object to know and remember information about
itself, which can affect its behavior. Methods (class methods, in this case)
allow the object to interact with the rest of the program and/or the user.
Because methods represent the actions an object can take, or ways in which it
can behave, they will often check, manipulate, or report the object's instance
variables.


When should you use instance variables? What do they do for you?

Obviously, you use instance variables within an instance of a class, most
likely setting them up as part of the class's #initialize method. The reason
for using instance variables is so that your object will be able to remember
its state from one time that you interact with it to the next, so it's not
starting fresh every time you touch it.


Explain how to use flow control. Did you have any trouble using it in this
challenge? If so, what did you struggle with?

This challenge is all about flow control using conditionals (ifs and if/elses).
The #guess and #solved? methods compare the player's guess to the correct
answer using conditional statements, and return their results. The instructions
for the challenge were clear, and structuring the conditionals to provide the
correct results was not difficult. In my initial solution, I used "long-form"
if/elsif/else statements, but in my refactored solution, I changed them to a
more concise, one-line format.


Why do you think this code requires you to return symbols? What are the benefits
of using symbols?

As I understand them, symbols are different from strings in two key ways:
First, since every appearance of the same symbol in a program points to the same
symbol object, while every appearance of identical strings points to different
objects, using symbols in place of strings results in a (usually negligible)
improvement in memory usage and performance speed. Second, symbols are
immutable--that is, once the program is running, they can't be changed, whereas
the value of strings can be manipulated during runtime.

I'm pretty sure the



=end