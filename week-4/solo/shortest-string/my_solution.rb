# Shortest String

# I worked on this challenge by myself.

# shortest_string is a method that takes an array of strings as its input
# and returns the shortest string
#
# +list_of_words+ is an array of strings
# shortest_string(array) should return the shortest string in the +list_of_words+
#
# If +list_of_words+ is empty the method should return nil

#Your Solution Below
def shortest_string(list_of_words)

  if list_of_words == [] then return nil

  else

    shortest_word = list_of_words[0]

    list_of_words.each { |word|

      if word.length < shortest_word.length

        shortest_word = word

      end

    }

    return shortest_word

  end

end

puts shortest_string( ["banana", "apple pie", "George Washington", "foop"] )