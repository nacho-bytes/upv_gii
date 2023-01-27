import numpy as np
from numpy import linalg as LA

la = [ [2, 2] , [-1 ,1], [1, -1], [-2, -2] ]  ## Conjunto de datos
a = np.array(la)                              ## Convertir a array numpy
a = a.transpose()                             ## Traspuesta -> datos como columnas
print("Data matrix: ")
print(a)

m = a.mean(axis=1)                            ## Obtención de la media, axis=1 para columnas
print("\nMean vector: ")
print(m)

s = np.cov(a, bias=True)                      ## Obtención de la matriz de covarianzas, bias=True para normalizar por N
print("\nCovar matrix: ")
print(s)

w, v = LA.eig(s)                              ## Valores (w) y vectores (v) propios de la matriz de covarianzas s
print("\nValues: ", w)
print("\nVectors: ")
print(v)                                      ## Los vectores propios son las COLUMNAS

print()
for i in range(0,len(s)):                     ## Impresión por columnas
  print("Lambda ", (i+1)," = ",w[i]," w", (i+1)," = ", v[:,i])
