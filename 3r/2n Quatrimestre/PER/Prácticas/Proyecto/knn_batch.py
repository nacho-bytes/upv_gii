import math
import numpy as np
from scipy import stats
from L2dist import L2dist

# Computes the error rate of k nearest neighbors 
# of the test set Y with respect to training set X
# X  is a n x d training data matrix 
# xl is a n x 1 training label vector 
# Y is a m x d test data matrix
# yl is a m x 1 test label vector 
# k is the number of nearest neigbors
def knn(X,xl,Y,yl,k):

  N=X.shape[0];
  M=Y.shape[0];
  numbatches=math.ceil(N*M*8/math.pow(1024,3))*4;
  if numbatches<1:
    numbatches=1;

  batchsize=math.ceil(M/numbatches);

  classification=np.array([]);

  # The classification of the test samples is split 
  # into batches to make sure that the distance matrix D 
  # computed in the distance function fits into memory
  for i in range(numbatches):

    # Building batches of test samples of batchsize
    Ybatch=Y[i*batchsize:min((i+1)*batchsize,M),:];

    # D is a distance matrix where training samples are by rows 
    # and test sample by columns
    D = L2dist(X,Ybatch);

    # Sorting descend per column from closest to farthest
    idx = np.argsort(D,axis=0);

    # indexes of k nearest neighbors of each test sample
    idx = idx[:k,:];

    # Classification of the test samples in the majority class 
    # among the k nearest neighbors using the mode
    classbatch,_ = stats.mode(xl[idx]);
    classification = np.concatenate((classification,classbatch[0]));

  # percentage of error
  err = np.mean(yl!=classification)*100;

  return err;
