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


/************************ FULL-FEATURED APP VERSION **************************\
\*     Open game.html to play; plays through interactive app in browser.     */

"use strict";

// GAME OBJECTS
var game = {
  drawRound: " This round is a draw.",
  winRound: " You win this round.",
  loseRound: " You lose this round.",
  winGameHead: "Congratulations!",
  loseGameHead: "You&rsquo;ve lost this game.",
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
  // IF both players chose same move
  if ( player.move === oppo.move ) {
    playByPlay.innerHTML = ( "Both players chose " + player.move + ".");
    turnScore.innerHTML = ( game.drawRound );
  }

  // ELSE players chose different moves
  else {
    if ( player.move === "rock" ) {
      if ( oppo.move === "paper" ) {
        playByPlay.innerHTML = ( game.paperRock );
        turnScore.innerHTML = ( game.loseRound );
        oppoPt[oppo.score].setAttribute(
          "style",
          "background-color: red;"// border: 3px darkred solid;"
        );
        oppo.score++;
      }
      else { // oppo.move === "scissors"
        playByPlay.innerHTML = ( game.rockScissors );
        turnScore.innerHTML = ( game.winRound );
        playerPt[player.score].setAttribute(
          "style",
          "background-color: green;"// border: 3px darkgreen solid;"
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
          "background-color: red;"// border: 3px darkred solid;"
        );
        oppo.score++;
      }
      else { // oppo.move === "rock"
        playByPlay.innerHTML = ( game.paperRock);
        turnScore.innerHTML = ( game.winRound );
        playerPt[player.score].setAttribute(
          "style",
          "background-color: green;"// border: 3px darkgreen solid;"
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
          "background-color: red;"// border: 3px darkred solid;"
        );
        oppo.score++;
      }
      else { // oppo.move === "paper"
        playByPlay.innerHTML = ( game.scissorsPaper );
        turnScore.innerHTML = ( game.winRound );
        playerPt[player.score].setAttribute(
          "style",
          "background-color: green;"// border: 3px darkgreen solid;"
        );
        player.score++;
      }
    }
  }
  console.log(player.score + ", " + oppo.score);
}

function checkForWin() {
  console.log("checkForWin fired.");
  if (player.score === 3) {
    console.log("Player wins.");
    gameOverBox.setAttribute(
      "style",
      "display: block; background-color: lightgreen; border-color: darkgreen;"
    );
    gameOverHead.innerHTML = game.winGameHead;
    gameOverMsg.innerHTML = game.winGameMsg;
  }
  else if (oppo.score === 3) {
    console.log("Opponent wins.");
    gameOverBox.setAttribute(
      "style",
      "display: block; background-color: rgb(256,164,164); border-color: rgb(128,0,0);"
    );
    gameOverHead.innerHTML = game.loseGameHead;
    gameOverMsg.innerHTML = game.loseGameMsg;
  }
  else { }
}

function playAgain() {
  gameOverBox.setAttribute("style", "display: hidden;");
  playByPlay.innerHTML = "Playing again?";
  turnScore.innerHTML = "Choose your first move.";
  for (var i = 0; i < 3; i++) {
    playerPt[i].setAttribute("style", "background-color: #ddd;");
    oppoPt[i].setAttribute("style", "background-color: #ddd;");
  }
  playerMove.innerHTML = ("<i class='fa fa-question'></i>");
  oppoMove.innerHTML = ("<i class='fa fa-question'></i>");
  player.score = 0;
  oppo.score = 0;
}

// Reflection
//
//
//
//
//
//
//
//