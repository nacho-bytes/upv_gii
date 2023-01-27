import sys
import math
import numpy as np
from multinomial import multinomial


if len(sys.argv)!=6:
  print('Usage: %s <trdata> <trlabels>  <eps> <%%trper> <%%dvper>' % sys.argv[0]);
  sys.exit(1);

X= np.load(sys.argv[1])['X'];
xl=np.load(sys.argv[2])['xl'];
trper=int(sys.argv[4]);
dvper=int(sys.argv[5]);
eps=np.fromstring(sys.argv[3],dtype=float,sep=' ');

N=X.shape[0];
np.random.seed(23); perm=np.random.permutation(N);
X=X[perm]; xl=xl[perm];

# Selecting a subset for train and dev sets
Ntr=round(trper/100*N);
Xtr=X[:Ntr]; xltr=xl[:Ntr];
Ndv=round(dvper/100*N);
Xdv=X[N-Ndv:]; xldv=xl[N-Ndv:];

edv = multinomial(Xtr, xltr, Xdv, xldv, eps)

file = open("multinomial-exp.out", "w")

for i in range(len(edv)):
  file.write(str(eps[i])); file.write(' ')
  file.write(str(edv[i])); file.write('\n')

file.close()