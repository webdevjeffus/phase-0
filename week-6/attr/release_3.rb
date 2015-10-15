# Release 2:

class Profile

  attr_reader :age
  attr_writer :age

  def initialize
    @age = 27
    @name = "Kim"
    @occupation = "Cartographer"
  end

  def print_info
    puts
    puts "age: #{@age}"
    puts
    puts "name: #{@name}"
    puts
    puts "occupation: #{@occupation}"
    puts
  end

  # This code is no longer needed
  # def change_my_age=(new_age)
  #   @age = new_age
  # end

  def what_is_name
    @name
  end

  def change_my_name=(new_name)
    @name = new_name
  end

  def what_is_occupation
    @occupation
  end

  def change_my_occupation=(new_occupation)
    @occupation = new_occupation
  end


end

instance_of_profile = Profile.new

puts "--- printing age -----"
sleep 0.8
p instance_of_profile.age

puts "--- printing name ----"
sleep 0.8
p instance_of_profile.what_is_name

puts "--- printing occupation ----"
sleep 0.8
p instance_of_profile.what_is_occupation

puts "--- changing profile information ----"
10.times do
  print "."
  sleep 0.1
end

instance_of_profile.age = 28 # This method has changed! See the difference?
instance_of_profile.change_my_name = "Taylor"
instance_of_profile.change_my_occupation = "Rare Coins Trader"


puts
puts "---- printing all profile info -----"
sleep 0.8
instance_of_profile.print_info