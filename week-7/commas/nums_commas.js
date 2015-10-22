// Separate Numbers with Commas in JavaScript **Pairing Challenge**
// Submitted by Jeff George, 10/22/15

// I worked on this challenge with Danielle Cameron.

/******************************* PSEUDOCODE **********************************\

Input: An integer
Output: That integer expressed as a string with commas in appropriate spots

Steps:
CONVERT integer to string
SPLIT string into array of single chars
REVERSE array
FOR loop
  SPLICE commas into array after every third char
JOIN array into a single string
REVERSE string
RETURN string


/****************************** INITIAL SOLUTION *****************************/

function separateComma(integer){
  var numbers = integer.toString().split("");
  var reverseNum = numbers.reverse();

  for(var counter = 3; counter < reverseNum.length ; counter += 4){
    reverseNum.splice(counter,0,",");
  };

  var output = reverseNum.reverse().join("");
  return output;
};


/**************************** REFACTORED SOLUTION ****************************/

// Refactored solution uses the same logic, but streamlines code by using one
// variable, number, throughout.

function separateComma(integer){
  var number = integer.toString().split("").reverse();

  for(var counter = 3; counter < number.length ; counter += 4) {
    number.splice(counter,0,",");
  };

  return number.reverse().join("");
};


/******************************** DRIVER CODE ********************************/

console.log(separateComma(1));
console.log(separateComma(12));
console.log(separateComma(123));
console.log(separateComma(1234));
console.log(separateComma(12345));
console.log(separateComma(123456));
console.log(separateComma(1234567));
console.log(separateComma(12345678));
console.log(separateComma(123456789));
console.log(separateComma(123456789123456789));


/******************************** REFLECTIONS ********************************\

What was it like to approach the problem from the perspective of JavaScript?
Did you approach the problem differently?

I think the biggest difference was that we'd each solved the problem previously
in another language. We started by comparing what we remembered of our solution
algorithm from the previous challenge, chose a direction to pursue, and began
to write language-agnostic pseudocode. After that, we set about coding from the pseudocode, where our biggest challenge was figuring out how to accomplish tasks
in JavaScript that we already knew how to do in Ruby. We wound up doing a fair
amount of reference-checking in mid-session (it was too rushed to realistically
call it "research").


What did you learn about iterating over arrays in JavaScript?

JavaScript doesn't provide the wide array of specialized iteration methods that
Ruby offers, so you have to write the exact iteration you need for the task at
hand using while or for loops. Because of this, it's not always possible to
write "one line" solutions in JavaScript, the way that you can in Ruby.


What was different about solving this problem in JavaScript?

Aside from slight variations in syntax, the main challenge in solving this
problem was finding and learning to use the correct function--splice()--to handle
inserting the commas at the right spots. My partner had used Ruby's #insert
method in her Ruby solution; I believe I had used #slice to chop off three-
character sections before attaching commas instead. We spent some time trying
to write a slice-based solution, mostly because of we found the JS equivalent
of Ruby's #slice very quickly (it's named slice()!), but that approach was
returning three-character arrays that we had to concatenate and convert back
to strings, which was proving prohibitively complicated. When we decided to
try an #insert-type approach, we found and figured out how to use JS's splice()
function, which turned out to be perfect for the job.


What built-in methods did you find to incorporate in your refactored solution?

Our solution used the following methods:

* toString() - equivalent to Ruby's #to_s method
* split("") - splits a string into an array; when given an empty string as
      an argument, it returns an array of single characters
* reverse() - reverses the order of the elements in an array
* splice() - in our usage, splice() inserts the comma at specified indexed
      positions in the array
* join("") - joins the elements of an array into a single string; when passed
      an empty string as the argument, it joins the elements directly, with
      no separator.


\******************************** END OF FILE ********************************/