import ShapeC
type Base = Float
type Height = Float
data Rectangle = Rectangle Base Height deriving Show

instance Shape Rectangle where
    perimeter (Rectangle b h) = 2 * b + 2 * h
    area (Rectangle b h) = b * h
    
main = do
    let f1 = (Pentagon 5 4)
        f2 = (Circle 5)
        f3 = (Rectangle 5 4)
    putStrLn ("perimeter " ++ show f1 ++ " is " ++ show (perimeter f1))
    putStrLn ("perimeter " ++ show f2 ++ " is " ++ show (perimeter f2))
    putStrLn ("perimeter " ++ show f3 ++ " is " ++ show (perimeter f3))
