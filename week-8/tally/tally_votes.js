/************** PAIR CHALLENGE 8.3:  Tally Votes in JavaScript ***************\
by Jeff George, 10/28/15, for Dev Bootcamp, Phase 0

I worked on this challenge with Peter Wiebe.
We worked together to find our solutions for 1.25 hours. I continued to work on
my own for another 1.75 hours, to search for alternative functions or methods,
and to carefully comment our code to strengthen my own understanding of our
solution.


/* Challenge Variables *******************************************************/

// These are the votes cast by each student. Do not alter these objects here.
var votes = {
  "Alex": { president: "Bob", vicePresident: "Devin", secretary: "Gail", treasurer: "Kerry" },
  "Bob": { president: "Mary", vicePresident: "Hermann", secretary: "Fred", treasurer: "Ivy" },
  "Cindy": { president: "Cindy", vicePresident: "Hermann", secretary: "Bob", treasurer: "Bob" },
  "Devin": { president: "Louise", vicePresident: "John", secretary: "Bob", treasurer: "Fred" },
  "Ernest": { president: "Fred", vicePresident: "Hermann", secretary: "Fred", treasurer: "Ivy" },
  "Fred": { president: "Louise", vicePresident: "Alex", secretary: "Ivy", treasurer: "Ivy" },
  "Gail": { president: "Fred", vicePresident: "Alex", secretary: "Ivy", treasurer: "Bob" },
  "Hermann": { president: "Ivy", vicePresident: "Kerry", secretary: "Fred", treasurer: "Ivy" },
  "Ivy": { president: "Louise", vicePresident: "Hermann", secretary: "Fred", treasurer: "Gail" },
  "John": { president: "Louise", vicePresident: "Hermann", secretary: "Fred", treasurer: "Kerry" },
  "Kerry": { president: "Fred", vicePresident: "Mary", secretary: "Fred", treasurer: "Ivy" },
  "Louise": { president: "Nate", vicePresident: "Alex", secretary: "Mary", treasurer: "Ivy" },
  "Mary": { president: "Louise", vicePresident: "Oscar", secretary: "Nate", treasurer: "Ivy" },
  "Nate": { president: "Oscar", vicePresident: "Hermann", secretary: "Fred", treasurer: "Tracy" },
  "Oscar": { president: "Paulina", vicePresident: "Nate", secretary: "Fred", treasurer: "Ivy" },
  "Paulina": { president: "Louise", vicePresident: "Bob", secretary: "Devin", treasurer: "Ivy" },
  "Quintin": { president: "Fred", vicePresident: "Hermann", secretary: "Fred", treasurer: "Bob" },
  "Romanda": { president: "Louise", vicePresident: "Steve", secretary: "Fred", treasurer: "Ivy" },
  "Steve": { president: "Tracy", vicePresident: "Kerry", secretary: "Oscar", treasurer: "Xavier" },
  "Tracy": { president: "Louise", vicePresident: "Hermann", secretary: "Fred", treasurer: "Ivy" },
  "Ullyses": { president: "Louise", vicePresident: "Hermann", secretary: "Ivy", treasurer: "Bob" },
  "Valorie": { president: "Wesley", vicePresident: "Bob", secretary: "Alex", treasurer: "Ivy" },
  "Wesley": { president: "Bob", vicePresident: "Yvonne", secretary: "Valorie", treasurer: "Ivy" },
  "Xavier": { president: "Steve", vicePresident: "Hermann", secretary: "Fred", treasurer: "Ivy" },
  "Yvonne": { president: "Bob", vicePresident: "Zane", secretary: "Fred", treasurer: "Hermann" },
  "Zane": { president: "Louise", vicePresident: "Hermann", secretary: "Fred", treasurer: "Mary" }
}

// Tally the votes in voteCount.
var voteCount = {
  president: {},
  vicePresident: {},
  secretary: {},
  treasurer: {}
}

/* The name of each student receiving a vote for an office should become a property
of the respective office in voteCount.  After Alex's votes have been tallied,
voteCount would be ...
  var voteCount = {
    president: { Bob: 1 },
    vicePresident: { Devin: 1 },
    secretary: { Gail: 1 },
    treasurer: { Kerry: 1 }
  }
*/


/* Once the votes have been tallied, assign each officer position the name of the
student who received the most votes. */
var officers = {
  president: undefined,
  vicePresident: undefined,
  secretary: undefined,
  treasurer: undefined
}

