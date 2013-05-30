% APPEND

% append/3 ... append(A, B, C).
% Appends A to B and returns it in C.
% below is a naive implementation. GNUProlog has a 
% faster O(1) implementation rightly named "append"

naive_append([], L, L).
naive_append([H | T], L2, [H | L3]) :- naive_append(T, L2, L3).

% prefix/2 ... prefix(P, L) :- append(P, _, L);
% There exists some list which when P is appended to
% it, it yields L. Therefore P is a prefix.

% suffix/2 ... suffix(S, L) :- append(_, S, L);
% There exists some list which when it is appended to
% S, it yields L. Therefore S is a suffix.

% SubL is a sublist of L if there is some suffix of L
% to which SubL is a prefix.
% sublist(SubL, L) :-  suffix(S, L), prefix(SubL,S).

/* reversing the list by using multiple recursive
 * naive_append calls
 */
naiverev([],[]). 
naiverev([H | T], R) :- naiverev(T, RevT), naive_append(RevT, [H], R).

/* Using an accumualator is invariably faster as it 
 * reduces the passes made down to one.
 */
accRev([H | T], A, R) :- accRev(T, [H | A], R). 
accRev([], A, A).

%%%%%%%%%%%%%%%
%% EXERCISES %%
%%%%%%%%%%%%%%%

% 6.1
doubled(L) :-
	length(L, G), % Original list length
	0 is G mod 2, % ... is even
	prefix(P, L), % There is some prefix...
	length(P, PL), % ...whose length...
	PL is G // 2, % ...is half the original list
	suffix(S, L), % There is some suffix...
	length(S, SL), % ...whose length...
	SL is G // 2, % ...is half the original list
	P = S. % The prefix and suffix are the same

% 6.2 - Palindromes
palindrome(L) :- reverse(L, L). 
% can be done with naiverev

% 6.3 - TopTail
toptail(I, O) :-
	length(I, Li), % Length of the inList...
	Li >= 2, % ...is 2 or more.
	[H|_] = I, % The head of the list
	delete(I, H, K), % ...should be removed
	reverse(K, J), % reverse the new list
	[H1|_] = J, % The head of the list (ie last of original)
	delete(J, H1, M), % ...should be removed 
	reverse(M, O).

% 6.4 - Last 1 - using reverse
vlast(L, E) :- reverse(L, [E | _]).

% 6.4 - Last 2 - using recursion
rlast([X], X).
rlast([_ | T], E) :- rlast(T, E).

% 6.5 - Swap first and last elements
swapfl(A, B) :-
	[AH | _] = A,
	last(A, AL),
	delete(A, AH, A1),
	delete(A1, AL, AM),
	append([AL | AM], [AH], B).

% 6.6 - Who keeps the zebra
% FACTS
% livein(nationality, color).
% haspet(nationality, pet)
livesNextTo(A, B, L) :-
	[A | [B | _]] = L;
	[_ | [A | B]] = L.

zebraKeeper(Houses, ZebraOwner):-
	member([englishman, _, red], Houses),
	member([spanish, jaguar, _], Houses),
	livesNextTo([_, snail, _], [japanese, _, _], Houses),
	livesNextTo([_, snail, _], [_, _, blue], Houses),
	member([ZebraOwner, zebra, _], Houses).


zebra(X) :- zebraKeeper([_, _, _], X).

%%%%%%%%%%%%%%%
%% PRACTICAL %%
%%%%%%%%%%%%%%%

% 1. naive member using naive append
naive_member(X,[X|_]). 
naive_member(X,[_|T]) :- naive_member(X,T).

naive_member_using_naive_append(X, L) :- naive_append([X], _, L).

% 2. set

uniq(I, O) :-
	append(K,[O|_],I), % if we append some list to the output to yield the input,
	\+ append(_,[O|_],K). % there should be nothing that can be appended to the output to yield
					% the original list. Thereby making such element in the input list uniq!
% GNUProlog's in-built "append" is used here to reduce recursive depth.

lpn_set(I, O) :-
	findall(A,uniq(I,A),O). % gather.

% 3. flatten - don't feel like doing it.