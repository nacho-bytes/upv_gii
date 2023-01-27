#!/usr/bin/python3

import sys
import math
from time import process_time_ns
import numpy as np
from gaussian import gaussian
from pca import pca 

if len(sys.argv)!=7:
  print('Usage: %s <trdata> <trlabels> <As> <ks> <%%trper> <%%dvper>' % sys.argv[0]);
  sys.exit(1);

X= np.load(sys.argv[1])['X'];
xl=np.load(sys.argv[2])['xl'];
alphas=np.fromstring(sys.argv[3],dtype=float,sep=' ');
ks=np.fromstring(sys.argv[4],dtype=int,sep=' ');
trper=int(sys.argv[5]);
dvper=int(sys.argv[6]);

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
file = open("pca+gaussian-exp-ks.out", "w");

# Por alphas
etq = ['"Alpha = ' + str(alpha) + '"' for alpha in alphas]
etq.insert(0, 'ks')
etq = ' '.join(etq)
res = [str(k) for k in ks.tolist()]
res.insert(0, etq)

# Por dimensiones
# etq = ['"K = ' + str(k) + '"' for k in ks.tolist()]
# etq.insert(0, 'alphas')
# etq = ' '.join(etq)
# res = [str(alph) for alph in alphas]
# res.insert(0, etq)

for ki,k in enumerate(ks):
  Wk = W[:,:k]
  Xtrk = (Xtr - m) @ Wk 
  Xdvk = (Xdv - m) @ Wk 
  err = gaussian(Xtrk, xltr, Xdvk, xldv, alphas)
  
  # Por alphas
  for e in err:
    res[ki + 1] += ' ' + str(e)
    
  # Por dimensiones
  # for i,e in enumerate(alphas):
  #   res[i + 1] += ' ' + str(err[i])
file.write('\n'.join(res))

file.close()