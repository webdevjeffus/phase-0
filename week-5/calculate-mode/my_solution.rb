# Calculate the mode Pairing Challenge

# I worked on this challenge [by myself, with: ]

# I spent [] hours on this challenge.

# Complete each step below according to the challenge directions and
# include it in this file. Also make sure everything that isn't code
# is commented.



# 0. Pseudocode

# What is the input?
# What is the output? (i.e. What should the code return?)
# What are the steps needed to solve the problem?


# 1. Initial Solution

def mode(array)

  out_array = []
  mode_hash = Hash.new(0)

  array.each do | item |
    mode_hash[item] += 1
  end

  highest = 0
  mode_hash.each do |key, value|
    if value >= highest
      highest = value
    end
  end

  mode_hash.each do |key, value|
    if value == highest
      out_array << key
    end
  end

  return out_array

end

def mode(array)

  out_array = []
  mode_hash = Hash.new(0)

  array.each do | item |
    mode_hash[item] += 1
  end

#  highest = 0
#  mode_hash.each do |key, value|
#    if value >= highest
#      highest = value
#    end
#  end

  out_array = mode_hash.max_by {|key, value| value}

#  mode_hash.each do |key, value|
#    if value == highest
#      out_array << key
#    end
#  end

  return out_array

end


# 3. Refactored Solution




# 4. Reflection