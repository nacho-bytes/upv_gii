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

  # D is a distance matrix where training samples are by rows 
  # and test sample by columns
  print(X.shape)
  print(Y.shape)
  D = L2dist(X,Y);

  # Sorting descend per column from closest to farthest
  idx = np.argsort(D,axis=0);

  # indexes of k nearest neighbors of each test sample
  idx = idx[:k,:];

  # Classification of the test samples in the majority class 
  # among the k nearest neighbors using the mode
  classif,_ = stats.mode(xl[idx]);
  classification = classif[0];

  # percentage of error
  err = np.mean(yl!=classification)*100;

  return err;