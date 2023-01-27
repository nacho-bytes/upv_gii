#!/usr/bin/python

import sys
import math
import numpy as np
from perceptron import perceptron
from linmach import linmach

if len(sys.argv)!=9:
  print('Usage: %s <trdata> <trlabels> <tedata> <telabels> <alphas> <bs> <maxK> <%%tr>' % sys.argv[0]);
  sys.exit(1);

X= np.load(sys.argv[1])['X'];
xl=np.load(sys.argv[2])['xl'];
Y= np.load(sys.argv[3])['Y'];
yl=np.load(sys.argv[4])['yl'];
alphas=np.fromstring(sys.argv[5],sep=' ');
bs=np.fromstring(sys.argv[6],sep=' ');
K=int(sys.argv[7]);
trper=int(sys.argv[8]);

N,D=X.shape; M=Y.shape[0];
labs=np.unique(xl); C=labs.size;
np.random.seed(23); perm=np.random.permutation(N);
X=X[perm]; xl=xl[perm];

# Selecting a percentage of the training data
Ntr=round(trper/100*N);
X=X[:Ntr,:]; xl=xl[:Ntr];

print('#       a        b   E   k  Ete  Ete (%)      Ite (%)');
print('#-------- -------- --- --- ---- -------- ------------');

for a in alphas:
  for b in bs:
    tr=np.concatenate((X, xl.reshape(Ntr,1)),axis=1);
    w,E,k=perceptron(tr,b,a,K);
    rl=labs[linmach(w,np.concatenate((np.ones((M,1)),Y),axis=1))];
    nerr=np.sum(np.not_equal(yl,rl));
    perror=nerr/M;
    epsilon=1.96*math.sqrt(perror*(1-perror)/M);
    print(' %8.3f %8.1f %3d %3d %4d     %3.1f [%3.1f, %3.1f]' % (a,b,E,k,nerr,perror*100,max(0,(perror-epsilon)*100),min(100,(perror+epsilon)*100)));
