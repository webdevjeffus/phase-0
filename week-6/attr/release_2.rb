# Release 1

class Profile

  attr_reader :age

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

  #this code is no longer needed.
  # def what_is_age
  #   @age
  # end

  def change_my_age=(new_age)
    @age = new_age
  end

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

# This method changed names! Now we have a method called #.age which returns the value of @age, just like what_is_age did. Thanks to attr_reader :age. If you don't believe me and you want to see for your self, paste lines 3 - 50 into IRB and type
# instance_of_profile.methods - Object.methods
#age() will be a member of this list!
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

instance_of_profile.change_my_age = 28
instance_of_profile.change_my_name = "Taylor"
instance_of_profile.change_my_occupation = "Rare Coins Trader"

puts
puts "---- printing all profile info -----"
sleep 0.8
instance_of_profile.print_info
