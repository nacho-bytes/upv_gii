module SelectPosEven where
    selectPosEven :: [Int] -> [Int]
    selectPosEven x = [y | y <- [0..length x - 1], mod (x !! y) 2 == 0]