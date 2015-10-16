# Challenge 6.5: NESTED DATA
# By Jon Chen and Jeff George
# Oct. 15, 2015
# For DBC Phase 0

# We worked together on this challenge for about 90 minutes.
# I spent another hour tinkering with it and writing my reflection.


# RELEASE 2: NESTED STRUCTURE GOLF
# Hole 1
# Target element: "FORE"

array = [[1,2], ["inner", ["eagle", "par", ["FORE", "hook"]]]]

# attempts:
# ============================================================

# Jeff
p array[1][1][2][0]


# Jon
p array[1][1][2][1]
p array[1][1][2][0]


puts "----------------------------------------------------------------------------"

# Hole 2
# Target element: "congrats!"

hash = {outer: {inner: {"almost" => {3 => "congrats!"}}}}

# attempts:
# ============================================================

# Jeff
p hash[:outer][:inner]["almost"][3]


# Jon
p hash[:outer][:inner]["almost"][3]


puts "----------------------------------------------------------------------------"

# Hole 3
# Target element: "finished"

nested_data = {array: ["array", {hash: "finished"}]}

# attempts:
# ============================================================


# Jeff
p nested_data[:array][1][:hash]



# jon
p nested_data[:array][1][:hash]


puts "============================================================================"

# RELEASE 3: ITERATE OVER NESTED STRUCTURES

number_array =  [
          5,
          [10, 15],
          [20,25,30],
          35
]

puts "If/Else Solution:"
p number_array

p number_array.each_index { |index|
  if number_array[index].is_a? Integer
    number_array[index] += 5
  else
    number_array[index].each_index { |index2|
      number_array[index][index2] += 5
    }
  end
}



puts "----------------------------------------------------------------------------"


# Recursive solution, based on final version of startup_names solution, below:


number_array =  [
          5,
          [10, 15],
          [20,25,30],
          35
]

def number_recurse (array)
  array.each_index { |i|
    (array[i].is_a? Array) ? number_recurse(array[i]) : array[i] += 5
  }
end

puts "Recursive solution:"
p number_array
p number_recurse (number_array)


puts "============================================================================"

# Release 4 (Optional)

# Working with arrays of more than two dimensions has its own unique challenges. Create a startup name generator that adds "ly" to the end of the words in each sub-array. (So if you passed in "Bit" or "Optimize" you would get "Bitly" and "Optimizely."


startup_names = ["bit", ["find", "fast", ["optimize", "scope"]]]

# Initial Solution
# startup_names.each_index { |index|
#
#   if startup_names[index].is_a? String
#     startup_names[index] += "ly"
#   else
#     startup_names[index].each_index { |index2|
#       if startup_names[index][index2].is_a? String
#         startup_names[index][index2] += "ly"
#       else
#         startup_names[index][index2].each_index { |index3|
#           startup_names[index][index2][index3] += "ly"
#         }
#       end
#     }
#   end
# }


# Second solution

puts "If/Else solution:"
p startup_names

p startup_names.each_index { |index|

  if startup_names[index].is_a? Array
    startup_names[index].each_index { |index2|

      if startup_names[index][index2].is_a? Array
        startup_names[index][index2].each_index { |index3|
          startup_names[index][index2][index3] += "ly"
        }

      else
        startup_names[index][index2] += "ly"
      end
    }

  else
    startup_names[index] += "ly"
  end
}

puts "----------------------------------------------------------------------------"


# Recursive - defined as a method so the code can call itself

startup_names = ["bit", ["find", "fast", ["optimize", "scope"]]]

# Original recursive solution, with multi-line if/else syntax

# def startup_recurse (array)
#   array.each_index { |i|
#     if array[i].is_a? Array
#       startup_recurse(array[i])
#     else
#       array[i] += "ly"
#     end
#   }
# end


# One-Line Recursion

def startup_recurse (array)
  array.each_index { |i|
    (array[i].is_a? Array) ? startup_recurse(array[i]) : array[i] += "ly"
  }
end

puts "Recursive solution:"
p startup_names
p startup_recurse(startup_names)


=begin ========================================================================

# Reflection


What are some general rules you can apply to nested arrays?

The most basic means for accessing values held in nested arrays is an extension
of the bracket notation used to access values in a one-dimensional array. We
know that "array[2]" will return the third value in "array" (remember that
array indices count from 0, not from one). If the value at "array[2]" happens
to be _another_ array, we can add another bracketed index number to access the
values within _that_ array. For example, to get to the fourth value in the
array held at "array[2]", we'd refer to "array[2][3]". This bracketed notation
can be extended indefinitely, allowing us to reference values in arrays of
nested to any depth.


# -----------------------------------------------------------------------------

What are some ways you can iterate over nested arrays?

It is possible to iterate over nested arrays using #each or #each_index, with
nested if/else branches to navigate to all levels of the nested array. In this
strategy, it is necessary to repeat the iteration code as one branch at each
nesting level, with the direction to drill down another level as the other
branch. This sort of structure can work in a variety of circumstances, but
it requires that you know in advance how deeply nested your arrays are. In our
initial solution for Release 3, for example, we only needed to build two levels
of iteration within a single if/else structure, because we knew the array was
only two dimensional. The array in Release 4, however, required two if/else
checks, to guide the program through three iterations to cover a three-
dimensional array. While the if/else-nested-iteration structure can work for
relatively simple nested data structures, it's easy to see how it could get
unweildy in a more deeply-nested data structure.


# -----------------------------------------------------------------------------

Did you find any good new methods to implement or did you re-use one you were
already familiar with? What was it and why did you decide that was a good
option?

Our go-to method throughout these iteration exercises was #each_index, which
was already familiar to us. The Ruby feature that we worked with on this one
that was new to us, however, was using recursion to write clear and concise
code capable of iterating over a nested-array structure of unknown (and
potentially infinite) depth. We realized that a recursive solution might be
appropriate to this sort of problem when we saw that we were repeating the
same code at each level of our if/else nested iteration structure. It occurred
to us to write a method (and it has to be a method, not just a block of code)
a single if/else conditional, with one branch holding the code that we actually
wanted executed upon the values in the array, and the other simply calling
the method again, within itself. We wrote the method exactly like that, and to
our happy surprise, it worked as expected on the first attempt.

We then went on to use Ruby's one-line if/else syntax ( if a ? b : c ) to
consolidate the recursive code into a single line of code, which remains
relatively easy to read. After our session ended, I doubled back on my own and
used our recursive solution for Release 4 to add a recursive solution for
Release 3.

=end