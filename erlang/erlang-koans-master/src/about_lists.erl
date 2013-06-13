-module(about_lists).
-compile(export_all).
-include("../resources/koans.hrl").

lists_are_not_homogenious() ->
  NotJustFruits = [apple, banana, ?ReplaceMe, mango],
  Element = lists:nth(3, NotJustFruits),
  (Element < 2) and (Element > 0).

we_can_add() ->
  [apple, banana] ++ ?ReplaceMe.

we_can_also_take_away() ->
  [apple, banana] -- [?ReplaceMe].

lists_have_heads() ->
  [Head | Tail] = [apple, banana, mango],
  ?ReplaceMe =:= Head.

lists_also_have_tails() ->
  [Head | Tail] = [apple, banana, mango],
  ?ReplaceMe =:= Tail.

constructing_with_cons() ->
  ?ReplaceMe =:= [apple | [banana | [mango | [pear | []]]]].

length_is_as_simple_as_it_seems() ->
  ?ReplaceMe =:= length([1, 2, 3]).

lists_of_tuples_can_be_found_by_key() ->
  Meals = [{breakfast, eggs}, {lunch, pasta}, {dinner, burrito}],
  {lunch, _} = lists:keyfind(?ReplaceMe, 2, Meals).

