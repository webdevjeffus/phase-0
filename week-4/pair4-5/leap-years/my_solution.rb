# I worked on this challenge with Max Iniguez.


# Your Solution Below

def leap_year?(year)

  if year % 400 == 0
    puts "is leap year"
    return true
  end

  if year % 100 == 0
    puts "is not a leap year"
    return false
  end

  if year % 4 == 0
    puts "is a leap year"
    return true
  else
    puts "is not a leap year"
    return false
  end

end