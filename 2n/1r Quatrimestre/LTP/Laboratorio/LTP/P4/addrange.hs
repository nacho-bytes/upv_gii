module AddRange where
    addrange :: Int -> Int -> Int
    addrange x y
        | x == y = x
        | x < y = x + addrange (x + 1) y
        | x > y = x + addrange (x - 1) y