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
  
  -- volumen de la cuÃ±a esferica
  volumeCunya :: Float -> Float -> Float
  volumeCunya radius angle = (volume radius) * angle / 360