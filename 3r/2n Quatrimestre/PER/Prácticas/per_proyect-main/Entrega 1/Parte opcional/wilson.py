import sys
import math
import numpy as np
from L2dist import L2dist
from scipy import stats
from knn import knn

def wilson(X, xl, k):
    ind = np.array(range(X.shape[0]))
    err = 1
    V = mnn(X, xl, 100)
    while (err):
        err = False
        for i in ind:
            dif =  np.setdiff1d(ind, [i])
            c = knnV(V[:,i], dif, xl,k)
            if (xl[i] != c):
              err = True
              ind = dif
    return ind

def mnn(X, xl, m):
  V = np.zeros((m,X.shape[0]), np.int32)
  # Calculamos la matiz de distancias
  # donde la diagonal representa la distancia de 
  # cada muestra consigo mismo (la cual debe ser infinita)
  for n in range(X.shape[0]):
    XX = np.sum(np.square(X),axis=1);
    xn = X[n,:];
    XXn = np.sum(np.square(xn));
    # XX and YY were converted into row vectors at sum
    # So XX needs to be a column vector and YY is fine as row vector
    D  = XXn + (XX - 2*xn@np.transpose(X))
    # Ordenamos de mas cercano a mas lejano cada columna
    # Guardamos en V los primer m vecinos mas cercanos
    # por columnas para cada muestra
    idx = np.argsort(D,axis=0)
    V[:,n] = idx[1:m+1]
  return V

def knnV(Vi, ind, xl,k):
  # Filtramos en idx los indices de Vi
  # que aun no han sido eliminados
  idx = Vi[np.isin(Vi,ind)]
  #print(Vi)
  # Escogemos los k primeros
  idx = idx[:k]
  # Realizamos la clasificacion 
  # y asignmamos a c
  classif,_ = stats.mode(xl[idx])
  #print(idx)
  #print("c ->")
  #print(classif)
  c = classif[0]
  return c
