-module (day1do).
-export ([count_to_n/1]).

count_to_n(0) -> print(0);
count_to_n(N) -> print(N), count_to_n(N-1).