# Add it up!

# Complete each step below according to the challenge directions and
# include it in this file. Also make sure everything that isn't code
# is commented in the file.

# I worked on this challenge with Marie-France Han.

# 0. total Pseudocode
# make sure all pseudocode is commented out!

# Input: array of numbers
# Output: total of all numbers in array
# Steps to solve the problem.


#  VARIABLE total = 0
#
#  FOR EACH number in array
#
#    SET total = total plus number
#
#  END
#
#  RETURN total



# 1. total initial solution

# def total( nums )
#
#   total = 0
#
#   nums.each { |num|
#
#     total += num
#
#   }
#
#   return total
#
# end



# 3. total refactored solution

def total( nums )

  nums.reduce(:+)

end



# 4. sentence_maker pseudocode
# make sure all pseudocode is commented out!
# Input: array of words
# Output: sentence as a string, first letter capitalized, period at the end
# Steps to solve the problem.

#  CAPITALIZE first word
#
#  VARIABLE sentence SET to empty string
#
#  FOR EACH word in words
#
#    ADD space to end of sentence
#
#    ADD word to end of sentence
#
#  END FOR EACH
#
#  ADD period to end of sentence
#
#  STRIP leading space from sentence
#
#  RETURN sentence



# 5. sentence_maker initial solution

# def sentence_maker( words )
#
#   words[0].capitalize!
#
#   sentence = ""
#
#   words.each { |word|
#
#     sentence = sentence + " " + word.to_s
#   }
#
#   sentence = sentence + "."
#
#   return sentence.lstrip
#
# end



# 6. sentence_maker refactored solution

def sentence_maker( words )

  words[0].capitalize!

  sentence = words.join(" ") + "."

end

