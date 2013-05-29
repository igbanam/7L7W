%% ARITHMETIC

add_3_and_double(X, Y) :-
	Y is (X + 3) * 2.

accMax([H|T],A,Max)  :- 
	H  >  A, 
	accMax(T,H,Max). 
 
accMax([H|T],A,Max)  :- 
    H  =<  A, 
    accMax(T,A,Max). 
 
accMax([],A,A).

max(List, Max) :-
	List = [H | _],
	accMax(List, H, Max).

%%%%%%%%%%%%%%%
%% EXERCISES %%
%%%%%%%%%%%%%%%

% 5.2 - 1
increment(X, Y) :- Y is X + 1.

% 5.2 - 2
sum(A, B, C) :- C is A + B.

% 5.3
addone([],[]).
addone([A | AT], [B | BT]) :-
	B is A + 1,
	addone(AT, BT).

%%%%%%%%%%%%%%%
%% PRACTICAL %%
%%%%%%%%%%%%%%%

% 1
accMin([H|T],A,Min)  :- 
	H  <  A, 
	accMin(T,H,Min). 
 
accMin([H|T],A,Min)  :- 
    H  >=  A, 
    accMin(T,A,Min). 
 
accMin([],A,A).

min(List, Min) :-
	List = [H | _],
	accMin(List, H, Min).

% 2
scalarMult(_, [], []).
scalarMult(S, [VH | VT], R) :-
	RH is S * VH,
	R = [RH | RT],
	scalarMult(S, VT, RT).

% 3
dotAcc([H|T], [H1|T1], A, R) :-
	A1 is A + (H * H1),
	dotAcc(T, T1, A1, R).
dotAcc([],[],A,A).
dot(A, B, R) :- dotAcc(A, B, 0, R).