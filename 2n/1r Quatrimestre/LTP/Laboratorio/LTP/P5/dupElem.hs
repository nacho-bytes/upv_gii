module DupElem where
    data BinTreeInt = Void | Node Int BinTreeInt BinTreeInt deriving Show
    dubElem :: BinTreeInt -> BinTreeInt
    dubElem Void = Void
    dubElem (Node i a b) = Node (i*2) (dubElem a) (dubElem b)