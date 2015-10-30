# Ruby Review: Object-Oriented Basics
# by Jeff George, 10/29/15


# I worked on this challenge by myself.
# This challenge took me 5 hours.


# Pseudocode ==================================================================
=begin

CLASS definition:..............................................................
Accessors: scores, first_name

INITIALIZE:
ACCEPT arguments: scores, first_name
VALIDATE scores is array of integers
SET instance variables for scores, first_name equal to arguments

AVERAGE:
DECLARE local variable to hold sum during calculation
ITERATE over scores array, adding each score to the sum
DIVIDE the sum by the length of the scores array

LETTER GRADE:
CASE -- check average score for student
WHEN average is 90+, A
WHEN average is 80+, B
WHEN average is 70+, C
WHEN average is 60+, D
ELSE, F

GLOBAL METHODS.................................................................

LINEAR SEARCH:
ACCEPT arguments: array, target
ITERATE over array by index
  IF array[index] matches target, return index
IF target is not found in array, return -1

BINARY SEARCH:
ACCEPT arguments: sorted array, target
CREATE variables
  min_index = 0
  max_index = array.length - 1
  mid_index = max_index / 2
WHILE min_index <= max_index
  CASE target is less than, equal to, or greater than array[mid-index]
  WHEN target is less than mid_index
    SET max_index = middle element
  WHEN target is greater than middle element
    SET min_index = middle element
  ELSE return mid_index


RUN-TIME CODE:.................................................................
CREATE five student objects
  Each student has a first_name and an array of 5 test scores
PUSH student objects into students array

CALL all methods

=end


# Initial Solution ============================================================
=begin
class Student
  attr_accessor :scores, :first_name

  def initialize(first_name, scores)   #Use named arguments!
    if (scores.is_a?(Array) == false || scores[0].is_a?(Integer) == false)
      raise ArgumentError, "The argument must be an array of test scores."
    end
    @scores = scores;
    @first_name = first_name;
  end

  def average()
    sum = 0
    @scores.each{ |a| sum += a }
    sum / @scores.length
  end

  def letter_grade()
    case self.average
    when 90..100
      return "A"
    when 80..90
      return "B"
    when 70..80
      return "C"
    when 60..70
      return "D"
    else
      return "F"
    end
  end

end


def linear_search(array, target)
  array.each_index do |i|
    if array[i].first_name == target then return i end
  end
  return -1
end


def binary_search(array, target)
  min_index = 0;
  max_index = array.length - 1;
  mid_index = max_index / 2;

  while min_index != max_index

    if target < array[mid_index].first_name
      max_index = mid_index - 1
      mid_index = (max_index + min_index) / 2

    elsif target > array[mid_index].first_name
      min_index = mid_index + 1
      mid_index = (max_index + min_index) / 2

    else
      max_index = mid_index
      min_index = mid_index
    end
  end

  if target == array[mid_index].first_name
    return mid_index
  else
    return -1
  end

end

# Create students
alex = Student.new( "Alex", [100,100,100,0,100] );
bonnie = Student.new( "Bonnie", [75, 80, 85, 90, 95]);
carlos = Student.new( "Carlos", [85, 88, 91, 94, 97]);
dana = Student.new("Dana", [90, 86, 82, 78, 86]);
eric = Student.new("Eric", [95, 75, 85, 80, 90]);

fred = Student.new( "Fred", [100,100,100,0,100] );
gert = Student.new( "Gert", [75, 80, 85, 90, 95]);
hazel = Student.new( "Hazel", [85, 88, 91, 94, 97]);
ivan = Student.new("Ivan", [90, 86, 82, 78, 86]);
jeff = Student.new("Jeff", [95, 75, 85, 80, 90]);

# Populate students array
students = [ alex, bonnie, carlos, dana, eric, fred, gert, hazel, ivan, jeff ];
=end

# Refactored Solution =========================================================

class Student
  attr_accessor :first_name, :scores

  def initialize(first_name, scores)   #Use named arguments!
    if (scores.is_a?(Array) == false || scores[0].is_a?(Integer) == false)
      raise ArgumentError, "The argument must be an array of test scores."
    end
    @first_name = first_name;
    @scores = scores;
  end

  def average()
    @scores.reduce(:+) / @scores.length
  end

  def letter_grade()
    case self.average
    when 90..100 then "A"
    when 80..90 then "B"
    when 70..80 then "C"
    when 60..70 then "D"
    else "F"
    end
  end

end


def linear_search(array, target)
  array.each_index do |i|
    if array[i].first_name == target then return i end
  end
  return -1
end


def binary_search(array, target)
  min = 0;
  max = array.length - 1;
  def mid(min, max) (min + max) / 2 end

  while min != max
    if target < array[mid(min, max)].first_name
      max = mid(min, max) - 1
    elsif target > array[mid(min, max)].first_name
      min = mid(min, max) + 1
    else
      max = mid(min, max)
      min = mid(min, max)
    end
  end

  if target == array[mid(min, max)].first_name
    return mid(min, max)
  else
    return -1
  end

end

# Create students
alex = Student.new( "Alex", [100,100,100,0,100] );
bonnie = Student.new( "Bonnie", [75, 80, 85, 90, 95]);
carlos = Student.new( "Carlos", [85, 88, 91, 94, 97]);
dana = Student.new("Dana", [90, 86, 82, 78, 86]);
eric = Student.new("Eric", [95, 75, 85, 80, 90]);

