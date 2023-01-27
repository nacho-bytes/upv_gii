module ShapeC where
    type Side    = Float
    type Apothem = Float
    type Radius  = Float
    type Height  = Float
    type Volume  = Float
    type Surface = Float

    data Pentagon = Pentagon Side Apothem deriving (Eq, Show)
    data Circle   = Circle Radius deriving (Eq, Show)

    class (Eq a, Show a) => Shape a where
        perimeter :: a -> Float 
        area :: a -> Float
        


    instance Shape Pentagon where
        perimeter (Pentagon s a) = 5 * s 
        area (Pentagon s a) = ((s * a) / 2) * 5

    instance Shape Circle where
        perimeter (Circle r) = 2 * pi * r
        area (Circle r) = pi * r * r
    
    volumePrism :: (Shape a) => a -> Height -> Volume
    volumePrism s h = (area s) * h

    surfacePrism :: (Shape a) => a -> Height -> Surface
    surfacePrism s h = (perimeter s) * h + ((area s) * 2)