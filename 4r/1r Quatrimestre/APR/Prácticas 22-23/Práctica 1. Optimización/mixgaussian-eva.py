import sys
import math
import numpy as np
import pickle
from sklearn import mixture

if len(sys.argv)!=4:
  print('Usage: %s <dvdata> <dvlabels> <model>' % sys.argv[0]);
  sys.exit(1);

Xdv= np.load(sys.argv[1])['X'];
xldv=np.load(sys.argv[2])['xl'];
fn=sys.argv[3];

# Normalise data
mu=np.mean(Xdv,axis=0);
sigma=np.std(Xdv,axis=0);
sigma[sigma==0]=1;
Xdv=(Xdv-mu)/sigma;

model = pickle.load(open(fn, 'rb'))

C=len(model)
M=Xdv.shape[0];
gdv=np.zeros((C,M));
for c,(pc,gmm) in enumerate(model):
  gdv[c]=math.log(pc)+gmm.score_samples(Xdv);

# Classification of training and eval sets for error estimation
labs=np.unique(xldv).astype(int);
idx=np.argmax(gdv,axis=0);
edv=np.mean(np.not_equal(labs[idx],xldv))*100;

print('  edv')
print('-----')
print(f'{edv:5.2f}');
