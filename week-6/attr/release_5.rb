# Release 4:

class Profile

  attr_accessor :age, :name, :occupation

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

end


# Driver code ========================================

instance_of_profile = Profile.new
instance_of_profile.print_info

puts "---------------------------"

10.times do
  sleep 0.1
  print "."
end
puts

instance_of_profile.age = 28
instance_of_profile.name = "Taylor"
instance_of_profile.occupation = "Rare Coin Trader"

instance_of_profile.print_info
