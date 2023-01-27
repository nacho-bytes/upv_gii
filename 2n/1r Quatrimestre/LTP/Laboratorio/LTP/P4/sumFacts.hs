module SumFacts where
    import Fact
    sumFacts :: Int -> Int
    sumFacts x
        | x == 1 = 1
        | otherwise = fact x + sumFacts (x - 1)