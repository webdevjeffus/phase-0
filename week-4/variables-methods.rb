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