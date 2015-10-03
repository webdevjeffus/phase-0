# Factorial

# I worked on this challenge Marie-France Han.


# Your Solution Below

def factorial(int)

  if int < 0
    # puts "int is < 0"
    return nil

  elsif int == 1 || int == 0
    # puts "int is 1 or 0"
    return 1

  else
    # puts "int is positive"
    total = int

    counter = int - 1

    while counter >= 1

      total *= counter

      counter -= 1

    end

  end

  return total

end
