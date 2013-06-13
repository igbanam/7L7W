-module(about_list_comprehensions).
-compile(export_all).
-include("../resources/koans.hrl").

representing_a_list() ->
  [1,2,3] =:= [Item || Item <- [1, 2, 3]].

applying_a_function() ->
  [2,4,6] =:= [Item * 2 || Item <- [1, 2, 3]].

applying_a_filter() ->
  [2] =:= [Item || Item <- [1, 2, 3], Item rem 2 =:= 0].

