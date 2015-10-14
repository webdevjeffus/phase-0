# Die Class 2: Arbitrary Symbols
# Challenge 6.2
# by Jeff George, 10/13/15
# for DBC Phase 0


# I worked on this challenge by myself.
# I spent 1 hour on this challenge.

# Pseudocode ==================================================================

# Input: An array of strings
# Output: A die object that returns a randomly-chosen string from the array
#         when rolled

# Steps:

# INITIALIZE
#   CREATE a die object one instance variable: an array of labels (strings)
#
# SIDES
#   RETURN an integer equal to the number of possible labels in the array
#
# ROLL
#   RETURN a randomly-chosen response string from the array of labels


# Initial Solution ============================================================

class Die
  def initialize(labels)
    @labels = labels
    raise ArgumentError, "You must enter an array of strings." if labels == []
  end

  def sides
    @labels.length
  end

  def roll
    @labels[ rand(@labels.length) ]
  end
end







# Refactored Solution =========================================================

# Added #to_a to in def of #initialize, to let the class take a range of
# numbers as a "labels" argument, so that this class can still create a
# traditional die with numbers.

class Die
  def initialize(labels)
    @labels = labels.to_a
    raise ArgumentError, "You must enter an array of strings." if labels == []
  end

  def sides
    @labels.length
  end

  def roll
    @labels[ rand(@labels.length) ]
  end
end


# Driver code (Tests) ---------------------------------------------------------

# Test with strings:
peanuts = ["Charlie Brown", "Snoopy", "Linus", "Lucy", "Sally",
            "Schroeder", "Pig-pen", "Violet", "Frieda", "Peppermint Patty",
            "Marcy", "Woodstock", "Spike"]

peanuts_die = Die.new (peanuts)

p peanuts_die.sides
p peanuts_die.roll
p peanuts_die.roll
p peanuts_die.roll
p peanuts_die.roll
p peanuts_die.roll


# Test with numbers (entered as a range object):
d8 = Die.new (1..8)

p d8.sides
p d8.roll
p d8.roll
p d8.roll
p d8.roll
p d8.roll
p d8.roll
p d8.roll
p d8.roll

=begin
# Reflection ==================================================================

# What were the main differences between this die class and the last one you
created in terms of implementation? Did you need to change much logic to get
this to work?

There's really almost no difference between this one and last week's die, aside
from replacing the @sides variable, an intenger, with @labels, an array of
strings. I did have to change the Die#sides method to return the length of the
@labels array, instead of the integer value of @sides. I also had to change
chang e the Die#roll method to return a randomly-chosen string from the
@labels array, but these were trivial changes, really.


# What does this exercise teach you about making code that is easily
changeable or modifiable?

The original Die class, from last week, was pretty specific and limited. The
Die class created this week serves a different purpose--choosing a random
label string from an array of strings. It occured to me at first that you
could still make this die roll numbers, if you entered an array of numbers
instead of an array of strings. Taking that one step further, I realized that
instead of creating and entering an array of numbers, I could make the Die
class handle a range of numbers as an input by adding the #to_a method when
setting the instance variable @labels. While it might be slightly less
memory-effecient to store an entire array of numbers as die-sides instead of
saving a single maximum value as a @sides variable, doing so makes the single
Die class more versatile. Unless you are creating, storing and re-using
literally hundreds of die objects in your program, the extra space to store
[1,2,3,4,5,6] instead of just the number six will never affect performance in
any meaningful way.

As an afterthought, it also occurs to me that by storing the possible return
values on the sides of a numeric die as an array instead of as a single
maximum value, it becomes possible to make dice that are not entirely fair.
For example, you could make a bell_curve_die that skews results toward the
middle of its range by feeding it a label array like
[1, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 6].


# What new methods did you learn when working on this challenge, if any?

I don't think I used any methods in this challenge that I hadn't used in one
challenge or another last week.


# What concepts about classes were you able to solidify in this challenge?

This challenge reinforced the flexibility of a well-designed class in my mind.
As you can see in my test examples, I used the same method to create a die
that returns randomly chosen strings (Peanuts characters, in this case) and
another die that functions as a simple 8-sided die.


=end