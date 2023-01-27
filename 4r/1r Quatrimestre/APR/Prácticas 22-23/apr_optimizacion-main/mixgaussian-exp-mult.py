import sys
import os
import math
import numpy as np
import pickle
from sklearn import mixture

if len(sys.argv)!=7:
  print('Usage: %s <trdata> <trlabels> <%%trper> <%%dvper> <Ks> <RCs>' % sys.argv[0]);
  sys.exit(1);

X= np.load(sys.argv[1])['X'];
xl=np.load(sys.argv[2])['xl'];
trper=int(sys.argv[3]);
dvper=int(sys.argv[4]);

K=np.fromstring(sys.argv[5], dtype=int, sep=" ")
rc=np.fromstring(sys.argv[6], dtype=float, sep=" ")
seed=23;

N=X.shape[0];
np.random.seed(seed); perm=np.random.permutation(N);
X=X[perm]; xl=xl[perm];

# Selecting a subset for train and dev sets
Ntr=round(trper/100*N);
Xtr=X[:Ntr,:]; xltr=xl[:Ntr];
Ndv=round(dvper/100*N);
Xdv=X[N-Ndv:,:]; xldv=xl[N-Ndv:];

labs=np.unique(xltr).astype(int);
C=labs.shape[0];
N,D=Xtr.shape;
M=Xdv.shape[0];
gtr=np.zeros((C,N));
gdv=np.zeros((C,M));

# Normalise data
mu=np.mean(Xtr,axis=0);
sigma=np.std(Xtr,axis=0);
sigma[sigma==0]=1;
Xtr=(Xtr-mu)/sigma;
Xdv=(Xdv-mu)/sigma;

file = open("mixgaussian-exp.out", "w")
file.write(str(len(K)) + ' ' + str(len(rc)) + ' ' + str(trper) + ' ' + str(dvper) + '\n')
print('  K      rc   etr   edv')
print('--- ------- ----- -----')

for r in rc:
  for k in K:
    filename = 'models/gmm.K' + str(k) + '.rc' + str(r) + '.mod'
  # Parameter estimation and soring samples
    if not os.path.isfile(filename):
      model=[]
      for c,lab in enumerate(labs):
        Xtrc=Xtr[xltr==lab];
        Nc=Xtrc.shape[0];
        pc=Nc/N;
        gmm=mixture.GaussianMixture(n_components=k, reg_covar=r, random_state=seed);
        gmm.fit(Xtrc);
        gtr[c]=math.log(pc)+gmm.score_samples(Xtr);
        gdv[c]=math.log(pc)+gmm.score_samples(Xdv);
        model.append((pc,gmm));
        pickle.dump(model, open(filename, 'wb'))
    else:
      model = pickle.load(open(filename, "rb"))
      for c,lab in enumerate(labs):
        pc, gmm = model[c]
        gtr[c]=math.log(pc)+gmm.score_samples(Xtr);
        gdv[c]=math.log(pc)+gmm.score_samples(Xdv);
      
    # Classification of training and eval sets for error estimation
    idx=np.argmax(gtr,axis=0);
    etr=np.mean(np.not_equal(labs[idx],xltr))*100;
    idx=np.argmax(gdv,axis=0);
    edv=np.mean(np.not_equal(labs[idx],xldv))*100;

    file.write(str(r)); file.write(' ')
    file.write(str(k)); file.write(' ')
    file.write(str(etr)); file.write(' ')
    file.write(str(edv)); file.write('\n')
    print(f'{k:3} {r:3.1e} {etr:5.2f} {edv:5.2f}');
    
    #os.system('du -sh ' + filename)