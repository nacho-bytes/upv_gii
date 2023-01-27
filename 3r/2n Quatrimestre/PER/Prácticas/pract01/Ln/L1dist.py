import numpy as np

def L1dist(X,Y):
    D=np.zeros((X.shape[0],Y.shape[0]))
    for i in range(X.shape[0]):
        D[i] = np.sum(np.absolute(X[i]-Y),axis=1)
    return D