fred = Student.new( "Fred", [100,0,0,0,0] );
gert = Student.new( "Gert", [75, 80, 85, 90, 95]);
hazel = Student.new( "Hazel", [85, 88, 91, 94, 97]);
ivan = Student.new("Ivan", [90, 86, 82, 78, 86]);
jeff = Student.new("Jeff", [95, 75, 85, 80, 90]);

# Populate students array
students = [ alex, bonnie, carlos, dana, eric, fred, gert, hazel, ivan, jeff ];



# DRIVER TESTS GO BELOW THIS LINE =============================================

# Initial Tests:
p students[0].first_name == "Alex"
p students[0].scores.length == 5
p students[0].scores[0] == students[0].scores[4]
p students[0].scores[3] == 0


# Additional Tests 1:
p students[0].average == 80
p students[0].letter_grade == 'B'

# Additional Tests 2:
p linear_search(students, "Alex") == 0
p linear_search(students, "NOT A STUDENT") == -1

# Tests added for binary_search:
puts "================"
p binary_search(students, "Alex") == 0
p binary_search(students, "Bonnie") == 1
p binary_search(students, "Carlos") == 2
p binary_search(students, "Dana") == 3
p binary_search(students, "Eric") == 4
p binary_search(students, "Fred") == 5
p binary_search(students, "Gert") == 6
p binary_search(students, "Hazel") == 7
p binary_search(students, "Ivan") == 8
p binary_search(students, "Jeff") == 9
p binary_search(students, "NOT A STUDENT") == -1


# Reflection ==================================================================
=begin

NOTE: I wrote the longer reflection on Binary Search method _before_ I found
the reflection questions on Canvas on the master page for 8.6.

#### What concepts did you review or learn in this challenge?

The two main issues I dealt with in the chapter were the binary search
algorithm, and proper notation to access data in nested data structures. I
feel like I'm finally coming to grips with the nested data structure thing,
after this project and the JavaScript challenge on tallying votes. I talk about
my experience with the binary search separately, below.

The other neat thing I was able to do for this challenge was to write a method
as a local variable. In the initial version of #binary_search, I repeated the
calculation for the middle index several times. In the refactored version, I
wrote a method, #min, as a local variable within #binary_search, so that I
could just call that instead of repeating the code for the calculation.
Handling that calculation as a "local method" streamlined the code, and made
it so that if I need to adjust or debug the calculation, I only have to do it
in one place.


#### What is still confusing to you about Ruby?

I'm still trying to wrap my head around all of Ruby's iteration methods--how
they work, and how they differ from one another. I managed to write my
initial solution for this challenge using just #each and while loops. On
refactoring, I replaced the #each call in Student#average with #reduce, which
let me eliminate a local variable and two unnecessary lines of code.


#### What are you going to study to get more prepared for Phase 1?

I definitely want to practice with Ruby iteration. I'm considering making
that the focus of my cheatsheet for this week's solo challenge.


## Struggling with the Binary Search method
The work in this challenge on the student object was very straightforward. I
had no trouble creating the student objects, putting them into the students
array, or completing the initial solutions for #average, #letter_grade, and
#linear_search. I really struggled with the binary search, though. At first, I
tried to write a recursive solution, but I was having trouble handling the
syntax for identifying elements within nested array/hash structure in the
recursion. I'm pretty sure I had the logic down, but I just couldn't get the
pointers right. I finally gave up, read the Wiki link on binary searches
carefully, and came back to try an iterative solution, using the while loop.

Again, I had the overall logic laid out correctly for the while-loop version,
but it still wasn't able to correctly find all the students in the array, and
sometimes went into an infinite loop. The problem turned out to be in the
calculation for the reset of the midpoint index (mid_index in the initial
solution). I was trying to make it work with:

( (min_index / 2) + (max_index / 2) )

But with that expression, when the target value was low in the range of indexes,
it would eventually fall outside of the shrinking range between the min_index
and the max_index. I realized that what was happening was that any time both
the min_index and the max_index were odd numbers, the mid_index would be set
one too low, due to Ruby's integer division losing fractional results. I tried
float division, but quickly got back numbers like 2.9999999999999 when I was
expecting 3. Ultimately, I switched to the expression:

 ( (min_index + max_index) / 2)

This version--which would be identical to the first in "regular" math with
fractions--avoids the problem the other version had with dropping one from the
value of the new mid_index when both min_ and max_index were odd. With this
expression, the code passed all tests.

#### Linear vs. Binary Search
At first glance, you might think the linear method for searching would be
"better" than the binary algorithm, because it is much shorter and more
readable. Searching through very small sets, as in this challenge, the linear
works reasonably well, but when you need to search a set of thousands or
hundreds of thousands of records, the binary search is much, much quicker.

The linear search is about the most inefficient search algorithm you can
write. It requires you to check every single record in the set for a match,
one by one, until it finds a match. If you have 1,000 records in your
database, that means you might need to run it's loop 1,000 times to find
the last member of the set is your match. A binary search is much faster,
because on each iteration, it eliminates half of the possible results
from consideration in the next iteration. This means that a binary search
will find a match in a set of 1,000 records no more than 10 iterations,
every time! Starting with 1,000 records, here's how many you'd have left
to search on each subsequent loop:

1000 => 500 => 250 => 125 => 63 => 32 => 16 => 8 => 4 => 2 => 1

Thus, a linear search will take 1 to 1000 loops, averaging 500, while a
binary search will take 1 to 10 loops (but taking fewer than 10 only about
1% of the time, due to accidentally hitting the target on an early
iteration). This is an excellent example of the issues commonly referred to
as "Big-O" complexity, which deal with the relative processing efficiency
of different data structures and algorithms when dealing with very large
data sets.
=end