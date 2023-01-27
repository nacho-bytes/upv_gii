>>> import numpy as np
>>> X=np.array([[3,3,6,6,9,9],[3,9,6,3,6,0]])
>>> X
array([[3, 3, 6, 6, 9, 9],
       [3, 9, 6, 3, 6, 0]])
>>> X=np.transpose(X)
>>> X
array([[3, 3],
       [3, 9],
       [6, 6],
       [6, 3],
       [9, 6],
       [9, 0]])
>>> xl=np.array([1,1,1,2,2,2])
>>> xl
array([1, 1, 1, 2, 2, 2])
>>> id1=np.where(xl==1)
>>> id1
(array([0, 1, 2]),)
>>> X[id1]
array([[3, 3],
       [3, 9],
       [6, 6]])
>>> X1=X[id1]
>>> X1
array([[3, 3],
       [3, 9],
       [6, 6]])
>>> mu1=np.sum(X1,axis=0)/X1.shape[0]
>>> mu1
array([4., 6.])
>>> X1.shape[0]
3
>>> X1.shape[1]
2
>>> (X1-mu1)
array([[-1., -3.],
       [-1.,  3.],
       [ 2.,  0.]])
>>> np.transpose(X1-mu1)
array([[-1., -1.,  2.],
       [-3.,  3.,  0.]])
>>> np.transpose(X1-mu1)@(X1-mu1)
array([[ 6.,  0.],
       [ 0., 18.]])
>>> Sigma1=(np.transpose(X1-mu1)@(X1-mu1))/X1.shape[0]
>>> Sigma1
array([[2., 0.],
       [0., 6.]])
>>> id2=np.where(xl==2)
>>> X2=X[id2]
>>> mu2=np.sum(X2,axis=0)/X2.shape[0]
>>> Sigma2=(np.transpose(X2-mu2)@(X2-mu2))/X2.shape[0]
>>> Sigma2
array([[2., 0.],
       [0., 6.]])
>>> X1.shape[0]
3
>>> P1=X1.shape[0]/X.shape[0]
>>> P2=X2.shape[0]/X.shape[0]
>>> P1
0.5
>>> Sigma=P1*Sigma1+P2*Sigma2
>>> Sigma
array([[2., 0.],
       [0., 6.]])
>>> mu1
array([4., 6.])
>>> mu2
array([8., 3.])
>>> Y=np.array([[3,6],[9,3]])
>>> Y
array([[3, 6],
       [9, 3]])
>>> np.linalg.pinv(Sigma)
array([[0.5       , 0.        ],
       [0.        , 0.16666667]])
>>> np.linalg.inv(Sigma)
array([[0.5       , 0.        ],
       [0.        , 0.16666667]])
>>> mu1@np.linalg.inv(Sigma)
array([2., 1.])
>>> w1=mu1@np.linalg.inv(Sigma)
>>> w2=mu2@np.linalg.inv(Sigma)
>>> w1
array([2., 1.])
>>> w2
array([4. , 0.5])
>>> import math
>>> math.log(2.78)
1.0224509277025455
>>> w10=math.log(0.5)-0.5*mu1@w1
>>> w20=math.log(0.5)-0.5*mu2@w2
>>> Y@np.transpose(w1)+w10
array([ 4.30685282, 13.30685282])
>>> Y@np.transpose(w2)+w20
array([-2.44314718, 20.05685282])
