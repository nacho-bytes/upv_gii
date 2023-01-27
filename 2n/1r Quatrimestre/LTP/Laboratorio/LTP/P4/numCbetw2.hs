module NumCbetw2 where
    import Data.Char
    charbetw :: Char -> Char -> Int
    charbetw x y
        | x == y = 0
        | otherwise = abs((ord y) - (ord x) - 1)