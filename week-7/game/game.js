/* Challenge 7.7: Design a Basic Game
by Jeff George, 10/23/15
for DBC Phase 0

This is a solo challenge

Game description:
Overall mission: Play Rock-Paper-Scissors
Goals: Win best 3-out-of-5 rounds of RPS
Characters: Player, Opponent
Objects: Game, Player, Opponent
Functions:

Pseudocode:
Objects:
  GAME
    various game messages and data

  PLAYER
    player's move
    player's score

  OPPONENT
    opponent's move
    opponent's score

Functions:
  Get player's move
    Set player's move variable equal to user input
  Choose opponent's move
    Choose computer opponent's move randomly
  Resolve turn
    Report or display both moves
    Determine winner of round
      If both players chose same move, round is a draw
      If player chooses rock
        If opponent chooses paper, opponent wins
        Else player wins
      If player chooses paper
        If opponent chooses scissors, opponent wins
        Else player wins
      If player chooses scissors
        If opponent chooses rock, opponent wins
        Else player wins
    Increment score of winner of round
  Check for winner
    If player's score equals 3, player wins
    Else If opponent's score equals 3, opponent wins
    Else continue game

*/


/****************************** INITIAL VERSION ******************************\
\*      Open game.html to play; plays entirely through prompts and alerts.   *\

var game = {
  drawRound: " This round is a draw.",
  winRound: " You win this round.",
  loseRound: " You lose this round.",
  winGame: "Congratulations! You've won the game!",
  loseGame: "You've lost this game. Better luck next time!",
  rockScissors: "Rock breaks scissors.",
  scissorsPaper: "Scissors cut paper.",
  paperRock: "Paper covers rock.",
};

var player = {
  move: "?",
  score: 0,
};

var oppo = {
  moves: ["R", "P", "S"],
  move: "?",
  score: 0,
};

function getPlayerMove() {
  player.move = prompt("Enter (R)ock, (P)aper, or (S)cissors:");
  player.move = player.move.toUpperCase();
  alert("You picked " + player.move);
};

function getOppoMove() {
  oppo.move = oppo.moves[Math.floor(Math.random() * 3)];
  alert("Your opponent picked " + oppo.move);
}

function resolveTurn() {
  if ( player.move === oppo.move ) {
    alert( "Both players chose " + player.move + "."+ game.drawRound );
  }

  else {
    if ( player.move === "R" ) {
      if ( oppo.move === "P" ) {
        alert( game.paperRock + game.loseRound );
        oppo.score++;
      }
      else { // oppo.move === "S"
        alert( game.rockScissors + game.winRound );
        player.score++;
      }
    }
    else if ( player.move === "P" ) {
      if ( oppo.move === "S" ) {
        alert( game.scissorsPaper + game.loseRound );
        oppo.score++;
      }
      else { // oppo.move === "R"
        alert( game.paperRock + game.winRound );
        player.score++;
      }
    }
    else { // player.move === "S"
      if ( oppo.move === "R" ) {
        alert( game.rockScissors + game.loseRound );
        oppo.score++;
      }
      else {// oppo.move === "P"
        alert( game.scissorsRock + game.winRound );
        player.score++;
      }
    }
  }

  reportScore();
}

function reportScore() {
  alert("You have " + player.score + " points. Your opponent has " + oppo.score + " points.");
}

while (player.score < 3 && oppo.score < 3) {
  getPlayerMove();
  getOppoMove();
  resolveTurn();
  //reportScore();
}

if (player.score === 3) {
  alert(game.winGame);
}
else {
  alert(game.loseGame);
}
*/

