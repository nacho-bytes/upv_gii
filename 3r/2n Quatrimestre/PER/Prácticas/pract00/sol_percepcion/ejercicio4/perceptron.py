import numpy as np
from linmach import linmach

def perceptron(tr,dv,b=0.1,a=1.0,K=200):
  (Ntr,L)=tr.shape; D=L-1; 
  (Ndv,_)=dv.shape;
  labs=np.unique(tr[:,L-1]); C=labs.size;
  w = np.zeros((L,C)); Etr=np.zeros(K); Edv=np.zeros(K);
  for k in range(K):
    E=0;
    for n in range(Ntr):
      xn=np.concatenate(([1],tr[n,:D]));
      cn=np.where(labs==tr[n,L-1])[0][0];
      er=0; g=np.dot(w[:,cn],xn);
      for c in range(C):
        if c != cn and np.dot(w[:,c],xn) + b > g:
          w[:,c] = w[:,c] - a*xn; er=1;
      if er==1:
        w[:,cn] = w[:,cn] + a*xn; E=E+1;
    Etr[k]=E;
    # Classification of dev set
    dvec=labs[linmach(w,np.concatenate((np.ones((Ndv,1)),dv[:,:D]),axis=1))];
    Edv[k]=np.sum(np.not_equal(dv[:,L-1],dvec));
    if E==0: 
      break;
  Etr=np.resize(Etr,k+1);
  Edv=np.resize(Edv,k+1);
  return w,Etr,Edv,k;
