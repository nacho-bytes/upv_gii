module Repeated where
    repeated :: Int -> [Int] -> Int
    repeated x [] = 0
    repeated x (a:as)
        | x == a = 1 + repeated x as
        | otherwise = repeated x as