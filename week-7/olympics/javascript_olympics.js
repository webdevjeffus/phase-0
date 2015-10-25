// JavaScript Olympics

// I paired with Marie-France Han on this challenge.

// This challenge took me [#] hours.


// Release 0 - Warm Up (File/Repo Prep)

// Release 1 - Bulk Up

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
    athletes[i].win = "won";
    console.log(athletes[i].name + " " + athletes[i].win + " the " + athletes[i].event + "!");
  }
}

/*
console.log(athletes);
console.log("================================================")
win(athletes);
console.log("================================================")
console.log(athletes);
*/


// Jumble your words

function reverseStr(string) {
  var array = string.split("");
  return array = array.reverse().join("");
}

/* Driver code
var str = "Banana";
console.log(reverseStr(str));

var jumbleStr = "!sdrow ruoy elbmuJ"
console.log(reverseStr(jumbleStr));
*/

// 2,4,6,8

function appreciate(array) {
  var output = [];
  for (var i = 0; i < array.length; i++) {
    if (array[i]% 2 === 0) {
      output.push(array[i]);
    }
  }
  return output;
}

/* Driver code:
console.log(appreciate([4,7,8,9,3,2.13,46,54]));
*/


// "We built this city"

var Athlete = function(name, age, sport, quote) {
  this.name = name;
  this.age = age;
  this.sport = sport;
  this.quote = quote;
}


// Driver Code
var michaelPhelps = new Athlete("Michael Phelps", 29, "swimming", "It's medicinal I swear!");
console.log(michaelPhelps.constructor === Athlete);
console.log(michaelPhelps.name + " " + michaelPhelps.sport + " " + michaelPhelps.quote);

var alexanderPopov = new Athlete("Alexander Popov", 30, "swimming", "I'm the torpedo!");
console.log(alexanderPopov.constructor === Athlete);
console.log(alexanderPopov.name + " " + alexanderPopov.sport + " " + alexanderPopov.quote);


// Reflection