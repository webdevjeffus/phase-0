 // Manipulating JavaScript Objects

// I worked on this challenge by myself.

// There is a section below where you will write your code.

// DO NOT ALTER THIS OBJECT BY ADDING ANYTHING WITHIN THE CURLY BRACES!
var terah = {
  name: "Terah",
  age: 32,
  height: 66,
  weight: 130,
  hairColor: "brown",
  eyeColor: "brown"
}
// __________________________________________
// Write your code below.

var adam = {
  name: "Adam",
};

var carson = {
  name: "Carson",
};

var carter = {
  name: "Carter",
};

var colson = {
  name: "Colson",
};

var colton = {
  name: "Colton",
};


terah.spouse = adam;
terah.weight = 125;
delete terah.eyeColor;

adam.spouse = terah;

terah.children = {};
terah.children.carson = carson;
terah.children.carter = carter;
terah.children.colson = colson;
terah.children.colton = colton;

adam.children = terah.children;



/* ========================================================================= *\

REFLECTION

What tests did you have trouble passing? What did you do to make it pass?
Why did that work?

I had a little trouble figuring out the proper syntax for adding the first
child, carson, to the children object inside the terah object. After trying
a couple of different things which didn't work, I just googled for "add
property to javascript object", which led to a W3Schools page which reminded
me of what I already knew--that I the syntax was object.newKey = value. I
stopped at that point think about how to name the children object within the
terah object, and realized that I simply had to chain key names with dots to i
dentify the key within the nested object. Then I splapped myself on the
forehead, and typed in the proper line of code.


How difficult was it to add and delete properties outside of the object
itself?

Adding properties using obj.propName = value was trivial. Actually deleting
a property, as opposed to setting its value to null or 0, I couldn't guess
on my own; I googled and wound up at Mozilla Developer's Network, where I
read how to use the delete property.


What did you learn about manipulating objects in this challenge?

My two main takeaways from this challenge were the ones mentioned above--how
to add a property to an object nested inside another object (or array, for
that matter), and how to delete a property entirely from an object.


\* ========================================================================= */

// Driver Code:  Do not alter code below this line.
function assert(test, message, test_number) {
  if (!test) {
    console.log(test_number + "false");
    throw "ERROR: " + message;
  }
  console.log(test_number + "true");
  return true;
}

assert(
  (adam instanceof Object),
  "The value of adam should be an Object.",
  "1. "
)

assert(
  (adam.name === "Adam"),
  "The value of the adam name property should be 'Adam'.",
  "2. "
)

assert(
  terah.spouse === adam,
  "terah should have a spouse property with the value of the object adam.",
  "3. "
)

assert(
  terah.weight === 125,
  "The terah weight property should be 125.",
  "4. "
)

assert(
  terah.eyeColor === undefined || null,
  "The terah eyeColor property should be deleted.",
  "5. "
)

assert(
  terah.spouse.spouse === terah,
  "Terah's spouse's spouse property should refer back to the terah object.",
  "6. "
)

assert(
  (terah.children instanceof Object),
  "The value of the terah children property should be defined as an Object.",
  "7. "
)

assert(
  (terah.children.carson instanceof Object),
  "carson should be defined as an object and assigned as a child of Terah",
  "8. "
  )

assert(
  terah.children.carson.name === "Carson",
  "Terah's children should include an object called carson which has a name property equal to 'Carson'.",
  "9. "
)

assert(
  (terah.children.carter instanceof Object),
  "carter should be defined as an object and assigned as a child of Terah",
  "10. "
  )

assert(
  terah.children.carter.name === "Carter",
  "Terah's children should include an object called carter which has a name property equal to 'Carter'.",
  "11. "
)

assert(
  (terah.children.colton instanceof Object),
  "colton should be defined as an object and assigned as a child of Terah",
  "12. "
  )

assert(
  terah.children.colton.name === "Colton",
  "Terah's children should include an object called colton which has a name property equal to 'Colton'.",
  "13. "
)

assert(
  adam.children === terah.children,
  "The value of the adam children property should be equal to the value of the terah children property",
  "14. "
)

console.log("\nHere is your final terah object:")
console.log(terah)