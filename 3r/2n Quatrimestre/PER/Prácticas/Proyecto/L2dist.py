# This function computes the L2 distance between the N samples 
# in the training set X and the M samples in the test set Y. 
# Samples in X and Y are arranged by rows and the resulting 
# distance matrix D is N x M where each position (i,j) 
# is the L2 distance between the i-th training sample and 
# the j-th test sample 

import numpy as np

# Efficient implementation of L2 distance without square root
# d(x,y) = \sum_d (x_d - y_d)^2 = 
#        = \sum_d x_d^2 + y_d^2 - 2*x_d*y_d
#        = \sum_d x_d^2 + \sum_d y_d^2 - 2 * \sum_d x_d*y_d

def L2dist(X,Y):
  XX = np.sum(np.square(X),axis=1);
  YY = np.sum(np.square(Y),axis=1);
  # XX and YY were converted into row vectors at sum
  # So XX needs to be a column vector and YY is fine as row vector
  D  = XX[:,None] + (YY - 2*X@np.transpose(Y));
  return D;

# Non-efficient implementation that computes the L2 distance for 
# each training sample with respect to all samples in the test set
#def L2dist(X,Y):
#  D=np.zeros((X.shape[0],Y.shape[0]));
#  for i in range(X.shape[0]):
#    D[i] = np.sum(np.square(X[i]-Y),axis=1);
#  return D;

# Even less efficient implementation that computes the L2 distance 
# for each training sample with each sample in the test set
#def L2dist(X,Y):
#  D=np.zeros((X.shape[0],Y.shape[0]));
#  for i in range(X.shape[0]):
#    for j in range(Y.shape[0]):
#      D[i,j] = np.sum(np.square(X[i]-Y[j]));
#  return D;
