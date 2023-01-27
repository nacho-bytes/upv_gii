import sys
import math
import numpy as np
from L2dist import L2dist
from scipy import stats
from knn import knn

def wilson(X, xl, k):
    ind = np.array(range(X.shape[0]))
    err = 1
    while (err > 0):
        print(ind.shape)
        err = 0
        V = mnn(X, xl, 1000)
        for i in range(ind.shape[0]):
            i -= err
            c = knnV(V[:,i], ind, xl,k)
            if (xl[i] != c):
                err += 1
                ind = np.setdiff1d(ind, i)
    return ind

def mnn(X, xl, m):
  V = np.zeros((m,m))
  # Calculamos la matiz de distancias
  # donde la diagonal representa la distancia de 
  # cada muestra consigo mismo (la cual debe ser infinita)
  #I = np.identity(X.shape[0])
  #np.fill_diagonal(I, float('inf'))
  #D = L2dist(X, X) + I
  for n in range(m):
    V[:,n] = L2dist(X,X[n,:])
  # Ordenamos de mas cercano a mas lejano cada columna
  idx = np.argsort(D,axis=0)
  # Guardamos en V los primer m vecinos mas cercanos
  # por columnas para cada muestra
  V = idx[:m,:]
  return V

def knnV(Vi, ind, xl,k):
  # Filtramos en idx los indices de Vi
  # que aun no han sido eliminados
  idx = Vi[np.isin(Vi,ind)]
  # Escogemos los k primeros
  idx = idx[:k]
  # Realizamos la clasificacion 
  # y asignmamos a c
  classif,_ = stats.mode(xl[idx])
  c = xl[int(classif[0])]
  return c
