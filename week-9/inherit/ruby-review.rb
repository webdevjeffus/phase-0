# Introduction to Inheritance

# I worked on this challenge by myself.


# Pseudocode
=begin
class GlobalCohort
  attributes:
    name
    p0_start_date
    immersive_start_date
    graduation_date
    num_of_students

  methods:
    add_student
    remove_student
    currently_in_phase
    graduated?

class LocalCohort
  attributes:
    city
    students
    email_list

class Student
  attributes:
    github
    email
    tuition_paid?
    integrity?
    p0_start_date
    phases_repeated
=end

# Initial Solution

require 'date'

class GlobalCohort
  attr_reader :p0_start_date, :name, :local_cohorts,
    :num_of_students

  def initialize(start_year,start_month,start_date, name)
    @p0_start_date = Date.new(start_year,start_month,start_date)
    @name = name
    @local_cohorts = {}
  end

  def create_local_cohort(
          city_key,
          city_string,
          start_date=@p0_start_date)
    self.local_cohorts[city_key] = LocalCohort.new(city_string, start_date)
  end

  def enroll_student(first_name, last_name, local_cohort)
    self.local_cohorts[local_cohort].students.push Student.new(first_name, last_name, local_cohort)

  end

  def immersive_start_date
    @p0_start_date + 63
  end

  def graduation_date
    @p0_start_date + 130
  end

  def num_of_students

  end

  def display_cohort_info
    puts "Start Phase 0: #{@p0_start_date}"
    puts "Start Immersive: #{immersive_start_date}"
    puts "Graduate: #{graduation_date}"
    # puts copperheads.local_cohorts[:boise].num_of_students
    puts '------------------------------------------'
  end

  def display_local_cohorts_info
    self.local_cohorts.each do |local_cohort|
      local_cohort.display_cohort_info
      local_cohort.display_student_info
    end
  end

end


class LocalCohort < GlobalCohort
  attr_reader :city, :p0_start_date
  attr_accessor :students

  def initialize(city_string, start_date)
    @city = city_string
    @p0_start_date = start_date
    @students = []
  end

  def display_student_info
    self.students.each do  |student|
      print first_name + ' '
      puts last_name
    end
    puts "=============================="
  end

end


class Student
  attr_reader :first_name, :last_name, :local_cohort

  def initialize(first_name, last_name, local_cohort)
    @first_name = first_name
    @last_name = last_name
    @local_cohort = local_cohort
  end
end

# Refactored Solution




# Driver Code

copperheads = GlobalCohort.new(2015,9,7,"Copperheads")

copperheads.create_local_cohort(:boise, 'Boise')
copperheads.enroll_student("Lando", "Calrissian", :boise)
copperheads.enroll_student("Ahsoka", "Tano", :boise)

copperheads.create_local_cohort(:springfield, 'Springfield')
copperheads.enroll_student("Bart", "Simpson", :springfield)
copperheads.enroll_student("Maggie", "Simpson", :springfield)
copperheads.enroll_student("Lisa", "Simpson", :springfield)

puts copperheads.name
puts copperheads.p0_start_date
puts copperheads.immersive_start_date
puts copperheads.graduation_date
# puts copperheads.num_of_students

copperheads.display_cohort_info
copperheads.display_local_cohorts_info

=begin
# puts copperheads.local_cohorts
puts "----------------"
puts "Local Cohort: #{copperheads.local_cohorts[:boise].city}"
puts "Start Phase 0: #{copperheads.local_cohorts[:boise].p0_start_date}"
puts "Start Immersive: #{copperheads.local_cohorts[:boise].immersive_start_date}"
puts "Graduate: #{copperheads.local_cohorts[:boise].graduation_date}"
# puts copperheads.local_cohorts[:boise].num_of_students
puts "Students:"
copperheads.enroll_student("Lando", "Calrissian", :boise)
copperheads.enroll_student("Ahsoka", "Tano", :boise)
print copperheads.local_cohorts[:boise].students[0].first_name + ' '
puts copperheads.local_cohorts[:boise].students[0].last_name
print copperheads.local_cohorts[:boise].students[1].first_name + ' '
puts copperheads.local_cohorts[:boise].students[1].last_name

puts "----------------"
puts copperheads.local_cohorts[:springfield].city
puts "Start Phase 0: " + copperheads.local_cohorts[:springfield].p0_start_date
puts "Start Immersive: " + copperheads.local_cohorts[:springfield].immersive_start_date
puts "Graduate: " + copperheads.local_cohorts[:springfield].graduation_date
puts "Students:"

print copperheads.local_cohorts[:springfield].students[0].first_name + ' '
puts copperheads.local_cohorts[:springfield].students[0].last_name
print copperheads.local_cohorts[:springfield].students[1].first_name + ' '
puts copperheads.local_cohorts[:springfield].students[1].last_name
print copperheads.local_cohorts[:springfield].students[2].first_name + ' '
puts copperheads.local_cohorts[:springfield].students[2].last_name
=end

# Reflection