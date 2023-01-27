#!/usr/bin/python3

import sys
import math
import numpy as np
from pca import pca
from knn import knn

if len(sys.argv)!=6:
  print('Usage: %s <trdata> <trlabels> <ks> <%%trper> <%%dvper>' % sys.argv[0]);
  sys.exit(1);

X= np.load(sys.argv[1])['X'];
xl=np.load(sys.argv[2])['xl'];
ks=np.fromstring(sys.argv[3],dtype=int,sep=' ');
trper=int(sys.argv[4]);
dvper=int(sys.argv[5]);

N=X.shape[0];
np.random.seed(23); perm=np.random.permutation(N);
X=X[perm]; xl=xl[perm];

# Selecting a subset for train and dev sets
Ntr=round(trper/100*N);
Xtr=X[:Ntr]; xltr=xl[:Ntr];
Ndv=round(dvper/100*N);
Xdv=X[N-Ndv:]; xldv=xl[N-Ndv:];

# Cálculo de PCA
m,W = pca(Xtr)

# Archivo de salida
file = open("pca+knn-exp-2.out", "w")

for k in ks:
  # Proyección a k dimensiones
  Wk = W[:,:k]
  Xtrk = Xtr @ Wk 
  Xdvk = Xdv @ Wk 

  # Llamada al clasificador k-nn (k=1)
  # y obtención de la tasa de error 
  err = knn(Xtrk, xltr, Xdvk, xldv, 1)

  # Escritura en .out del resultado
  file.write(str(k)); file.write(' ')
  file.write(str(err)); file.write('\n')

file.close()