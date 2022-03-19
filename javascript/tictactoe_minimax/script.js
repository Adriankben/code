var board;
const hPlayer = 'O';
const aiPlayer = 'X';
const winCombos = [
	[0, 1, 2],
	[3, 4, 5],
	[6, 7, 8],
	[0, 3, 6],
	[1, 4, 7],
	[2, 5, 8],
	[0, 4, 8],
	[6, 4, 2]
]

const cells = document.querySelectorAll('.cell');
startGame();

function startGame() {
	document.querySelector(".endgame").style.display = "none";
    //Array 0 -9
	board = Array.from(Array(9).keys());
    //Clear table
	for (var i = 0; i < cells.length; i++) {
		cells[i].innerText = '';
		cells[i].style.removeProperty('background-color');
		cells[i].addEventListener('click', turnClick, false);
	}
}

function turnClick(square) {
    //if it has a number it means nobody played in it
    //human
    // check win, tie
	if (typeof board[square.target.id] == 'number') {
		turn(square.target.id, hPlayer)
		if (!checkWin(board, hPlayer) && !checkTie()) 
            turn(bestSpot(), aiPlayer);
	}
}

function turn(squareId, player) {
	board[squareId] = player;
	document.getElementById(squareId).innerText = player;
	let gameWon = checkWin(board, player)
	if (gameWon) gameOver(gameWon)
}

function checkWin(board, player) {
	let plays = board.reduce((a, e, i) => 
		(e === player) ? a.concat(i) : a, []);
	let gameWon = null;
	for (let [index, win] of winCombos.entries()) {
        // if every element in win, check if plays index is more than 1
        // plays everywhere
        // has the player played in each of the index in winCoombo
		if (win.every(elem => plays.indexOf(elem) > -1)) {
            // note which index won and which player
			gameWon = {index: index, player: player};
			break;
		}
	}
	return gameWon;
}

function gameOver(gameWon) {
	for (let index of winCombos[gameWon.index]) {
		document.getElementById(index).style.backgroundColor =
			gameWon.player == hPlayer ? "blue" : "red";
	}
	for (var i = 0; i < cells.length; i++) {
		cells[i].removeEventListener('click', turnClick, false);
	}
    declareWinner(gameWon.player == hPlayer ? "You win!" : "You lose.");
}

function declareWinner(who) {
	document.querySelector(".endgame").style.display = "block";
	document.querySelector(".endgame .text").innerText = who;
}

function emptySquares() {
	return board.filter(s => typeof s == 'number');
}

function bestSpot() {
	//returns object, index is where the computer will play
	return minimax(board, aiPlayer).index;
}

function checkTie() {
	if (emptySquares().length == 0) {
		for (var i = 0; i < cells.length; i++) {
			cells[i].style.backgroundColor = "green";
			cells[i].removeEventListener('click', turnClick, false);
		}
		declareWinner("Tie Game!")
		return true;
	}
	return false;
}

function minimax(newBoard, player) {
	//blank spaces
	var availSpots = emptySquares();

	//.1
	//check if win 
	if (checkWin(newBoard, hPlayer)){
		return {score: -10};//human win
	} else if (checkWin(newBoard, aiPlayer)) {
		return {score: 10};//ai win
	} else if (availSpots.length === 0) {
		return {score: 0};//tie
	}
	//2 loop through empty spot and save index and scores
	var moves = [];
	//.
	//empty spot again
	for (var i = 0; i < availSpots.length; i++) {
		var move = {};
		//save available moves to move.index
		move.index = newBoard[availSpots[i]]; 
		//3.
		//Puts human/ai in spot
		newBoard[availSpots[i]] = player;

		//4.
		//place ai into empty spot
		if (player == aiPlayer) {
			//5.
			//place human into empty spot and returns value
			var result = minimax(newBoard, hPlayer);
			move.score = result.score;
			
		//4. place human into empty	
		} else {
			//5. place ai into empty and returns value
			var result = minimax(newBoard, aiPlayer);
			move.score = result.score;
		}

		newBoard[availSpots[i]] = move.index;
		//add new index and score to array
		moves.push(move);
	}

	//select the best move based on maximum or minimum va lue
	var bestMove;
	if(player === aiPlayer) {
		var bestScore = -10000;
		for(var i = 0; i < moves.length; i++) {
			if (moves[i].score > bestScore) {
				bestScore = moves[i].score;
				bestMove = i;
			}
		}
	} else {
		var bestScore = 10000;
		for(var i = 0; i < moves.length; i++) {
			if (moves[i].score < bestScore) {
				bestScore = moves[i].score;
				bestMove = i;
			}
		}
	}

	return moves[bestMove];
}





