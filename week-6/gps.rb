# Restaurant Inventory Planner
# Refactored and revised by
#     Jeremy Powell
#     Jeff George

# We spent 3 hours on this challenge.


=begin

# LEGACY CODE #################################################################

def serving_size_calc(item_to_make, order_quantity)
  library = {"cookie" => 1, "cake" =>  5, "pie" => 7}
  error_counter = 3

  library.each do |food|
    if library[food] != library[item_to_make]
      p error_counter += -1
    end
  end

  if error_counter > 0
    raise ArgumentError.new("#{item_to_make} is not a valid input")
  end

  serving_size = library.values_at(item_to_make)[0]
  serving_size_mod = order_quantity % serving_size

  case serving_size_mod
  when 0
    return "Calculations complete: Make #{order_quantity/serving_size} of #{item_to_make}"
  else
    return "Calculations complete: Make #{order_quantity/serving_size} of #{item_to_make}, you have #{serving_size_mod} leftover ingredients. Suggested baking items: TODO: MAKE THIS FEATURE"
  end
end

p serving_size_calc("pie", 7)
p serving_size_calc("pie", 8)
p serving_size_calc("cake", 5)
p serving_size_calc("cake", 7)
p serving_size_calc("cookie", 1)
p serving_size_calc("cookie", 10)
p serving_size_calc("THIS IS AN ERROR", 5)
=end



# REFACTORED AND REVISED VERSION ##############################################

# Helper Methods ==============================================================

def menu_includes_item?(menu, item_to_make)
  unless menu.has_key?(item_to_make)
    raise ArgumentError.new("#{item_to_make} is not on the menu.")
  end
  return true
end


def calculate_order(menu, item, qty)

  portions = menu.values_at(item)[0]
  leftovers = qty % portions

  this_many = qty/portions
  this_many += 1 if leftovers != 0

  need_make =
      "\nYou need #{ qty } servings of #{ item }. " +
      "\nMake #{ this_many } #{ item }.\n"
  extra_servings =
      "You will have #{ menu[item] - leftovers } extra servings."

  return need_make if leftovers == 0
  return need_make + extra_servings

end


# Main Method =================================================================

def plan_inventory(menu, item_to_make, order_quantity)

  menu_includes_item?(menu, item_to_make)
  calculate_order(menu, item_to_make, order_quantity)

end


# Driver Code (Test Cases) ====================================================

entre_menu = { "spaghetti" => 12, "steak" => 1, "snapper" => 1 }
dessert_menu = {"cookie" => 1, "cake" =>  5, "pie" => 7, "broccoli" => 4}

puts plan_inventory(entre_menu, "spaghetti", 12)
puts plan_inventory(entre_menu, "steak", 15)
puts plan_inventory(entre_menu, "snapper", 8)
puts plan_inventory(dessert_menu, "pie", 7)
puts plan_inventory(dessert_menu, "pie", 8)
puts plan_inventory(dessert_menu, "pie", 18)
puts plan_inventory(dessert_menu, "cake", 5)
puts plan_inventory(dessert_menu, "cake", 7)
puts plan_inventory(dessert_menu, "cookie", 1)
puts plan_inventory(dessert_menu, "cookie", 10)
# puts serving_size_calc("THIS IS AN ERROR", 5)


=begin

# Reflection Questions ########################################################

#### What did you learn about making code readable by working on this
challenge?

Rather than teaching something "new" about writing readable code, I think this
challenge really brought home the importance of writing readable code by
forcing us to _read_ someone else's code that was, frankly, unfriendly and
non-intuitive. Without any comments or specifications, we were forced to
reverse-engineer not just the code's process, but also its purpose--we felt
like we were at best making an educated inference about what the program was
even intended to do. Even the name of the main method itself was counter-
intuitive; it was called "#serving_size_calculator", but what it actually
_did_ was calculate how many units of a given dessert you'd need to make to
fill an order for a certain number of servings. It didn't calculate the _size_
of a serving, or even the number of servings needed--it told you how many
batches of a given item you'd need to meet expected demands. That's why one
of our revisions was to change the main method name to #plan_inventory, on
the theory that it would be used by a bakery or restaurant to make sure that
they would have enough pies and cakes available to meet anticipated demand.
We changed most of the variable names throughout the program, to make them
both shorter and more intuitive.

We refactored the main method, #plan_inventory, to include just two lines,
each with a single method call to a custom method: #menu_has_item? and
#calculate_order. #menu_has_item was a much-refactored version of the
original codes inelegant check to see if the requested item was even on the
menu, and raised an error if an item _not_ on the menu was requested.
#calculate_order took in the specified menu, and the type of food ordered,
and the number of servings per unit prepared, to calculate how many units
the kitchen would need to have ready to meet anticipated demand. Not
surprisingly, #calculate_order consists largely of a series of calculations,
followed by the code to print the results to the screen.

The other important revision in our refactor was to pull the hash--which we
renamed "menu"--out of the main method, and made it an argument to be passed
with the call to the main menu. This allows the code to work with more than
a single menu, and makes it so that the menu can be changed without having to
do surgery within the application code. As proof of concept, we named the
existing hash the "dessert_menu", and created an "entre_menu" that includes
a list of main dishes. These two menus are both successfully referenced in
the revised driver code that tests our version of the program. If this app
were being further developed, a logical next step would be to further pull
the menus out to separate files, and create methods that would allow those
menus to be modified through a friendly user interface.


#### Did you learn any new methods? What did you learn about them?

The two new-to-me methods in this challenge are #has_key? and #values_at.
Both are hash methods that allow you to check or retrieve information inside
hashes. #values_at was already included in the legacy code, but we added
#has_key?, which allowed us to eliminate the awkward and inflexible #each
call that iterated over the loop to check if the requested item was on the
menu. As originally implemented, any change to the length of the menu hash
would have to be accompanied by a manual adjustment of the error_counter
variable, or else the code that checked for non-existant menu items would
break. By switching to a solution based on #has_key?, we reduced a dozen
lines of difficult-to-follow code to about three lines whose purpose was
readily apparent.


#### What did you learn about accessing data in hashes?

The challenge gave us more practice in accessing hash data using bracket
notation as well as using specialized hash methods.


#### What concepts were solidified when working through this challenge?

This challenge was about taking bad, old code, and making it cleaner, clearer,
and more concise. We accomplished this by refactoring the code to utilize
more appropriate and specialized methods, pulling out discreet functions
from the main method into separate helper methods, and revising the variable
names to make them shorter and more appropriate to their function.

=end