-module(about_list_comprehensions_test).
-include_lib("eunit/include/eunit.hrl").

representing_a_list_test() ->
  ?assert(about_list_comprehensions:representing_a_list()).

applying_a_function_test() ->
  ?assert(about_list_comprehensions:applying_a_function()).

applying_a_filter_test() ->
  ?assert(about_list_comprehensions:applying_a_filter()).

