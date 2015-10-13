# 1) Jeremy Powell
# 2) Jeff George

# We spent 3 hours on this challenge.

# Restaurant Inventory Planner.

=begin ORIGINAL CODE
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

# REFACTORED AND REVISED VERSION

def check_for_item(menu, item_to_make)
  unless menu.has_key?(item_to_make)
    raise ArgumentError.new("#{item_to_make} is not on the menu.")
  end
end

def calculate_order(menu, item, qty)

  portions = menu.values_at(item)[0]

  leftovers = qty % portions

  this_many = qty/portions
  this_many += 1 if leftovers != 0

  need_make = "\nYou need #{qty} servings of #{item}.\nMake #{this_many} #{item}.\n"
  extra_servings = "You will have #{ menu[item] - leftovers} extra servings."

  return need_make if leftovers == 0
  return need_make + extra_servings

end


def plan_inventory(menu, item_to_make, order_quantity)

  check_for_item(menu, item_to_make)

  calculate_order(menu, item_to_make, order_quantity)

end

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
# p serving_size_calc("THIS IS AN ERROR", 5)

#  Reflection

# Still to come
