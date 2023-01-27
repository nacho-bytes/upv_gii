#!/usr/bin/python3

import sys
import math
import numpy as np
from perceptron import perceptron
from confus_mat import confus
from linmach_mat import linmach

if len(sys.argv)!=8:
  print('Usage: %s <trdata> <trlabels> <alphas> <bs> <maxK> <%%tr> <%%dv>' % sys.argv[0]);
  sys.exit(1);

X= np.load(sys.argv[1])['X'];
xl=np.load(sys.argv[2])['xl'];
alphas=np.fromstring(sys.argv[3],sep=' ');
bs=np.fromstring(sys.argv[4],sep=' ');
K=int(sys.argv[5]);
trper=int(sys.argv[6]);
dvper=int(sys.argv[7]);

N,D=X.shape; M=Y.shape[0];
labs=np.unique(xl); C=labs.size;
np.random.seed(23); perm=np.random.permutation(N);
X=X[perm]; xl=xl[perm];

# Selecting a percentage of the training data
Ntr=round(trper/100*N);
Nte=round(dvper/100*N);
X=X[:Ntr,:]; xl=xl[:Ntr];
Y=X[Nte:,:]; yl=xl[Nte:];

print('#      a        b   E   k  Ete  Ete (%)    Ite (%)');
print('#------- -------- --- --- ---- -------- ----------');

for a in alphas:
  for b in bs:
    tr=np.concatenate((X, xl.reshape(Ntr,1)),axis=1);
    w,E,k=perceptron(tr,b,a,K);
    rl=labs[linmach( w,np.concatenate( (np.ones( (M,1) ), Y), axis=1 ) )];
    nerr=confus(yl,rl);
    perror=nerr/M;
    epsilon=1.96*math.sqrt(perror*(1-perror)/M);
    print('%8.1f %8.1f %3d %3d %3d     %3.1f [%3.1f, %3.1f]' % (a,b,E,k,nerr,perror*100,max(0,(perror-epsilon)*100),min(100,(perror+epsilon)*100)));
