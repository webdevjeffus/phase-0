# I worked on this challenge with Max Iniguez.


# Your Solution Below

def valid_triangle?(a, b, c)
  # Your code goes here!

  if a == 0 || b == 0 || c == 0
    puts "false"
    return false

  end

  if (a + b) > c && (b + c) > a && (a + c) > b
    puts "true"
    return true

  else
    puts "false"
    return false
  end


end

