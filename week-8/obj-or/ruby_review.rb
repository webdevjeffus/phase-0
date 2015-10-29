# OO Basics: Student


# I worked on this challenge [by myself, with: ].
# This challenge took me [#] hours.


# Pseudocode
=begin
CREATE five student objects
  Each student has a first_name and an array of 5 test scores
PUSH student objects into students array
=end

# Initial Solution

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


alex = Student.new( "Alex", [100,100,100,0,100] );
bonnie = Student.new( "Bonnie", [75, 80, 85, 90, 95]);
carlos = Student.new( "Carlos", [85, 88, 91, 94, 97]);
dana = Student.new("Dana", [90, 86, 82, 78, 86]);
eric = Student.new("Eric", [95, 75, 85, 80, 90]);

students = [ alex, bonnie, carlos, dana, eric ];

def linear_search(array, target)
  array.each_index do |i|
    if array[i].first_name == target then return i end
  end
  return -1
end

def binary_search(array, target)
  p "=================="
  # p target
  # p array[array.length/2].first_name
  #unless array.include?(target) then return -1 end

  if array[array.length/2].first_name == target
    return array.length/2;
  elsif array[array.length/2].first_name > target
    array.slice!(0..(array.length/2));
    print array.length;
    puts;
    binary_search(array, target);
  else
    array.slice!( (array.length/2) + 1, array.length)
    print array.length;
    puts;
    binary_search(array, target);
  end

end

p binary_search(students, "Alex");


# Refactored Solution





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

p binary_search(students, "Eric") == 3
p binary_search(students, "NOT A STUDENT") == -1




# Reflection
=begin
=end