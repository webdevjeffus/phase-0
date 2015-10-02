# Count Between

# I worked on this challenge by myself.

# count_between is a method with three arguments:
#   1. An array of integers
#   2. An integer lower bound
#   3. An integer upper bound
#
# It returns the number of integers in the array between the lower and upper bounds,
# including (potentially) those bounds.
#
# If +array+ is empty the method should return 0

# Your Solution Below

def count_between(list_of_integers, lower_bound, upper_bound)

  if list_of_integers == []

    # puts "List is empty"
    return 0

  end

  ints_in_range = 0

  list_of_integers.each { |int|

    if int >= lower_bound && int <= upper_bound

      ints_in_range += 1

    end

  }

  return ints_in_range

end

=begin
puts count_between([1,2,3], 0, 100)      # => 3
puts count_between([-10, 1, 2], 0, 100)  # => 2
puts count_between([10, 20, 30], 10, 30) # => 3
puts count_between([], -100, 100)        # => 0
puts count_between([0], 0, 0)            # => 1
=end