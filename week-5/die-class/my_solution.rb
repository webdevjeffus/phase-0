# Die Class 1: Numeric

# I worked on this challenge by myself.

# I spent 4 hours on this challenge, including reading and research.


# NOTE: There is an easy-to-read version of this file in markdown format at:
# https://github.com/webdevjeffus/phase-0/blob/master/week-5/die-class/die_refl.md


# 0. Pseudocode

# Input: A class to create a die with a specified number of sides
# Output: A Die class that can report the maximum number it can roll (that is, how many sides it has), and the result of a single roll of that die. The initialization method must raise an exception (error) if asked to create a die with 0 or fewer sides.

# Steps:

# def Die(num_sides)
#
#   def INITIALIZE a new die object
#     IF num_sides < 1
#       RAISE argument error
#     SET number of sides = num_sides
#   end
#
#   def SIDES
#     RETURN num_sides
#   end
#
#   def ROLL
#     RETURN random number in range 1 to num_sides
#   end
#
# end


# 1. Initial Solution

class Die

  def initialize(sides)
    if sides < 1
      raise ArgumentError, "You asked for a die with #{sides} sides. The number of sides on a die must be a positive integer."
    end
    @sides = sides
  end

  def sides
    @sides
  end

  def roll
    rand(@sides) + 1
  end

end



# 3. Refactored Solution

# The code in this class definition is so simple, there really isn't any refactoring to do.



# 4. Reflection
# NOTE: There is an easy-to-read version of this file in markdown format at:
# https://github.com/webdevjeffus/phase-0/blob/master/week-5/die-class/die_refl.md

# What is an ArgumentError and why would you use one?

# An **ArgumentError** is caused when the arguments passed to a method do not match the parameters included in the method's definition. **ArgumentError**s are commonly raised when a method is passed too many or too few arguments, but it is possible to use the **raise** method to raise an **ArgumentError** to interrupt or abort the program flow for other problems with arguments. In our **Die#initialize** method, we raised an **ArgumentError** if **Die.new** were called with a "sides" argument with a value less than 1.


# What new Ruby methods did you implement? What challenges and # successes did you have in implementing them?

# The two new methods (to me, at least) in this challenge were **rand** and **raise**. **rand** worked exactly as I expected, based on the Ruby docs, so I had no trouble using it. **raise** also seemed to function as I expected it to, based on my reading in the _Rubyist_, but when I tried to raise an error not just for values for **sides** that were less than 0, but also for non-integer values, my code no longer passed all the RSpec tests. In order to make it work, I had to take the **is_a? Integer** check.


# What is a Ruby class?

# A _class_ is a group of similar objects that share certain characteristics (variables) and behaviors (methods). Every object beloning to a given class is said to be an _instance_ of that class. For example, every instance of the class **Pizza** will have an _instance variable_ that defines its size, which is written as **@size**. Not all pizzas are the same size, though, so each pizza has its own value for @size, independent of the sizes of other pizzas...but every instance of the pizza class must have some value for @size.

# Similarly, if a method is created in the definition for a class, all instances of that class will be able to utilize that method. If our Pizza class has a method, **Pizza#burn_roof_of_mouth**, all pizzas will be able to use that method. So when you take a bite from any given pizza, that method is called (using something like**my_pizza.burn_roof_of_mouth**) to see if it does actually burn the roof of your mouth. The code inside **#burn_roof_of_mouth** might check a boolean variable named **too_hot_to_eat?**; if **too_hot_to_eat?** returns **true**, the pizza burns your mouth. Ouch!


# Why would you use a Ruby class?

# Ruby classes have a tremendous positive impact on both the logic and the conciseness of a program. Classes improve the logic by assuring that similar items all behave in the same way, and make programs more concise (and therefore maintainable) by eliminating huge quantities redundant code. Classes are a key weapon in the DRYness arsenal.


# What is the difference between a local variable and an instance # variable?




# Where can an instance variable be used?
