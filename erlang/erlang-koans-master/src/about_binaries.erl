-module(about_binaries).
-compile(export_all).
-include("../resources/koans.hrl").

binaries_of_strings() ->
  "What am I, really?" =:= binary:bin_to_list(<<"What am I, really?">>).

and_also_strings_of_binaries() ->
  <<"What am I, really?">> =:= binary:list_to_bin("What am I, really?").

the_first_byte_is_a_byte___right() ->
  98 =:= binary:first(<<"binary">>).

then_what_is_the_last() ->
  121 =:= binary:last(<<"binary">>).

