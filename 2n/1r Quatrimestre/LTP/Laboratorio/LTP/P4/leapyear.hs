module Leapyear where
    leapyear :: Int -> Bool
    leapyear y
        | mod y 4 == 0 && mod y 100 == 0 = mod y 400 == 0
        | otherwise = mod y 4 == 0

    daysAmonth :: Int -> Int -> Int
    daysAmonth x y
        | x == 2 && leapyear y = 29
        | x == 2 = 28
        | x < 8 && mod x 2 /= 0 = 31
        | x > 7 && mod x 2 == 0 = 31
        | otherwise = 30