/*************************** PLAYABLE APP VERSION ****************************\
\*     Open game.html to play; plays through interactive app in browser.     *\

"use strict";

var game = {
  drawRound: " This round is a draw.",
  winRound: " You win this round.",
  loseRound: " You lose this round.",
  winGame: "Congratulations! You've won the game!",
  loseGame: "You've lost this game. Better luck next time!",
  rockScissors: "Rock breaks scissors.",
  scissorsPaper: "Scissors cut paper.",
  paperRock: "Paper covers rock."
};

var player = {
  move: "?",
  score: 0
};

var oppo = {
  moves: ["rock", "paper", "scissors"],
  move: "?",
  score: 0
};

var playerMove = document.getElementById("playerMove");
var oppoMove = document.getElementById("oppoMove");
var playByPlay = document.getElementById("playByPlay");
var turnScore = document.getElementById("turnScore");
var playerPt = document.getElementsByClassName("playerPt");
var oppoPt = document.getElementsByClassName("oppoPt");

function getPlayerMove(move) {
  player.move = move;
  getOppoMove();
  resolveTurn();
  checkForWin();
}

function getOppoMove() {
  oppo.move = oppo.moves[ Math.floor(Math.random() * 3) ];
}

function resolveTurn() {
  switch (player.move) {
    case "rock":
      playerMove.innerHTML = "<i class='fa fa-hand-rock-o'></i>";
      break;
    case "paper":
      playerMove.innerHTML = "<i class='fa fa-hand-paper-o'></i>";
      break;
    default: // "scissors"
      playerMove.innerHTML = "<i class='fa fa-hand-scissors-o'></i>";
      break;
    }

    switch (oppo.move) {
    case "rock":
      oppoMove.innerHTML = "<i class='fa fa-hand-rock-o'></i>";
      break;
    case "paper":
      oppoMove.innerHTML = "<i class='fa fa-hand-paper-o'></i>";
      break;
    default: // "scissors"
      oppoMove.innerHTML = "<i class='fa fa-hand-scissors-o'></i>";
      break;
    }

  if ( player.move === oppo.move ) {
    playByPlay.innerHTML = ( "Both players chose " + player.move + ".");
    turnScore.innerHTML = ( game.drawRound );
  }

  else {
    if ( player.move === "rock" ) {
      if ( oppo.move === "paper" ) {
        playByPlay.innerHTML = ( game.paperRock );
        turnScore.innerHTML = ( game.loseRound );
        oppoPt[oppo.score].setAttribute(
          "style",
          "background-color: red; border: 2px darkred solid;"
        );
        oppo.score++;
      }
      else { // oppo.move === "scissors"
        playByPlay.innerHTML = ( game.rockScissors );
        turnScore.innerHTML = ( game.winRound );
        playerPt[player.score].setAttribute(
          "style",
          "background-color: green; border: 2px darkgreen solid;"
        );
        player.score++;
      }
    }
    else if ( player.move === "paper" ) {
      if ( oppo.move === "scissors" ) {
        playByPlay.innerHTML = ( game.scissorsPaper );
        turnScore.innerHTML = ( game.loseRound );
        oppoPt[oppo.score].setAttribute(
          "style",
          "background-color: red; border: 2px darkred solid;"
        );
        oppo.score++;
      }
      else { // oppo.move === "rock"
        playByPlay.innerHTML = ( game.paperRock);
        turnScore.innerHTML = ( game.winRound );
        playerPt[player.score].setAttribute(
          "style",
          "background-color: green; border: 2px darkgreen solid;"
        );
        player.score++;
      }
    }
    else { // player.move === "scissors"
      if ( oppo.move === "rock" ) {
        playByPlay.innerHTML = ( game.rockScissors );
        turnScore.innerHTML = ( game.loseRound );
        oppoPt[oppo.score].setAttribute(
          "style",
          "background-color: red; border: 2px darkred solid;"
        );
        oppo.score++;
      }
      else { // oppo.move === "paper"
        playByPlay.innerHTML = ( game.scissorsPaper );
        turnScore.innerHTML = ( game.winRound );
        playerPt[player.score].setAttribute(
          "style",
          "background-color: green; border: 2px darkgreen solid;"
        );
        player.score++;
      }
    }
  }
}

function checkForWin() {
  if (player.score === 3) { alert(game.winGame); }
  else if (oppo.score === 3) { alert(game.loseGame); }
  else { }
}


/******************* FULL-FEATURED APP, REFACTORED VERSION *******************\
\*     Open game.html to play; plays through interactive app in browser.     */

"use strict";

