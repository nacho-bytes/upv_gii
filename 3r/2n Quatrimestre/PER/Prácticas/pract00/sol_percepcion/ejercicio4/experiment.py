#!/usr/bin/python

import sys
import math
import numpy as np
import matplotlib.pyplot as plt
from perceptron import perceptron
from linmach import linmach

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

N,D=X.shape;
labs=np.unique(xl); C=labs.size;
np.random.seed(23); perm=np.random.permutation(N);
X=X[perm]; xl=xl[perm];

# Selecting a percentage of the training data
Ntr=round(trper/100*N);
Xtr=X[:Ntr,:]; xltr=xl[:Ntr];

# Selecting a percentage of the dev data
Ndv=round(dvper/100*N);
Xdv=X[N-Ndv:,:]; xldv=xl[N-Ndv:];

#print('#       a        b   k  Etr  Etr (%)  Edv  Edv (%)      Idv (%)');
#print('#-------- -------- --- ---- -------- ---- -------- ------------');

for a in alphas:
  for b in bs:
    tr=np.concatenate((Xtr, xltr.reshape(Ntr,1)),axis=1);
    dv=np.concatenate((Xdv, xldv.reshape(Ndv,1)),axis=1);
    w,Etr,Edv,k=perceptron(tr,dv,b,a,K);
    perror=Edv/Ndv;
    epsilon=1.96*np.sqrt(perror*(1-perror)/Ndv);
    lowr=np.maximum(0,(perror-epsilon)*100);
    highr=np.minimum(100,(perror+epsilon)*100);
    #for i in range(1,k+1):
    #  print(' %8.3f %8.1f %3d %4d     %3.1f %4d     %3.1f [%3.1f, %3.1f]' % (a,b,i,Etr[i-1],Etr[i-1]/Ntr*100,Edv[i-1],perror[i-1]*100,lowr[i-1],highr[i-1]));
    plt.plot(np.arange(0,k+1),Etr/Ntr*100,'--xk',label='Train');
    plt.plot(np.arange(0,k+1),Edv/Ndv*100,'-+k',label='Dev');
    plt.xlabel('Iteration'); plt.ylabel('Error');
    plt.xticks(np.arange(0,k,10));
    plt.legend(); #plt.show();
    fn='perceptron.a%.1e.b%.1e.K%d.tr%d.dv%d.eps' % (a,b,K,trper,dvper);
    plt.savefig(fn, format='eps')
