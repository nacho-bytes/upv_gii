#!/usr/bin/python3

import sys
import math
import numpy as np
from pca import pca
from knn import knn

if len(sys.argv)!=6:
  print('Usage: %s <trdata> <trlabels> <tedata> <telabels> <k>' % sys.argv[0]);
  sys.exit(1);

X= np.load(sys.argv[1])['X'];
xl=np.load(sys.argv[2])['xl'];
Y= np.load(sys.argv[3])['Y'];
yl=np.load(sys.argv[4])['yl'];
k=int(sys.argv[5]);

# Cálculo de PCA
m,W = pca(X)

# Archivo de salida
file = open("pca+knn-eva.out", "w")

# Proyección a k dimensiones
Wk = W[:,:k]
Xk = X @ Wk 
Yk = Y @ Wk 

# Llamada al clasificador k-nn (k=1)
# y obtención de la tasa de error 
err = knn(Xk, xl, Yk, yl, 1)

# Escritura en .out del resultado
file.write(str(k)); file.write(' ')
file.write(str(err)); file.write('\n')

file.close()