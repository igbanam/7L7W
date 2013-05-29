% APPEND

% append/3 ... append(A, B, C).
% Appends A to B and returns it in C.
% below is a naive implementation. GNUProlog has a 
% faster O(1) implementation rightly named

% prefix/2 ... prefix(P, L) :- append(P, _, L);
% There exists some list which when P is appended to
% it, it yields L. Therefore P is a prefix.

% suffix/2 ... suffix(S, L) :- append(_, S, L);
% There exists some list which when it is appended to
% S, it yields L. Therefore S is a suffix.

% SubL is a sublist of L if there is some suffix of L
% to which SubL is a prefix.
% sublist(SubL, L) :-  suffix(S, L), prefix(SubL,S).

naiverev([],[]). 
naiverev([H | T], R) :- naiverev(T, RevT), append(RevT, [H], R).