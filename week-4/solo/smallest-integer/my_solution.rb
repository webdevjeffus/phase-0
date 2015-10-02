# Smallest Integer - Refactored version

# I worked on this challenge by myself.

# smallest_integer is a method that takes an array of integers as its input
# and returns the smallest integer in the array
#
# +list_of_nums+ is an array of integers
# smallest_integer(list_of_nums) should return the smallest integer in +list_of_nums+
#
# If +list_of_nums+ is empty the method should return nil

# Your Solution Below
def smallest_integer(list_of_nums)

  if list_of_nums == [] then return nil

  else

    smallest_num = list_of_nums[0]
    index = 1
    # puts "First num: " + smallest_num.to_s

    while index < list_of_nums.length

      if list_of_nums[index] < smallest_num then
        smallest_num = list_of_nums[index]
      end

      # puts "Index: " + index.to_s +
      #    "; Value: " + list_of_nums[index].to_s +
      #    "; Smallest Int so far: " + smallest_num.to_s

      index += 1

    end

    return smallest_num

  end

end

# puts smallest_integer( [35, 54, 12, 103, 17, 200] )