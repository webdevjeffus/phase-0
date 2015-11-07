# Create a Car Class from User Stories


# I worked on this challenge Max Iniguez.

=begin
User stories:
# Create a new car and set its model and color so I can customize it in the video game.

# I need to be able to define a distance to drive so I can follow directions appropriately.

# See the speed I am traveling, so I can properly accelerate or decelerate.

# Turn left or right so I can navigate a city and follow directions.

# Accelerate and decelerate the car to a defined speed so I can drive following the rules of the road.

Keep track of the total distance I have travelled, so I can get paid for mileage.

Stop the car so I can follow traffic signs and signals.

See output reflecting the latest action of my car so I can see a play-by-play of the pizza delivery.


# 2. Pseudocode
Create class car with arguments for model and color

attribute reader: model and color
attribute accessors: distance, speed

initialize: model, color, direction, compass, odometer

turn method: take right or left as argument
  IF right, increment direction
  ELSIF decrement direction
  ELSE
  IF direction < 0; direction = 3
  ELSIF direction > 3; direction = 0

method: route_leg(speed, distance,leg_turn="straight")
  make turn if necessary
  set speed
  set distance
  add distance to odometer



=end

# 3. Initial Solution


class Car
  attr_reader :model, :color, :compass, :direction, :odometer
  attr_accessor :distance, :speed

  def initialize(model, color)
    @model = model.capitalize
    @color = color
    @compass = ["North", "East", "South", "West"]
    @direction = 0
    @odometer = 0
    puts "I'm delivering pizzas in a #{@color} #{@model}!"
  end

  def turn(right_or_left)
    if right_or_left == "right"
      @direction += 1
    else @direction -= 1
    end
    if @direction < 0
      @direction = 3
    elsif @direction > 3
      @direction = 0
    end
  end


  def route_leg( speed, distance, leg_turn="straight")
    self.turn(leg_turn)
    @speed = speed
    @distance = distance
    @odometer += distance
    if leg_turn != "straight"
    puts "I'm turning #{leg_turn}, and driving #{distance} miles to the #{self.compass[self.direction]}."
    else
      puts "I'm driving #{distance} miles to the #{self.compass[self.direction]}."
    end
  end

end




# 4. Refactored Solution







# 1. DRIVER TESTS GO BELOW THIS LINE

# Create a new car of your desired model and type
mustang = Car.new("mustang", "red")

# Drive .25 miles (speed limit is 25 mph)
mustang.route_leg(25, 0.25)

# At the stop sign, turn right
# Drive 1.5 miles (speed limit is 35 mph)
mustang.route_leg(35, 1.5, "right")


# At the school zone, check your speed
puts "Oh no! School zone! I'm driving #{mustang.speed} mph! Gotta slow down!"

# Slow down to speed limit 15 mph
# Drive .25 miles more miles
mustang.route_leg(15, 0.25)

# At the stop sign, turn left
# Drive 1.4 miles (speed limit is 35 mph)
mustang.route_leg(35, 1.4, "left")

# Stop at your destination
# Log your total distance travelled
puts "I drove #{mustang.odometer} to deliver this pizza!"



# 5. Reflection