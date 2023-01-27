module IsPrimer where
    import Divisors
    isPrime :: Int -> Bool
    isPrime x
        | x == 1 = True
        | otherwise = length (divisors x) == 2
    primes :: Int -> [Int]
    primes x = take x [ y | y <- [1..], isPrime y]