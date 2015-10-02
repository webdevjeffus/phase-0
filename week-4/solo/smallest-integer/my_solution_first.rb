# Smallest Integer - First working version

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

  if list_of_nums == []

    return nil

  else

    smallest_num = list_of_nums[0]
    this_num = 0
    # puts "First num: " + list_of_nums[this_num].to_s

    while this_num < list_of_nums.length - 1

      if list_of_nums[this_num + 1] < smallest_num then
        smallest_num = list_of_nums[this_num + 1]
      end

      this_num += 1

      # puts "Index: " + this_num.to_s +
      #    "; Value: " + list_of_nums[this_num].to_s +
      #    "; Smallest Int so far: " + smallest_num.to_s


    end

    return smallest_num

  end

end

# puts smallest_integer( [3, 54, 12, 1, 17, 200] )