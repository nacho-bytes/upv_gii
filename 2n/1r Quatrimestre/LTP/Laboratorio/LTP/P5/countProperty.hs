module CountProperty where
    data Tree a = Branch a (Tree a) (Tree a) | Void deriving Show

    countProperty :: (a -> Bool) -> (Tree a) -> Int
    countProperty e Void = 0
    countProperty e (Branch i a b)
        | e i = 1 + countProperty e a + countProperty e b
        | otherwise = countProperty e a + countProperty e b