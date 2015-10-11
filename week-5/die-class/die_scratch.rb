class Die

  def initialize(num_sides)
    if num_sides < 1 || !num_sides.is_a?(Integer)
      raise ArgumentError, "You asked for a die with #{num_sides} sides. The number of sides on a die must be a positive integer."
    end
    @num_sides = num_sides
  end

  def sides
    @num_sides
  end

  def roll
    rand(@num_sides) + 1
  end

end



# d6 = Die.new(6)
# p d6.sides
# p "--------------------"
# 20.times do p d6.roll end
# p "--------------------"
# d0 = Die.new(0)
# p d0.sides

die_sides = rand(100)
p "Intended number of sides: " + die_sides.to_s

die = Die.new(die_sides)
p die.sides



