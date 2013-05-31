% Solving the sudoku puzzle
valid([]).
valid([Head|Tail]) :-
    fd_all_different(Head),
    valid(Tail).
	
sudoku_4(Puzzle, Solution) :-
	Puzzle = Solution,
	Puzzle = [C11, C21, C31, C41,
			  C12, C22, C32, C42,
			  C13, C23, C33, C43,
			  C14, C24, C34, C44],
	fd_domain(Puzzle, 1, 4),
	Row1 = [C11, C21, C31, C41],
	Row2 = [C12, C22, C32, C42],
	Row3 = [C13, C23, C33, C43],
	Row4 = [C14, C24, C34, C44],
	Col1 = [C11, C12, C13, C14],
	Col2 = [C21, C22, C23, C24],
	Col3 = [C31, C32, C33, C34],
	Col4 = [C41, C42, C43, C44],
	Sqw1 = [C11, C12, C21, C22],
	Sqw2 = [C13, C14, C23, C24],
	Sqw3 = [C31, C41, C32, C42],
	Sqw4 = [C33, C34, C43, C44],
	
	valid([Row1, Row2, Row3, Row4, Col1, Col2, Col3, Col4, Sqw1, Sqw2, Sqw3, Sqw4]).