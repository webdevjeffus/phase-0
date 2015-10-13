# Research Methods
# Accountability Group 11

# We spent MANY hours on this challenge.

i_want_pets = ["I", "want", 3, "pets", "but", "only", "have", 2]
my_family_pets_ages = {"Evi" => 6, "Ditto" => 3, "Hoobie" => 3, "George" => 12, "Bogart" => 4, "Poly" => 4, "Annabelle" => 0}



# Person 1 - Eric Freeburg =============================================

def my_array_finding_method(source, thing_to_find)
  i = 0
  t = 0
  output_array = []

  while i < source.length
    if source[i].to_s.include?(thing_to_find)
      output_array[t] = source[i].to_s
      t += 1
    end
    i +=1
  end

  return output_array
end


# One-line solution using Array#select, added after deadline
def my_array_finding_method(source, thing_to_find)
  source.select{|i| i.to_s.include?(thing_to_find)}
end


my_array_finding_method(i_want_pets, "t") # to test

=begin
my_array_finding_method:
Define the method along parameters (SOURCE, THING_TO_FIND)
Instantiate the variables we will use
i = 0 (to be used in our while loop)
t = 0 (to be used in our if statment)
output_array = [] (to be used for our return value(s))
while i < source.length (to begin working through our source array)
  IF source[i]
    .to_s                      (converts to string)
    .include?(thing_to_find)   (looks for thing_to_find)
    THEN output_array[t] gets assigned the source[i].to_s
    and t is incremented by 1
  END
  increment i by 1
END
Return the output_array
=end

def my_hash_finding_method(source, thing_to_find)
  output_array = []
  i = 0
  source.each { |key,value|
    if value == thing_to_find
      output_array[i] = key
      i += 1
    end
  }
  return output_array
end

my_hash_finding_method(my_family_pets_ages, 12) # to test

=begin
my_hash_finding_method:
Define the method along parameters (SOURCE, THING_TO_FIND)
Instantiate the variables we will use
output_array = []
i = 0
Iterate through the source hash along key,value
  IF value is same as thing_to_find
    set the output array equal to the key
    increment i by 1
  END
END
Return the output_array
=end

=begin
RELEASE 2
Identify and describe the Ruby method you implemented
SEE ABOVE
Teach your accountability group how to use the methods
SEE ABOVE
Share any tricks you used to find and decipher the Ruby Docs
SEE ABOVE
=end




# Person 2 - Max Iniguez ======================================================

def my_array_modification_method!(source, thing_to_modify)
  x = 0
  while x < source.length
    x += 1
    if source[x].is_a? Integer
      source[x] += thing_to_modify
    end
  end
  source
end

# def my_hash_modification_method!(source, num)
#   source.replace(source.to_a.each{ |i| i[1] += num}.to_h)
# end

# Refactor:
def my_hash_modification_method!(source, num)
  source.each { |key, val| source[key] += num }
end

# Identify and describe the Ruby method(s) you implemented.
# For my array method, I honestly couldn't think of a better way to do
# it than with a while loop. I tried .each every way I could think, but in
# the end, just like with the .each_value for my hash method, it didn't
# actually collect the values. I did however discover the Object#is_a?
# method which helped crack the first part of the problem. Once the program
# could identify which elements of my array were integers, it was fairly
# easy to iterate over the array for any integers in it. The methods
# I used in the hash method (at least in my initial solution) were
# Hash#replace, Hash#to_a, and Array#to_h. This helped me create an array
# of the values from my hash, add a number to each, then feed it back
# into a hash, which overwrote the original hash using Hash#replace (thus
# remaining destructive). The refactor, with help from Steven, was actually
# much simpler, and didn't require anything more than the Hash#each
# method. Overall, not many actual new methods were required after refactoring.




# Person 3 - Jeff George ======================================================

# Array sort initial solution:
def my_array_sorting_method(source)
  source = source.partition{ |item| item.is_a? Fixnum }
  source[0] = source[0].sort
  source[1] = source[1].sort
  source.flatten
end

# Array sort refactored solution:
def my_array_sorting_method(source)
  source.sort_by{ |x| x.to_s }
end

# Destructive version of array sort
# (NOT A CORRECT SOLUTION:
# shown for comparison to correct, non-destructive version):
def my_array_sorting_method!(source)
  source.sort_by!{ |x| x.to_s }
end


# Hash sort solution
def my_hash_sorting_method(source)
   source.sort_by{ |k,v| v}
end

