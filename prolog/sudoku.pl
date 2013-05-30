% Solving the sudoku puzzle

sudoku_4(Puzzle, Solution) :-
	Puzzle = Solution,
	Puzzle = [C11, C21, C31, C41,
			  C12, C22, C32, C42,
			  C13, C23, C33, C43,
			  C14, C24, C34, C44],
	fd_domain(Puzzle, 1, 4).