/* Pseudocode ****************************************************************\

// FOR every voter IN votes
//   FOR every office IN which a vote was cast
//     ADD one to tally for candidate voted for

// FOR every office IN voteCount
//   FOR every candidate IN every office
//     IDENTIFY candidate with max votes


/* Initial Solution **********************************************************\

// TALLY THE VOTES
// For each voter in votes
for (var voter in votes) {

  // For each office for which each voter cast a vote
  for (var office in votes[voter]) {

    // If candidate who received the voter's vote has not already gotten a vote...
    if (voteCount[ office ][ votes[voter][office] ] === undefined) {
      // Initialize his vote count for the office to 0
      voteCount[office][votes[voter][office]] = 0;
    }

    // Add one to the voteCount for the office for the candidate who got the vote
    voteCount[office][votes[voter][office]] += 1 ;
  }
}

// DETERMINE THE WINNERS
// For each office in the voteCount
for (var office in voteCount) {

  // For each candidate for the office
  for (var candidate in voteCount[office]) {

    // If no leader has been determined...
    if (officers[office] === undefined) {
      // Set the leader to the first candidate to recieve a vote
      officers[office] = candidate;
    }

    // If the leader has fewer votes than the next candidate...
    if (voteCount[office][officers[office]] < voteCount[office][candidate]) {
      // Replace the leader with the next candidate (who becomes the new leader)
      officers[office] = candidate;
    }
  }
}


/* Refactored Solution *******************************************************/


for (var voter in votes) {
  for (var office in votes[voter]) {
    if (voteCount[office][votes[voter][office]] === undefined) {
      voteCount[office][votes[voter][office]] = 0;
    }
    voteCount[office][votes[voter][office]] += 1 ;
  }
}

for (var office in voteCount) {
  for (var candidate in voteCount[office]) {
    if (officers[office] === undefined) {
      officers[office] = candidate;
    }
    if (voteCount[office][officers[office]] < voteCount[office][candidate]) {
      officers[office] = candidate;
    }
  }
}

console.log(voteCount);

/* Reflection ****************************************************************\

What did you learn about iterating over nested objects in JavaScript? _________

I learned how to use the for-in loop to iterate over nested objects. The
trickiest part of this is keeping track of exactly what is going to be returned
by your expressions (things like voteCount[office][officers]); Peter was much
more experienced at this, and I learned quite a bit from him during this
challenge.


Were you able to find useful methods to help you with this? ___________________

If there are methods that would streamline or abstract away what we did with
for-in, we didn't find them. I spent more time after our session combing
through MDN, and didn't find anything that looked like it would replace our
for-in loops.

Aside from the for-in loops, all we did was check conditional expressions with
if-statements, and set the values of variables accordingly, so there really
was no call for other methods in this challenge, unless we really missed the
boat on something.


What concepts were solidified in the process of working through this
challenge? ____________________________________________________________________

As I mentioned before, the thing that I took away from this challenge was the
general practice of iterating over nested objects. The iteration itself isn't
that complicated; the hard part is in keeping straight the values that your
pointer expressions are pointing at. To help myself understand what we did
better, I refactored our first for-in loop here, replacing the contextual
variable names with names that reflect the relationships between the objects.
The logic of the loop is unchanged, but the new variable names help me to
understand its structure.

for (var innerObj in outerObj) {
  for (var innerObjKey in outerObj[innerObj]) {
    if ( otherObj[ innerObjKey ][ outerObj[ innerObj ][ innerObjKey ] ] === undefined ) {
      otherObj[ innerObjKey ][ outerObj[ innerObj ][ innerObjKey ] ] = 0;
    }
    otherObj[ innerObjKey ][ outerObj[ innerObj ][ innerObjKey ] ] += 1 ;
  }
}

To help myself understand our code better, I went back after our pair session
and commented our initial solution line by line. In production code, this level
of commenting would be overkill, but it helped me to be sure I knew why our
code worked. The only difference between our initial solution and our
refactored one is that the refactored solution doesn't contain any comments.


/* Test Code:  Do not alter code below this line. ****************************/


function assert(test, message, test_number) {
  if (!test) {
    console.log(test_number + "false");
    throw "ERROR: " + message;
  }
  console.log(test_number + "true");
  return true;
}

assert(
  (voteCount.president["Bob"] === 3),
  "Bob should receive three votes for President.",
  "1. "
)

assert(
  (voteCount.vicePresident["Bob"] === 2),
  "Bob should receive two votes for Vice President.",
  "2. "
)

assert(
  (voteCount.secretary["Bob"] === 2),
  "Bob should receive two votes for Secretary.",
  "3. "
)

assert(
  (voteCount.treasurer["Bob"] === 4),
  "Bob should receive four votes for Treasurer.",
  "4. "
)

assert(
  (officers.president === "Louise"),
  "Louise should be elected President.",
  "5. "
)

assert(
  (officers.vicePresident === "Hermann"),
  "Hermann should be elected Vice President.",
  "6. "
)

assert(
  (officers.secretary === "Fred"),
  "Fred should be elected Secretary.",
  "7. "
)

assert(
  (officers.treasurer === "Ivy"),
  "Ivy should be elected Treasurer.",
  "8. "
)