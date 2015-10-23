/* Design Basic Game Solo Challenge

This is a solo challenge

Your mission description:
Overall mission: Play Rock-Paper-Scissors
Goals: Win best 3-out-of-5 rounds of RPS
Characters: Player, Opponent
Objects: Game, Player, Opponent
Functions:

Pseudocode:
Objects:
  PLAYER
    player's move
    player's score

  OPPONENT
    opponent's move
    opponent's score

Functions:
  Get player's move
  Choose opponent's move
  Resolve turn
  Check for winner

*/


/* Initial Code
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

// Refactored Code
//window.onload = function() {

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
  moves: ["R", "P", "S"],
  move: "?",
  score: 0
};

function getPlayerMove() {
  var move = prompt("Enter (R)ock, (P)aper, or (S)cissors:");
  player.move = move.toUpperCase();
}

function getOppoMove() {
  oppo.move = oppo.moves[Math.floor(Math.random() * 3)];
  alert("You picked " + player.move + ". Your opponent picked " + oppo.move + ".");
}

function resolveTurn() {
  document.getElementById("playerMove").innerHTML = player.move;
  document.getElementById("oppoMove").innerHTML = oppo.move;

  if ( player.move === oppo.move ) {
    document.getElementById("playByPlay").innerHTML =
      ( "Both players chose " + player.move + ".");
    document.getElementById("turnScore").innerHTML =
      ( game.drawRound );
  }

  else {
    if ( player.move === "R" ) {
      if ( oppo.move === "P" ) {
        document.getElementById("playByPlay").innerHTML =
          ( game.paperRock );
        document.getElementById("turnScore").innerHTML =
          ( game.loseRound );
        document.getElementsByClassName("oppoPt")[oppo.score].setAttribute("style", "background-color: red; border: 2px darkred solid;");
        oppo.score++;
      }
      else { // oppo.move === "S"
        document.getElementById("playByPlay").innerHTML =
          ( game.rockScissors );
        document.getElementById("turnScore").innerHTML =
          ( game.winRound );
        document.getElementsByClassName("playerPt")[player.score].setAttribute("style", "background-color: green; border: 2px darkgreen solid;");
        player.score++;
      }
    }
    else if ( player.move === "P" ) {
      if ( oppo.move === "S" ) {
        document.getElementById("playByPlay").innerHTML =
          ( game.scissorsPaper );
        document.getElementById("turnScore").innerHTML =
          ( game.loseRound );
        document.getElementsByClassName("oppoPt")[oppo.score].setAttribute("style", "background-color: red; border: 2px darkred solid;");
        oppo.score++;
      }
      else { // oppo.move === "R"
        document.getElementById("playByPlay").innerHTML =
          ( game.paperRock);
        document.getElementById("turnScore").innerHTML =
          ( game.winRound );
        document.getElementsByClassName("playerPt")[player.score].setAttribute("style", "background-color: green; border: 2px darkgreen solid;");
        player.score++;
      }
    }
    else { // player.move === "S"
      if ( oppo.move === "R" ) {
        document.getElementById("playByPlay").innerHTML =
          ( game.rockScissors );
        document.getElementById("turnScore").innerHTML =
          ( game.loseRound );
        document.getElementsByClassName("oppoPt")[oppo.score].setAttribute("style", "background-color: red; border: 2px darkred solid;");
        oppo.score++;
      }
      else {// oppo.move === "P"
        document.getElementById("playByPlay").innerHTML =
          ( game.scissorsPaper )
        document.getElementById("turnScore").innerHTML =
          ( game.winRound );
        document.getElementsByClassName("playerPt")[player.score].setAttribute("style", "background-color: green; border: 2px darkgreen solid;");
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
}

if (player.score === 3) {
  alert(game.winGame);
}
else {
  alert(game.loseGame);
}

//} // Closes "window.onload" function; DNR



// Reflection
//
//
//
//
//
//
//
//