// GAME OBJECTS
var game = {
  tieRound: " This round is a draw.",
  winRound: " You win this round.",
  loseRound: " You lose this round.",
  winGameHead: "Congratulations!",
  loseGameHead: "You lost this game.",
  winGameMsg: "You&rsquo;ve won the game!",
  loseGameMsg: "Better luck next time!",
  rockScissors: "Rock breaks scissors.",
  scissorsPaper: "Scissors cut paper.",
  paperRock: "Paper covers rock."
};

var player = {
  move: "?",
  score: 0
};

var oppo = {
  moves: ["rock", "paper", "scissors"],
  move: "?",
  score: 0
};

// DOM HANDLES
var playerMove = document.getElementById("playerMove");
var oppoMove = document.getElementById("oppoMove");
var playByPlay = document.getElementById("playByPlay");
var turnScore = document.getElementById("turnScore");
var playerPt = document.getElementsByClassName("playerPt");
var oppoPt = document.getElementsByClassName("oppoPt");
var gameOverBox = document.getElementById("gameOverBox");
var gameOverHead = document.getElementById("gameOverHead");
var gameOverMsg = document.getElementById("gameOverMsg");

// GAME FUNCTIONS
function getPlayerMove(move) {
  player.move = move;
  getOppoMove();
  displayMoves();
  resolveTurn();
  checkForWin();
}

function getOppoMove() {
  oppo.move = oppo.moves[ Math.floor(Math.random() * 3) ];
}

function displayMoves() {
  switch (player.move) {
    case "rock":
      playerMove.innerHTML = "<i class='fa fa-hand-rock-o'></i>";
      break;
    case "paper":
      playerMove.innerHTML = "<i class='fa fa-hand-paper-o'></i>";
      break;
    default: // "scissors"
      playerMove.innerHTML = "<i class='fa fa-hand-scissors-o'></i>";
      break;
    }

  switch (oppo.move) {
    case "rock":
      oppoMove.innerHTML = "<i class='fa fa-hand-rock-o'></i>";
      break;
    case "paper":
      oppoMove.innerHTML = "<i class='fa fa-hand-paper-o'></i>";
      break;
    default: // "scissors"
      oppoMove.innerHTML = "<i class='fa fa-hand-scissors-o'></i>";
      break;
    }
}

function resolveTurn() {
  if ( player.move === oppo.move ) {
    playByPlay.innerHTML = ( "Both players chose " + player.move + ".");
    turnScore.innerHTML = ( game.tieRound );
  }

  else {
    switch (player.move) {
      case "rock":
        if ( oppo.move === "paper" ) {
          playByPlay.innerHTML = ( game.paperRock );
          incOppoScore();
        }
        else {
          playByPlay.innerHTML = ( game.rockScissors );
          incPlayerScore();
        }
        break;

      case "paper":
        if ( oppo.move === "scissors" ) {
          playByPlay.innerHTML = ( game.scissorsPaper );
          incOppoScore();
        }
        else {
          playByPlay.innerHTML = ( game.paperRock);
          incPlayerScore();
        }
        break;

      default: // "scissors"
        if ( oppo.move === "rock" ) {
          playByPlay.innerHTML = ( game.rockScissors );
          incOppoScore();
        }
        else {
          playByPlay.innerHTML = ( game.scissorsPaper );
          incPlayerScore();
        }
    }
  }
}

function incPlayerScore() {
  turnScore.innerHTML = ( game.winRound );
  playerPt[player.score].setAttribute( "style", "background-color: royalblue;" );
  player.score++;
}

function incOppoScore() {
  turnScore.innerHTML = ( game.loseRound );
  oppoPt[oppo.score].setAttribute( "style", "background-color: orange;" );
  oppo.score++;
}

function checkForWin() {
  if (player.score === 3) {
    gameOverBox.setAttribute(
      "style",
      "display: block; background-color: lightgreen; border-color: darkgreen;"
    );
    gameOverHead.innerHTML = game.winGameHead;
    gameOverMsg.innerHTML = game.winGameMsg;
  }
  else if (oppo.score === 3) {
    gameOverBox.setAttribute(
      "style",
      "display: block; background-color: rgb(256,164,164); border-color: rgb(128,0,0);"
    );
    gameOverHead.innerHTML = game.loseGameHead;
    gameOverMsg.innerHTML = game.loseGameMsg;
  }
}

