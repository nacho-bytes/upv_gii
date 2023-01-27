#!/usr/bin/python3
#./pca+knn+wilson.py ./data/train-images-idx3-ubyte.npz ./data/train-labels-idx1-ubyte.npz  ./data/t10k-images-idx3-ubyte.npz ./data/t10k-labels-idx1-ubyte.npz "1 2 5 10 20 50 100 200"

import sys
import math
import numpy as np
from pca import pca
from knn import knn
from wilson import wilson

if len(sys.argv)!=6:
  print('Usage: %s <trdata> <trlabels> <tedata> <telabels> <ks>' % sys.argv[0]);
  sys.exit(1);

X= np.load(sys.argv[1])['X'];
xl=np.load(sys.argv[2])['xl'];
Y= np.load(sys.argv[3])['Y'];
yl=np.load(sys.argv[4])['yl'];
ks=np.fromstring(sys.argv[5],dtype=int,sep=' ');

# Reduccion de muestras
N=X.shape[0];
np.random.seed(23); perm=np.random.permutation(N);
X=X[perm]; xl=xl[perm];

# PCA
m,W = pca(X)

# PCA -> Wilson
# Archivo de salida
file = open("pca-wilson+knn-2.out", "w")

for k in ks:
  # Proyección a k dimensiones
  Wk = W[:,:k]
  Xk = X @ Wk
  Yk = Y @ Wk

  # Reducción de prototipos
  ind = wilson(Xk,xl,1)
  Xkw = Xk[ind]
  xlkw = xl[ind]

  # Llamada al clasificador k-nn (k=1)
  # y obtención de la tasa de error 
  err = knn(Xkw, xlkw, Yk, yl, 1)

  # Escritura en .out del resultado
  file.write(str(k)); file.write(' ')
  file.write(str(err)); file.write('\n')

file.close()