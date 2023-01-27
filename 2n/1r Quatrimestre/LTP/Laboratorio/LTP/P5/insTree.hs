module InsTree where
    data BinTreeInt = Void | Node Int BinTreeInt BinTreeInt deriving Show

    insTree :: Int -> BinTreeInt -> BinTreeInt
    insTree x Void = Node x Void Void
    insTree x (Node i a b)
        | x < i = Node i (insTree x a) b
        | x > i = Node i a (insTree x b)