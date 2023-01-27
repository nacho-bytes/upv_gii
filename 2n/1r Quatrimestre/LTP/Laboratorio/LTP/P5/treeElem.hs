module TreeElem where
    data BinTreeInt = Void | Node Int BinTreeInt BinTreeInt deriving Show

    treeElem :: Int -> BinTreeInt -> Bool
    treeElem x Void = False
    treeElem x (Node i a b)
        | x == i = True
        | x < i = treeElem x a
        | x > i = treeElem x b