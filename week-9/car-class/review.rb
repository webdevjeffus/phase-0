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

  initialize: model, color, direction, compass, odometer, hotbox

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

  method: load_pizza(size, toppings)
    create a pizza object
    append pizza object to end of hotbox (delivery array)


Create pizza class with arguments for order number, size, toppings
  class variable = current_order_number

  initialize:
    order_number = current_order_number
    increment current_order_number
    size
    toppings




=end

# 3. Initial Solution

=begin
class Pizza
  attr_reader :size, :toppings, :order_num
  @@current_pizza_id = 1

  def initialize(size, toppings=[])
    @size = size
    @toppings = toppings.to_a
    @pizza_id = @@current_pizza_id
    @@current_pizza_id += 1
  end
end


class Car
  attr_reader :model, :color, :compass, :direction, :odometer, :hotbox
  attr_accessor :distance, :speed

  def initialize(model, color)
    @model = model.capitalize
    @color = color
    @compass = ["North", "East", "South", "West"]
    @direction = 0
    @odometer = 0
    @hotbox = []
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

  def load_pizza(size, toppings=[])
    @hotbox << Pizza.new(size, toppings)
    puts "Loading a #{size} #{toppings} pizza in my hotbox!"
  end

  def deliver_pizza
    pizza = @hotbox.shift
    puts "Delivering #{pizza.size} #{pizza.toppings} pizza."
    puts "There are #{@hotbox.length} pizzas left to deliver!"
  end

end
=end

# 4. Refactored Solution

class Pizza
  attr_reader :size, :toppings, :pizza_id
  @@current_pizza_id = 1

  def initialize(size, toppings=[])
    @size = size
    @toppings = toppings.to_a
    @pizza_id = @@current_pizza_id
    @@current_pizza_id += 1
  end
end


class Car
  attr_reader :model, :color, :compass, :direction, :odometer, :hotbox
  attr_accessor :distance, :speed

  def initialize(model, color)
    @model = model.capitalize
    @color = color
    @compass = ["North", "East", "South", "West"]
    @direction = 0
    @odometer = 0
    @hotbox = []
    puts "I'm delivering pizzas in a #{@color} #{@model}!"
  end

  def turn(right_or_left)
    if right_or_left == "right" then @direction += 1
    elsif right_or_left == "left" then @direction -= 1
    end

    if @direction < 0 then @direction = 3
    elsif @direction > 3 then @direction = 0
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
      puts "I'm driving #{distance} more miles to the #{self.compass[self.direction]}."
    end
  end

  def load_pizza(size, toppings=[])
    @hotbox << Pizza.new(size, toppings)
    puts "Loading pizza number #{@hotbox[-1].pizza_id} #{size} #{toppings} pizza in my hotbox!"
    puts "I now have #{@hotbox.length} pizzas to deliver!"
  end

  def deliver_pizza
    pizza = @hotbox.shift
    puts "Delivering pizza number #{pizza.pizza_id} #{pizza.size} #{pizza.toppings} pizza."
    puts "There are #{@hotbox.length} pizzas left to deliver!"
  end

end





# 1. DRIVER TESTS GO BELOW THIS LINE

# Create a new car of your desired model and type
mustang = Car.new("mustang", "red")

# Load a pizza
mustang.load_pizza("large", ["pepperoni", "anchovies"])
mustang.load_pizza("small", ["sausage"])
mustang.load_pizza("large", ["green pepper", "olives"])
mustang.load_pizza("medium", ["ham", "pineapple", "green peppers"])
puts "I'm delivering #{mustang.hotbox.length} pizzas on this run!"

mustang.deliver_pizza

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

mustang.deliver_pizza

# At the stop sign, turn left
# Drive 1.4 miles (speed limit is 35 mph)
mustang.route_leg(35, 1.4, "left")

# Stop at your destination
# Log your total distance travelled
mustang.deliver_pizza
mustang.deliver_pizza
puts "I drove #{mustang.odometer} to deliver these pizzas!"



# 5. Reflection
=begin

What concepts did you review in this challenge?

Obviously, this challenge was a review of Class and object creation in Ruby--
which was a good thing to do this week, to put JavaScript to bed and get back
into my Ruby headspace before Phase 1. This challenge gave us the chance to
create two classes, one of which, the Car class, is sort of a "wrapper" class
in the program, and another, the Pizza class, that can be instantiated from
within the wrapper class (see our Car#load_pizza method), and then those Pizza
objects can be passed out of their owning Car object, and dealt with separately
(see our Car#deliver_pizza method).


What is still confusing to you about Ruby?

It's not so much that I'm _confused_ about this, but I'm excited to see where
Ruby is going. I've done some programming in Python in which it was possible to
create graphic video games using a 2D graphic library, called Pygame. I'm
very interested to learn how Ruby gems can be incorporated into programs, and
what capabilities they are capable of adding. I am expecting that they will be
the rough equivalent of Python's libraries, but that's supposition on my part.
I'm very interested to see where Ruby goes next.


What are you going to study to get more prepared for Phase 1?

I wish I had more time to do more or even all of the Ruby review challenges,
but I don't. I'm going to have my hands full this week dealing with real life
issues that have to be resolved before we go onsite, that I'm not going to have
time to do anything more than the minimum required for week 9. That's unfortunate,
because I can see that all of the review challenges are interesting and likely
relevant to what we'll be doing in Phase 1. I'm hoping that enough of us will
have done different ones that once we get onsite, _someone_ will have done each
of them, and will be able to bring those experiences to our work onsite.


=end