module SelectEvenPos where
    selectEvenPos :: [Int] -> [Int]
    selectEvenPos (x:[]) = [x]
    selectEvenPos (x0:(x1:xs)) = x0 : (selectEvenPos xs)