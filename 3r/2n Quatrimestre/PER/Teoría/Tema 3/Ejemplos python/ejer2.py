import numpy as np
from numpy import linalg as LA

la = [ [2, 0, 0], [0, 3, 4], [0, 4, 9] ]   ## Vectores de datos
a = np.array(la)                           ## Convertir a array numpy
print("Matrix: ")
print(a)

w, v = LA.eig(a)                           ## Valores (w) y vectores (v) propios de la matriz
print()
print("Values: ", w)
print("Vectors: ")
print(v)                                   ## Los vectores propios son las COLUMNAS

print()
for i in range(0,len(la)):                 ## Impresión por columnas
  print("Lambda ", (i+1)," = ",w[i]," w", (i+1)," = ", v[:,i])
