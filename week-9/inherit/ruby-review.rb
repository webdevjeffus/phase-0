# Introduction to Inheritance

# I worked on this challenge by myself.


################################## Pseudocode #################################

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
    first_name
    last_name
    local_cohort
    email
=end

############################# Initial Solution ################################

=begin
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

  def add_student(first_name, last_name, local_cohort)
    self.local_cohorts[local_cohort].students.push Student.new(first_name, last_name, local_cohort)
  end

  def remove_student(first_name, last_name)
    self.local_cohorts.each_key do |cohort|
      local_cohorts[cohort].students.each do |student|
        if student.first_name == first_name && student.last_name == last_name
          local_cohorts[cohort].students.delete student
          puts "#{first_name} #{last_name} has been removed from the #{local_cohorts[cohort].name} cohort."
        end
      end
    end
  end

  def add_student_email(first_name, last_name, email)
    self.local_cohorts.each_key do |cohort|
      local_cohorts[cohort].students.each_index do |student|
        if local_cohorts[cohort].students[student].first_name == first_name &&
              local_cohorts[cohort].students[student].last_name == last_name
          local_cohorts[cohort].students[student].email = email
          puts "Email address added for #{first_name} #{last_name} in the the #{local_cohorts[cohort].name} cohort."
        end
      end
    end
  end

  def get_email_list
    email_list = []
    self.local_cohorts.each_key do |cohort|
      email_list << local_cohorts[cohort].get_email_list
    end
    return email_list
  end

  def immersive_start_date
    @p0_start_date + 63
  end

  def graduation_date
    @p0_start_date + 130
  end

  def currently_in_phase
    case Date.today - @p0_start_date
    when 0..63
      return "Phase 0"
    when 63..84
      return "Phase 1"
    when 84..105
      return "Phase 2"
    when 105..126
      return "Phase 3"
    when 126..130
      return "Career Week"
    else
      return "The #{@name} are not an active cohort."
    end
  end

  def graduated?
    (Date.today - @p0_start_date) > 130 ? true : false
  end

  def num_of_students
    student_count = 0
    self.local_cohorts.each_key do |cohort|
      local_cohorts[cohort].students.each do |student|
        student_count += 1
      end
    end
    return student_count
  end

  def display_cohort_info
    puts '=========================================='
    puts @name
    puts "Start Phase 0: #{@p0_start_date}"
    puts "Start Immersive: #{immersive_start_date}"
    puts "Graduate: #{graduation_date}"
    puts "Enrollment: #{self.num_of_students}"
    puts "Current Phase: #{currently_in_phase}"
  end

  def display_local_cohorts_info
    self.local_cohorts.each_key do |local_cohort|
      local_cohorts[local_cohort].display_cohort_info
      local_cohorts[local_cohort].display_student_info
    end
  end

end


class LocalCohort < GlobalCohort
  attr_reader :city, :p0_start_date
  attr_accessor :students

  def initialize(city_string, start_date)
    @name = city_string
    @p0_start_date = start_date
    @students = []
  end

  def num_of_students
    student_count = 0
    self.students.each do |student|
      student_count += 1
    end
    return student_count
  end

  def display_student_info
    puts '------------------------------------------'
    self.students.each do  |student|
      print student.first_name + ' '
      puts student.last_name
    end
  end

  def get_email_list
    email_list = []
    self.students.each_index do |index|
      if students[index].email
        email_list << students[index].email
      end
    end
    return email_list
  end

end


class Student
  attr_reader :first_name, :last_name, :local_cohort
  attr_accessor :email

  def initialize(first_name, last_name, local_cohort)
    @first_name = first_name
    @last_name = last_name
    @local_cohort = local_cohort
    @email = nil
  end
end
=end

############################### Refactored Solution ###########################

require 'date'

