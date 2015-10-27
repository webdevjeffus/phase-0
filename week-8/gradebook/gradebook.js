/*
Ch. 8.2: Gradebook from Names and Scores
by Jeff George, 10/26/15
for DBC Phase 0


I worked on this challenge with Kevin Mark.

This challenge took us 1 hour to solve.
I worked an additional half hour on the reflection.


You will work with the following two variables.  The first, students, holds
the names of four students. The second, scores, holds groups of test scores.
The relative positions of elements within the two variables match (i.e.,
'Joseph' is the first element in students; his scores are the first value
in scores.).

Do not alter the students and scores code.
*/

var students = ["Joseph", "Susan", "William", "Elizabeth"];

var scores = [ [80, 70, 70, 100],
               [85, 80, 90, 90],
               [75, 70, 80, 75],
               [100, 90, 95, 85] ];

// __________________________________________
// Write your code below.

var average = function(array) {
  var total = 0;
  for(var i = 0; i < array.length; i++) {
    total += array[i];
  }
  return total / array.length;
}

var gradebook = {
  Joseph: { testScores: scores[0] },
  Susan: { testScores: scores[1] },
  William: { testScores: scores[2] },
  Elizabeth: { testScores: scores[3] },
  addScore: function(name, score) {
    this[name].testScores.push(score);
  },
  getAverage: function(name){
    return average(this[name].testScores);
  }
};

// Driver code:
// gradebook.addScore("Joseph", 50);
// console.log(gradebook.Joseph.testScores);

// __________________________________________
// Refactored Solution

function average(array) {
  return  array.reduce(function (a,b) { return a + b; }) / array.length;
}

var gradebook = {
  Joseph: { testScores: scores[0] },
  Susan: { testScores: scores[1] },
  William: { testScores: scores[2] },
  Elizabeth: { testScores: scores[3] },

  addScore: function(name, score) {
    this[name].testScores.push(score);
  },

  getAverage: function(name){
    return average(this[name].testScores);
  }
};


/* __________________________________________
// Reflect

What did you learn about adding functions to objects?

This challenge reinforced the concept that in JavaScript, functions are a type
of value, just like a string, number, array, or object, and as such, can be
included as the value of a property in an object. The name of a function that
is created as a property of an object is similar to the name for any other
property of the object, object.property(), and to invoke that function, it is
necessary to include both the halves of that name, object and property, in the
function call.


How did you iterate over nested arrays in JavaScript?

We were never called upon to iterate over a series of nested arrays, but we
did have to iterate over an inner array saved as a value in an object. In that
case, we had to pass the full name of the array into the average() function,
using the gradebook.getAverage() function. The syntax to accomplish this was
this[name].testScores, where "this" referred to the outer gradebook object,
"name" was the parameter of the getAverage function that specified the
student property of the gradebook object, and testScores was the property name
for the array containing the actual scores. That entire expression--
this[name].testScores--evaluated to the name of an array, which was passed into
the average() function, where it was iterated over by a for loop, using the
common array[i] syntax for loop iterations.


Were there any new methods you were able to incorporate?
If so, what were they and how did they work?

In the refactored solution, we were able to replace the entire for loop with
the built-in function, reduce(), which allowed us to use a simple function
to find the sum of the entire array. reduce() is an array function which takes
as its argument a function, which in turn takes as its arguments two values (
a previous value and a current value), and a block of code that is executed
upon the values in an array one at a time. In our usage, reduce() found the sum
of the values of the array by taking as its argument ( function(a,b) { return
a + b} ). In its first iteration, reduce() sets a equal to the first member of
of the array, and b equal to the second member, and then sets a equal to their
total. On it's second iteration, it takes the previous total, a, and adds to
it the third member of the array. On the third iteration, it adds the fourth
member of the set to the total stored in a, and so on, until the entire
array has been reduced to a single value.


// __________________________________________*/

// Test Code:  Do not alter code below this line.


function assert(test, message, test_number) {
  if (!test) {
    console.log(test_number + "false");
    throw "ERROR: " + message;
  }
  console.log(test_number + "true");
  return true;
}



assert(
  (gradebook instanceof Object),
  "The value of gradebook should be an Object.\n",
  "1. "
)

assert(
  (gradebook["Elizabeth"] instanceof Object),
  "gradebook's Elizabeth property should be an object.",
  "2. "
)

assert(
  (gradebook.William.testScores === scores[2]),
  "William's testScores should equal the third element in scores.",
  "3. "
)

assert(
  (gradebook.addScore instanceof Function),
  "The value of gradebook's addScore property should be a Function.",
  "4. "
)

gradebook.addScore("Susan", 80)

assert(
  (gradebook.Susan.testScores.length === 5
   && gradebook.Susan.testScores[4] === 80),
  "Susan's testScores should have a new score of 80 added to the end.",
  "5. "
)

assert(
  (gradebook.getAverage instanceof Function),
  "The value of gradebook's getAverage property should be a Function.",
  "6. "
)

assert(
  (average instanceof Function),
  "The value of average should be a Function.\n",
  "7. "
)
assert(
  average([1, 2, 3]) === 2,
  "average should return the average of the elements in the array argument.\n",
  "8. "
)

assert(
  (gradebook.getAverage("Joseph") === 80),
  "gradebook's getAverage should return 80 if passed 'Joseph'.",
  "9. "
)