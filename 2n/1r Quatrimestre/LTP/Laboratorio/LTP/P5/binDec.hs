module BinDec where
    binDec :: [Int] -> Int
    binDec (x:[]) = x
    binDec (x:y)  = x + binDec y * 2