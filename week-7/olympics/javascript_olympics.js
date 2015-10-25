// Pair Challenge 7.6: JavaScript Olympics
// by Jeff George, 10/25/2015
// for DBC Phase 0

// I paired with Marie-France Han on this challenge.
// We worked together for about 2 hours, and I spent another hour following up.


/* Release 0 - Warm Up (File/Repo Prep) **************************************/

/* Release 1 - Bulk Up *******************************************************/

var sarahHughes = { name: "Sarah Hughes", event: "Ladies' Singles" };
var michelleKwan = { name: "Michelle Kwan", event: "Ladies' Singles" };
var yevgeniPlushenko = { name: "Yevgeni Plushenko", event: "Men's Singles" };
var paulWylie = { name: "Paul Wylie", event: "Men's Singles" };

var athletes = new Array(
  sarahHughes,
  michelleKwan,
  yevgeniPlushenko,
  paulWylie
);

function win(athletes) {
  for( var i = 0; i < athletes.length; i++) {
    athletes[i].win = function() {
      console.log(this.name + " won the " + this.event + "!");
    }
  }
}

console.log("\nRelease 1 ________________________________________________________");
console.log(athletes);
console.log("------------------------------------------------------------------");
win(athletes);
console.log(athletes);
console.log("------------------------------------------------------------------");
athletes[0].win();
console.log("==================================================================");


/* Release 2 - Jumble your words *********************************************/

function reverseStr(string) {
  var array = string.split("");
  return array = array.reverse().join("");
}

/* Driver code */
console.log("\nRelease 2 ________________________________________________________");
var str = "Banana";
console.log(reverseStr(str));
console.log("------------------------------------------------------------------");
var jumbleStr = "!sdrow ruoy elbmuJ"
console.log(reverseStr(jumbleStr));
console.log("==================================================================");


/* Release 3 - 2,4,6,8 *******************************************************/

function appreciate(array) {
  var output = [];
  for (var i = 0; i < array.length; i++) {
    if (array[i]% 2 === 0) {
      output.push(array[i]);
    }
  }
  return output;
}

/* Driver code: */
console.log("\nRelease 3 ________________________________________________________");
console.log(appreciate([4,7,8,9,3,2.13,46,54]));
console.log("==================================================================");



/* Release 4 - "We built this city" ******************************************/

var Athlete = function(name, age, sport, quote) {
  this.name = name;
  this.age = age;
  this.sport = sport;
  this.quote = quote;
}

/* Driver code: */
console.log("\nRelease 4 ________________________________________________________");
var michaelPhelps = new Athlete("Michael Phelps", 29, "swimming", "It's medicinal, I swear!");
console.log(michaelPhelps.constructor === Athlete);
console.log(michaelPhelps.name + " " + michaelPhelps.sport + " " + michaelPhelps.quote);
console.log("------------------------------------------------------------------");
var alexanderPopov = new Athlete("Alexander Popov", 30, "swimming", "I'm the Torpedo!");
console.log(alexanderPopov.constructor === Athlete);
console.log(alexanderPopov.name + " " + alexanderPopov.sport + " " + alexanderPopov.quote);
console.log("==================================================================");


/******************************** Reflection **********************************\

What JavaScript knowledge did you solidify in this challenge?

In general, this challenge improved my understanding of defining functions in
JavaScript, especially constructor functions.


What are constructor functions?

Constructor functions are special functions that can be used to conveniently
create instances of a given type of object. Once you've created a constructor
function, you can create instances of that object type with the simple "var/new"
syntax, in which the values of the properties for the new object are passed into
the constructor function as arguments.


How are constructors different from Ruby classes (in your research)?

Constructors in JS are written as functions, while classes are objects of the
class Class. This appears make a major difference in terms of inheritance--in
Ruby, classes and their instances can inherit methods from their
super-classes; in JavaScript, the concepts of class and super-class don't seem
to exist. If you want a JavaScript constructor to pass functionality to its
instances, I believe you have to code it into the constructor explicitly.

\*******************************************************************************/