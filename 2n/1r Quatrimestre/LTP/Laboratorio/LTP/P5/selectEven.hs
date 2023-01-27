module SelectEven where
    selectEven :: [Int] -> [Int]
    selectEven [] = []
    selectEven (x:xs)
        | even x = [x] ++ selectEven xs
        | otherwise = selectEven xs