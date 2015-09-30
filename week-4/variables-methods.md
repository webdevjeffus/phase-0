# 4.3 Variables and Methods
### by Jeff George, 9.29.15, for DBC Phase 0

## Mini-Challenges

#### Full-Name Greeter

```ruby
puts "What is your first name?"
first_name = gets.chomp

puts "What is your middle name?"
middle_name = gets.chomp

puts "What is your last name?"
last_name = gets.chomp

puts "Salutations, " + first_name + " " + middle_name + " " + last_name + "."
```

#### Bigger, better number

```ruby
puts "What's your favorite number?"
fav_num = gets.chomp

better_num = fav_num.to_i + 1

puts "Wouldn't " + better_num.to_s + " be an even better favorite number?"
```

## Challenge Solutions:

#### Return a Formatted Address

https://github.com/webdevjeffus/phase-0/blob/master/week-4/address/my_solution.rb

#### Defining Math Methods

https://github.com/webdevjeffus/phase-0/blob/master/week-4/math/my_solution.rb



## Reflection Questions

#### How do you define a local variable?

I stand by my definition from the previous challenge:
A variable is a name that we create to act as sort of container for saving and recalling values, such as integers, floats, and strings. Once we assign a value to a variable, we can use the name of that variable in place of that value in expressions. A local variable is one that is accessible only within the current function or method; it cannot be changed directly by any activity outside the current function.

#### How do you define a method?

A method is a function attached to a class of object, like a string or an integer. A method is "called on" an object and performs the instructions within its code block on the value of the object. For example, to call the method "to string" on the integer 42, we type **42.to_s**. This method call would return the a string with the value "42".

#### What is the difference between a local variable and a method?

A local variable is a variable that is created within a method (or other code block), and is accessible only within that method. The value of a local variable may be created and set by arguments passed into the method, or they may be created and set by code within the method's code block. Thus, while a method is an action that can be performed on an object, a local variable is a variable that is used within the method in the process of performing method's work on the object.

#### How do you run a ruby program from the command line?

To run a ruby program from the command line, you simply enter "ruby" (or "rb"), followed by the full name of the file, including the .rb extension, at the terminal prompt. For example, to run the program **hello_world.rb**, you would type the following, and then hit ENTER:

```ruby
ruby hello_world.rb
```

#### How do you run an RSpec file from the command line?

To run an rspec file from the command line, you enter "rspec" followed by the full file name, again including the .rb extension. To run the RSpec file hello_world_spec.rb, enter:

```ruby
rspec hello_world_spec.rb
```

#### What was confusing about this material? What made sense?

Most of the programming concepts in this challenge were already familiar to me, so my main concern was getting the ruby syntax down. I still struggle to remember exactly what keywords, punctuation marks, and line returns are required in any given situation. I solve these concerns in two ways; sometimes I check books or online references for proper syntax, and sometimes I just make my best guess and then run the program to see if it works. If it doesn't, I use the error messages to track down where I messed up.

