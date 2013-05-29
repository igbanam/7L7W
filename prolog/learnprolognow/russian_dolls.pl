% This declared Y is in X
% directlyIn(X, Y).
directlyIn(katarina, olga).
directlyIn(olga, natasha).
directlyIn(natasha, irina).

in(X, Y) :-
	directlyIn(X, Y).

in(X, Y) :-
	% This should be the recursive declaration
	% which recurses on the directlyIn/2 declaration.
	directlyIn(X, Z),
	in(Z, Y).
	