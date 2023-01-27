# This function computes LDA on data X and class labels xl
# providing the projection vectors in W
import numpy as np
from scipy.linalg import eig

def lda(X,xl):

  N,D = X.shape;
  labs=np.unique(xl).astype(int);
  C=labs.shape[0];

  # Computing Sw
  Sw=np.zeros((D,D));
  muc=np.zeros((C,D));
  Nc=np.zeros(C);
  for c,lab in enumerate(labs):
    idc=np.where(xl==lab)[0];
    Xc=X[idc,:];
    Nc[c]=idc.shape[0];
    muc[c]=np.sum(Xc,axis=0)/Nc[c];
    Sw=Sw+(np.transpose(Xc-muc[c])@(Xc-muc[c]))/Nc[c];

  # Computing Sw
  Sb=np.zeros((D,D));
  mu=np.sum(X,axis=0)/N;
  for c,lab in enumerate(labs):
    Sb=Sb+Nc[c]*((muc[c]-mu)[:,None]@(muc[c]-mu)[None]);

  # Computing generilized eigenvalues and eigenvectors
  eigval, eigvec = eig(Sb,Sw);

  # Highest to lowest needs reverse ordering : seq[start:stop:step]
  idx = eigval.real.argsort()[::-1];
  W = eigvec.real[:,idx[:C-1]];

  return W;
