import numpy as np

def linmach(w,X):
  g=X@w;
  cstar=np.argmax(g,axis=1);
  return cstar;