function playAgain() {
  gameOverBox.setAttribute("style", "display: none;");
  playByPlay.innerHTML = "Playing again?";
  turnScore.innerHTML = "Choose your first move.";
  for (var i = 0; i < 3; i++) {
    playerPt[i].setAttribute("style", "background-color: #ccc;");
    oppoPt[i].setAttribute("style", "background-color: #ccc;");
  }
  playerMove.innerHTML = ("<i class='fa fa-question'></i>");
  oppoMove.innerHTML = ("<i class='fa fa-question'></i>");
  player.score = 0;
  oppo.score = 0;
}

/*************************** REFLECTION QUESTIONS ****************************\

What was the most difficult part of this challenge?

By far the most difficult part of this challenge was just figuring out how to
get started. I had originally intended to do at least a text-based MVP version
of the that could be played from the command line, using node.js the way we use
Ruby. Unfortunately, node.js doesn't seem to like taking user input; after at
least three or four hours of trying to get some version of readline to work, I
gave up and decided to try to make a dummy HTML page to call a JavaScript
script, and play the game using prompt() and alert(). It was while I was
working on this text-only pop-up-window version of the game that I realized
that it wouldn't be that much harder to do a simple html page that I could
manipulate with JS to run the game. I'd done a little bit of interactive web
page design with JavaScript for a web development class I took at Udemy a few
months ago, and just needed to refresh myself on how to use JavaScript to
change HTML elements.


What did you learn about creating objects and functions that interact with one
another?

I'd done this sort of thing in the past, a tiny bit, for that Udemy course,
and for a Python course I did in the spring, so the idea of objects and
functions weren't that new to me. Two things pertaining to objects and
functions that I did in the project that I hadn't done before were: 1. Using
an object and its properties to make it easy to retrieve and maintain game
messages that I was using in multiple places; and 2. Creating variables as
aliases or handles for the long functions used to to identify DOM elements
(e.g. var playerMove = document.getElementById("playerMove"); ), which saved
a lot of typing, and made the code easier to read.


Did you learn about any new built-in methods you could use in your refactored
solution? If so, what were they and how do they work?

There's really nothing very fancy happening in this game, algorithmically
speaking; there are no large arrays to iterate over, and no tricky mathematic
calculations. In the refactor, I did replace if/else if/else chains with
switch statements, which were clearer and slightly more concise. I also
pulled some of the code out of the incredibly long resolveTurn() function
into separate, smaller functions: displayMoves(), incPlayerScore(), and
incOppoScore(). displayMoves() could stand alone, so it's called from the
game's main event-driven function, getPlayerMove(), whereas incPlayerScore()
and incOppoScore() are both called from several possible cases in the switch
statements in resolveTurn(). Because they are called multiple times, the
score-incrementing functions eliminated many lines of repetitive code.

The methods that were new to me (or at least, "renewed" to me) were the ones
I needed to handle the DOM element manipulations that made it possible to
play the game in a semi-attractive web app. getElementById() and
getElementsByClassName() let me identify the precise elements that should be
affected by the code. innerHTML--which I infer is actually a property, rather
than a true function, since we use = with it instead of ()--lets you change
the content of the specified element, and I used it to swap out game icons
as well as game-text messages. setAttribute() lets add or alter the CSS
attributes applied to the specified element. I used it here to make the
Game Over box (which resets the game for replay) appear and disappear, and to
change the background color of a several divs to reflect the state of the
game.


How can you access and manipulate properties of objects?

In this program, I was able to access and manipulate object properties using
only dot notation ( object.property ); I never needed the extra flexibility
afforded by bracket notation ( object[property] ). In fact, the only place I
used brackets at all was to use the player's and opponeent's scores as
indexes to specify which element I meant to target with
getElementsByClassName(), in the incPlayerScore() and incOppoScore()
functions.

\******************************* END OF FILE *********************************/
