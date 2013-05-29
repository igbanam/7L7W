%% LIST PROCESSING

%%%%%%%%%%%%%%%
%% EXERCISES %%
%%%%%%%%%%%%%%%

a2b([], []).
a2b([a|A], [b|B]) :-
	a2b(A, B).

% 4.3
second(X, List) :-
	% Check if X is second in list
	member(X, List),
	[_, X | _] = List.

% 4.4
swap([X, Y | T], [Y, X | T]).

% 4.5
tran(eins,one). 
tran(zwei,two). 
tran(drei,three). 
tran(vier,four). 
tran(fuenf,five). 
tran(sechs,six). 
tran(sieben,seven). 
tran(acht,eight). 
tran(neun,nine).

listtran([],[]).
listtran([X | Gt], [Y | Et]) :-
	tran(X, Y),
	listtran(Gt, Et).

% 4.6
twice([],[]).
twice(In, Out) :-
	[X | A] = In,
	[X, X | B] = Out,
	twice(A, B).

%%%%%%%%%%%%%%%
%% PRACTICAL %%
%%%%%%%%%%%%%%%

% 1
combine([], R, R).
combine(R, [], R).
combine(X, Y, R) :-
	[A | XT] = X,
	[B | YT] = Y,
	[[A, B] | RT] = R,
	combine(XT, YT, RT).

% 2
combine2([], R, R).
combine2(R, [], R).
combine2(X, Y, R) :-
	[A | XT] = X,
	[B | YT] = Y,
	[[A, B] | RT] = R,
	combine2(XT, YT, RT).

% 3
combine3([], R, R).
combine3(R, [], R).
combine3(X, Y, R) :-
	[A | XT] = X,
	[B | YT] = Y,
	[j(A, B) | RT] = R,
	combine3(XT, YT, RT).
