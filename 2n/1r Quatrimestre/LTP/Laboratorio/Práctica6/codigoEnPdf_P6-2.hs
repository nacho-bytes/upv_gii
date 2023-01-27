-- *****************************
-- Exercises 
-- Practice 6 of LTP
-- *****************************

-------------------------------------------------------------------
-- WARNING:
-- 	ESTE FICHERO SE PROPORCIONA PARA FACILITAR 
--	LA COPIA DE LINEAS DE CODIGO DE AQUI AL PROGRAMA DEL ALUMNO
--      ESTE FICHERO NO COMPILA
--	EL INTERPRETE DE HASKELL GENERA UN PARSE ERROR
--	SI SE EJECUTA :load codigoEnPdf_P6
-------------------------------------------------------------------


-- ********************************
-- *** Section 1.2. export list ***
-- ********************************

-- Sphere.hs
module Sphere (area, volume) where

  -- area de una esfera
  area :: Float -> Float
  area radius =  4 * pi * radius**2

  -- volumen de una esfera
  volume :: Float -> Float
  volume radius = (4/3) * pi * radius**3
  
  -- area de un huso esferico
  areaHuso :: Float -> Float -> Float
  areaHuso radius angle = (area radius) * angle / 360
  
  -- volumen de la cuña esferica
  volumeCunya :: Float -> Float -> Float
  volumeCunya radius angle = (volume radius) * angle / 360
  
  
-- Geometry2D.hs
module Geometry2D (areaSquare, perimeterSquare) where

  areaRectangle :: Float -> Float -> Float
  areaRectangle base height = base * height

  perimeterRectangle :: Float -> Float -> Float
  perimeterRectangle base height = 2 * (base + height)

  areaSquare :: Float -> Float
  areaSquare side = areaRectangle side side

  perimeterSquare :: Float -> Float
  perimeterSquare side = perimeterRectangle side side

  
-- Test.hs
import Geometry2D
-- main = putStrLn ("The area is " ++ show (areaRectangle 2 3))
main = putStrLn ("The area is " ++ show (areaSquare 2))


-- Test2.hs
import Geometry2D
main = do
   putStrLn ("The area is " ++ show (areaSquare 2))
   let other = (areaSquare 5)
   putStrLn ("Another area is " ++ show other)


-- **************************************
-- *** Section 1.3. qualified imports ***
-- **************************************

-- NormalizeSpaces.hs
module NormalizeSpaces where
  normalize :: String -> String
  normalize = unwords . words

  
-- NormalizeCase.hs
module NormalizeCase where
  import Data.Char (toLower) -- import only function toLower
  normalize :: String -> String
  normalize = map toLower

  
-- NormalizeAll.hs
module NormalizeAll where
  import qualified NormalizeSpaces
  import qualified NormalizeCase
  normalizeAll :: String -> String
  normalizeAll = NormalizeSpaces.normalize . NormalizeCase.normalize

  
-- ********************************************
-- *** Section 2.1. parametric polymorphism ***
-- ********************************************

length :: [a] -> Int
length [] = 0
length (x:xs) = 1 + length xs


(==) :: [a] -> [a] -> Bool
[]     == []     = True
[]     == (x:xs) = False
(x:xs) == []     = False
(x:xs) == (y:ys) = x==y && xs==ys


(==) :: (Eq a) => [a] -> [a] -> Bool


-- module Queue v1
module Queue (Queue, empty, enqueue, dequeue, first, isEmpty, size) where
data Queue a = EmptyQueue | Item a (Queue a)  
empty = EmptyQueue
enqueue x EmptyQueue = Item x EmptyQueue
enqueue x (Item a q) = Item a (enqueue x q)
dequeue (Item _ q) = q
first (Item a _) = a 
isEmpty EmptyQueue = True
isEmpty _ = False
size EmptyQueue = 0
size (Item _ q) = 1 + size q


-- TestQueue.hs
import Queue
main = do
   putStrLn (show (isEmpty (EmptyQueue)))


-- TestQueue2.hs
import Queue
main = do
   putStrLn (show (first (enqueue 5 empty)))


-- module Queue v2
module Queue where
data Queue a = Queue [a] [a]
empty = Queue [] []
enqueue y (Queue xs ys) = Queue xs (y:ys)
dequeue (Queue (x:xs) ys) = Queue xs ys
dequeue (Queue [] ys) = dequeue (Queue (reverse ys) [])
first (Queue (x:xs) ys) = x
first (Queue [] ys) = head (reverse ys)
isEmpty (Queue [] []) = True
isEmpty _ = False
size (Queue a b) = length a + length b


-- TestSQueue3.hs
import Queue
main = do
   putStrLn (show (enqueue 7 (enqueue 5 empty)))


-- instance Show ...
instance (Show a) => Show (Queue a) where
    show EmptyQueue = " <- "
    show (Item x y) = " <- " ++ (show x) ++ (show y)

   
-- TestSQueue4.hs
import Queue
main = do
   putStrLn (show (dequeue (enqueue 1 empty)))
   putStrLn (show (enqueue 10 (enqueue 5 empty)))


-- ****************************************
-- *** Section 2.2. ad hoc polymorphism ***
-- ****************************************

-- v1 (without type classes)
type Side    = Float
type Apothem = Float
type Radius  = Float

data Shape = Pentagon Side Apothem |
             Circle Radius
             deriving (Eq, Show)

perimeter :: Shape -> Float
perimeter (Pentagon s a) = 5 * s 
perimeter (Circle r)     = 2 * pi * r


-- v2 (with type classes)
type Side    = Float
type Apothem = Float
type Radius  = Float

data Pentagon = Pentagon Side Apothem
data Circle   = Circle Radius

class Shape a where
   perimeter :: a -> Float 

instance Shape Pentagon where
   perimeter (Pentagon s a) = 5 * s 

instance Shape Circle where
   perimeter (Circle r) = 2 * pi * r 

-- volumePrism
type Height = Float
type Volume = Float
volumePrism :: (Shape a) => a -> Height -> Volume
volumePrism base height = (area base) * height