class GlobalCohort
  attr_reader :p0_start_date, :name, :local_cohorts, :num_of_students

  def initialize(start_year,start_month,start_date, name)
    @p0_start_date = Date.new(start_year,start_month,start_date)
    @name = name
    @local_cohorts = {}
  end

  def create_local_cohort(city_key, city_string, start_date=@p0_start_date)
    self.local_cohorts[city_key] = LocalCohort.new(city_string, start_date)
  end

  def add_student(first_name, last_name, local_cohort)
    self.local_cohorts[local_cohort].students.push Student.new(first_name, last_name, local_cohort)
  end

  def remove_student(first_name, last_name)
    self.local_cohorts.each_key do |cohort|
      local_cohorts[cohort].students.each do |student|
        if student.first_name == first_name && student.last_name == last_name
          local_cohorts[cohort].students.delete student
          puts "#{first_name} #{last_name} has been removed from the #{local_cohorts[cohort].name} cohort."
        end
      end
    end
  end

  def add_student_email(first_name, last_name, email)
    self.local_cohorts.each_key do |cohort|
      local_cohorts[cohort].students.each_index do |student|
        if local_cohorts[cohort].students[student].first_name == first_name &&
              local_cohorts[cohort].students[student].last_name == last_name
          local_cohorts[cohort].students[student].email = email
          puts "Email address added for #{first_name} #{last_name} in the the #{local_cohorts[cohort].name} cohort."
        end
      end
    end
  end

  def get_email_list
    email_list = []
    self.local_cohorts.each_key do |cohort|
      email_list << local_cohorts[cohort].get_email_list
    end
    return email_list
  end

  def immersive_start_date
    @p0_start_date + 63
  end

  def graduation_date
    @p0_start_date + 130
  end

  def currently_in_phase
    case Date.today - @p0_start_date
    when 0..63 then return "Phase 0"
    when 63..84 then return "Phase 1"
    when 84..105 then return "Phase 2"
    when 105..126 then return "Phase 3"
    when 126..130 then return "Career Week"
    else return "The #{@name} are not an active cohort."
    end
  end

  def graduated?
    (Date.today - @p0_start_date) > 130 ? true : false
  end

  def num_of_students
    student_count = 0
    self.local_cohorts.each_key do |cohort|
      student_count += local_cohorts[cohort].students.length
    end
    return student_count
  end

  def display_cohort_info
    puts '=========================================='
    puts @name
    puts "Start Phase 0: #{@p0_start_date}"
    puts "Start Immersive: #{immersive_start_date}"
    puts "Graduate: #{graduation_date}"
    puts "Enrollment: #{self.num_of_students}"
    puts "Current Phase: #{currently_in_phase}"
  end

  def display_local_cohorts_info
    self.local_cohorts.each_key do |local_cohort|
      local_cohorts[local_cohort].display_cohort_info
      local_cohorts[local_cohort].display_student_info
    end
  end

end


class LocalCohort < GlobalCohort
  attr_reader :city, :p0_start_date
  attr_accessor :students

  def initialize(city_string, start_date)
    @name = city_string
    @p0_start_date = start_date
    @students = []
  end

  def num_of_students
    self.students.length
  end

  def display_student_info
    puts '------------------------------------------'
    self.students.each { |student| puts student.first_name + ' ' + student.last_name }
  end

  def get_email_list
    email_list = []
    self.students.each_index do |index|
      if students[index].email then email_list << students[index].email end
    end
    return email_list
  end

end


class Student
  attr_reader :first_name, :last_name, :local_cohort
  attr_accessor :email

  def initialize(first_name, last_name, local_cohort)
    @first_name = first_name
    @last_name = last_name
    @local_cohort = local_cohort
    @email = nil
  end
end


################################### Driver Code ###############################

copperheads = GlobalCohort.new(2015,9,7,"Copperheads")

copperheads.create_local_cohort(:boise, 'Boise')
copperheads.add_student("Lando", "Calrissian", :boise)
copperheads.add_student_email("Lando", "Calrissian","lando@cloudcity.gov")
copperheads.add_student("Ahsoka", "Tano", :boise)
copperheads.add_student_email("Ahsoka", "Tano", "atano@jeditemple.edu")
copperheads.add_student("Luke", "Skywalker", :boise)
copperheads.add_student_email("Luke", "Skywalker", "farmboy@larsfarms.com")
copperheads.add_student("Jar Jar", "Binks", :boise)
copperheads.add_student_email("Jar Jar", "Binks", "senatorbinks@naboo.gov")

copperheads.create_local_cohort(:springfield, 'Springfield')
copperheads.add_student("Bart", "Simpson", :springfield)
copperheads.add_student_email("Bart", "Simpson", "cowabungakid@gmail.com")
copperheads.add_student("Maggie", "Simpson", :springfield)
copperheads.add_student("Lisa", "Simpson", :springfield)
copperheads.add_student_email("Lisa", "Simpson", "lisalisa2015@gmail.com")
copperheads.add_student("Ned", "Flanders", :springfield)
copperheads.add_student_email("Ned", "Flanders", "betternedthanred@leftorium.com")

copperheads.display_cohort_info
copperheads.display_local_cohorts_info

copperheads.remove_student("Bart", "Simpson")

copperheads.display_cohort_info
copperheads.display_local_cohorts_info
puts "=========================================="
puts "Copperheads Email Addresses:"
puts copperheads.get_email_list


################################# Reflection #################################