Summary
You already completed a basic Die class from Die Class 1. In this challenge you will create a more exciting Die class that takes an array of strings as its input. When Die#roll is called, it randomly returns one of these strings. If Die.new is passed an empty array, it should raise an ArgumentError. It should work like this:

die = Die.new(['A', 'B', 'C', 'D', 'E', 'F'])
die.sides # still returns the number of sides, in this case 6
die.roll # returns one of ['A', 'B', 'C', 'D', 'E', 'F'], randomly
Just to reiterate, in the previous exercise you passed in a number of sides, sides, and the labels were assumed to be the integers 1..sides. Now you're passing in a list of arbitrary labels. You could use this to represent a Dreidel (Links to an external site.) or Boggle Dice (Links to an external site.), for example.