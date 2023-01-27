module Remainder where
    remainder :: Int -> Int -> Int
    remainder x y
        | x == 0 = 0
        | x < y = x
        | otherwise = remainder (x - y) y