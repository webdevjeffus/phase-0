# 1) Jeremy Powell
# 2) Jeff George

# We spent 3 hours on this challenge.

# Restaurant Inventory Planner.

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


