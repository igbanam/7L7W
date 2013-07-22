module Main where
	fib :: Integer -> Integer
	fib x
        | x > 0 && x <= 1 = 1
        | otherwise = definition = fib (x - 1) + fib(x - 2)