module CreaTree where
    import InsTree

    creaTree :: [Int] -> BinTreeInt
    creaTree (x:[]) = Node x Void Void
    creaTree (x:xs) = insTree x (creaTree xs)