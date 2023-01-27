module Prelude' where
    map' :: (a -> b) -> [a] -> [b]
    map' f (x:xs) = f x : map' f xs

    filter' :: (a -> Bool) -> [a] -> [a]
    filter' p (x:xs)
        | p x = x : filter p xs
        | otherwise = filter p xs