# Identify and describe the Ruby method(s) you implemented.
# Both of my final solutions use the **Enumerable#sort_by** method, which
# sorts the contents of the collection according to the given block of code.
# For both hashes and arrays, #sort_by is non-destructive. There is a
# destructive version for Arrays only, **Array#sort_by!**, which operates on
# the original array instead of returning a new array. I have included a
# destructive version of the method, #my_array_sorting_method!, for comparison.
# (Because it is never called by the rpsec file, the presence of
# #my_array_sorting_method! in this file does not affect the outcome of the
# tests.)

# Array version
# The block passed to **#sort_by** causes the items in the array to be sorted
# by their values as strings; this is accomplished by adding the **#to_s**, to
# convert the numbers in the array into strings. While this method passes this
# particular rspec, IT WILL FAIL if there are any numbers in the array with
# more than a single digit in them. To make the method work for integers of any
# size, you need to use the initial, less-streamlined solution, which uses
# **Enumerable#partition** to sift the integers and strings into separate
# arrays, then runs separate **Array#sort** calls on those arrays to put each
# in order, and finally calls **Array#flatten** to turn them back into a
# single array.

# Note also that the test doesn't mind that the sort is case-sensitive; since
# all capitals are alphabetized ahead of lower-case letters by default, the
# first string in the sorted array is "I". For a case-insensitive sort, you
# could add the method **String#downcase** to the end of the block, like this:
# source.sort_by{ |x| x.to_s.downcase }, which would return this array:
# [2, 3, "but", "have", "I", "only", "pets", "want"]

# Hash version
# Amazingly, the hash solution is actually simpler than the array solution.
# You use the method **Enumerable#sort_by**, and simply tell it to sort by the
# value. Doing so returns a two-dimensional array with the items sorted by the
# value of the second element. If you actually needed the method as a sorted
# hash, you just add the method **Array#to_h**, which converts a two-dimensional
# array right back into a hash.




# Person 4 - Eran Chazan ======================================================

#PseudoCode for an Array
# Accepts an array
# iterates through the array
# for each element, seatch for letter
# if element contains letter, delete element

def my_array_deletion_method!(source, thing_to_delete)
 source.delete_if{|word| word.to_s.include?(thing_to_delete)}
end
# PsueudoCode for a Hash
# Accept hash and keyword
# iterate through hash
# if key matches key in the 'if' statement then delete key and value
#
def my_hash_deletion_method!(source, thing_to_delete)
source.delete_if{|pet, age| pet==thing_to_delete}
end

# Identify and describe the Ruby method(s) you implemented:
# .delete_if => deletes every element of self which block evaluates to true.
# .to_s => this converts an object to a string
# .include? => this checks each object and returns true if the parameters given
# is present in the object being checked
#
# Teach your accountability group how to use the methods:
# You want to use the delete_if methods when you are checking for
# selective entries in an if statement. delete_if is like an if statement
# in that you need to declare a function block within {} where you give it
# an iterator and an conditional statement.
#
# Share any tricks you used to find and decipher the Ruby Docs:
# When looking through rubydocs I looked up that most resemble my pseudocode
# statement. If non exist then I look for candidates that could be a
# susbstitute. If I still can't find any, then I google what I want and see
# if what other people use in their solutions which I then look up in the
# RubyDocs.






# Person 5 - Steven Broderick =================================================

def my_array_splitting_method(source)
  source.partition { |item| item.is_a? Integer }
end

def my_hash_splitting_method(source, age)
  source.partition { |key, val| val <= age }
end

# Identify and describe the Ruby method(s) you implemented.

# my_array_splitting_method takes an array as its argument and splits the
#   array into two arrays, one with integers (ages, here) and one with
#   everything else (names, in this case). Then it returns an array containing
#   both of those arrays. The result is a 2-dimensional array. The method takes
#   advantage of the #partition and #is_a? methods:

# #partition splits the items into two arrays, putting those that match the
#   condition into one array and those don't into the other.

# #is_a? takes a class name as its argument and returns true or false,
#   depending on whether the object calling the method is a member of the
#   argument class.

# my_hash_splitting_method takes two arguments: (1) a hash that has integers
#   for its values (ages, here) and (2) an integer (also an age, in this case).
#   It splits the hash into two arrays, one containing the key-value pairs
#   (as 2-element arrays) for which the value (age) is less than or equal to
#   the "age" argument and one for everything else. Then it returns an array
#   containing both of those arrays. The result is a 3-dimensional array.
#   This method also takes advantage of #partition, but the condition is
#   different from the one in the other method.

