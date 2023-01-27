#!/usr/bin/python3

import sys
import math
import numpy as np
from gaussian import gaussian

if len(sys.argv)!=6:
  print('Usage: %s <trdata> <trlabels> <As> <%%trper> <%%dvper>' % sys.argv[0]);
  sys.exit(1);

X= np.load(sys.argv[1])['X'];
xl=np.load(sys.argv[2])['xl'];
alphas=np.fromstring(sys.argv[3],dtype=float,sep=' ');
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


# Archivo de salida
file = open("gaussian-exp.out", "w")
err = gaussian(Xtr, xltr, Xdv, xldv, alphas)
for i,e in enumerate(alphas): 
  # Escritura en .out del resultado
  file.write(str(e)); file.write(' ')
  file.write(str(err[i])); file.write('\n')

file.close()