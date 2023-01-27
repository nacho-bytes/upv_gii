module DecBin where
    decBin :: Int -> [Int]
    decBin x = if x < 2 then [x]
                else (x `mod` 2) : decBin (x `div` 2)