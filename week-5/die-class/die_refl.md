In this challenge you'll want to implement a basic **Die** class which can be initialized with some number of sides. You can then roll the die, which will return a random number. It should work like this:

```
die = Die.new(6) #This creates a new die object with 6 sides
die.sides # returns 6
die.roll # returns a random number between 1 and 6
```

If we pass Die.new a number less than 1, we should raise an ArgumentError. This is done using the raise keyword. See the ArgumentError documentation (Links to an external site.) for how to do this.


def Die(num_sides)

  def INITIALIZE a new die object
    IF num_sides < 1
      RAISE argument error
    SET number of sides = num_sides
  end

  def SIDES
    RETURN num_sides
  end

  def ROLL
    RETURN random number in range 1 to num_sides
  end

end