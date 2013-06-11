-module (day2do).
-export ([hash_get/2]).

% [{erlang, "a functional language"}, {ruby, "an OO language"}]
hash_get([], ProgLang) -> [];
hash_get([H|T], ProgLang) ->
	{PL, D} = H,
	if
		PL == ProgLang -> D;
		true -> hash_get(T, ProgLang)
	end.

% Cart = [{pencil, 4, 0.25}, {pen, 1, 1.20}, {paper, 2, 0.20}].
% Budget = [{I, Q * P} || {I, Q, P} <- Cart].