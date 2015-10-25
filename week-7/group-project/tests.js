// Add the finished solution here when you receive it.

//Refactor

function sum(integer_array) {
  var total = 0;
  for (var i = 0; i < integer_array.length; total += integer_array[i++]);
  console.log(total);
}

var array = [4,5,6,7,8,9];
console.log(sum(array));

/*
SUM
As a user, I want to input a list of numbers and have the program output their sum by
printing the result to the console.
*/


//Refactor
function mean(integer_array) {
  var length = integer_array.length
  var total = sum(integer_array);
  return total/length;
 }

var array = [4,5,6,7,8,9];
console.log(mean(array));

/*
MEAN
As a user, I want to input a list of numbers, and have them added together and divided
by the number of items in the list, giving me the average, and printing the result to the console.
*/


function median(integer_array) {
  var arr_length = integer_array.length
  if (integer_array % 2 === 0){
    var middle_two = [];
    middle_two.push(arr_length / 2 - 1);
    return mean(middle_two);
    }
 else {
  var middle_index = (arr_length - 1) / 2;
    return integer_array[middle_index];
  }
}

var array = [4,5,6,7,8];
console.log(median(array));

//Refactor

/*
MEDIAN
As a user, I want to input a list of numbers. If that list of numbers contains an odd amount of numbers,
I want the program to output the number in the middle of the list. If the list contains an even
amount of numbers, I want the program to output the sum of the two numbers in the middle of the list,
divided by two.
*/



// __________________________________________
// Tests:  Do not alter code below this line.


oddLengthArray  = [1, 2, 3, 4, 5, 5, 7]
evenLengthArray = [4, 4, 5, 5, 6, 6, 6, 7]


function assert(test, message, test_number) {
  if (!test) {
    console.log(test_number + "false");
    throw "ERROR: " + message;
  }
  console.log(test_number + "true");
  return true;
}

// tests for sum
assert(
  (sum instanceof Function),
  "sum should be a Function.",
  "1. "
)

assert(
  sum(oddLengthArray) === 27,
  "sum should return the sum of all elements in an array with an odd length.",
  "2. "
)

assert(
  sum(evenLengthArray) === 43,
  "sum should return the sum of all elements in an array with an even length.",
  "3. "
)

// tests for mean
assert(
  (mean instanceof Function),
  "mean should be a Function.",
  "4. "
)

assert(
  mean(oddLengthArray) === 3.857142857142857,
  "mean should return the average of all elements in an array with an odd length.",
  "5. "
)

assert(
  mean(evenLengthArray) === 5.375,
  "mean should return the average of all elements in an array with an even length.",
  "6. "
)

// tests for median
assert(
  (median instanceof Function),
  "median should be a Function.",
  "7. "
)

assert(
  median(oddLengthArray) === 4,
  "median should return the median value of all elements in an array with an odd length.",
  "8. "
)

assert(
  median(evenLengthArray) === 5.5,
  "median should return the median value of all elements in an array with an even length.",
  "9. "
)