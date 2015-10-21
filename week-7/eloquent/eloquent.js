// Eloquent JavaScript

// Run this file in your terminal using `node my_solution.js`. Make sure it
// works before moving on!

// Program Structure ----------------------------------------------------------
// Write your own variable and do something to it.

var num1 = 5;
num1 * 4;


// Simple Program

var favFood = prompt("What's your favorite food?", "");
alert("Hey, " + favFood.toLowerCase() + " is my favorite food, too!");


// Complete one of the exercises:
// Looping a Triangle, FizzBuzz, or Chess Board -------------------------------

// Looping a Triangle
triangle_string = "";
for ( var i = 0; i < 7; i++) {
  triangle_string += "#";
  console.log(triangle_string);
}

// Chess Board
even_row = "##  ##  ##  ##  ";
odd_row = "  ##  ##  ##  ##";
for (var i = 0; i < 8; i++) {
  if (i % 2 === 0) {
    console.log(even_row);
  }
  else {
    console.log(odd_row);
  }
}

// FizzBuzz
for (var i = 1; i <= 25; i++ ) {
  if ( i % 3 == 0 && i % 5 == 0 ) { console.log("FizzBuzz") }
  else if ( i % 3 == 0) { console.log("Fizz"); }
  else if ( i % 5 == 0) { console.log("Buzz"); }
  else console.log(i);
}


// Functions ==================================================================

// Complete the `minimum` exercise.



// Data Structures: Objects and Arrays
// Create an object called "me" that stores your name, age, 3 favorite foods, and a quirk below.