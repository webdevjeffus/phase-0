# OO Basics: Student


# I worked on this challenge [by myself, with: ].
# This challenge took me [#] hours.


# Pseudocode
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

students = [ alex, bonnie, carlos, dana, eric, fred, gert, hazel, ivan, jeff ];
=end

# Refactored Solution

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
    @scores.reduce(:+) / @scores.length
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

  # case min != max
  # when target < array[mid(min, max)].first_name
  #   max = mid(min, max) - 1
  # when target > array[mid(min, max)].first_name
  #   min = mid(min, max) + 1
  # else
  #   max = mid(min, max)
  #   min = mid(min, max)
  # end


  if target == array[mid(min, max)].first_name
    return mid(min, max)
  else
    return -1
  end

end


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

students = [ alex, bonnie, carlos, dana, eric, fred, gert, hazel, ivan, jeff ];



# DRIVER TESTS GO BELOW THIS LINE
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
p "=============="
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




# Reflection
=begin
=end