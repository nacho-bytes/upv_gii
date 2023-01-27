#!/usr/bin/env python
import sys, os
import numpy as np
from sklearn import svm
import pickle

if len(sys.argv)!=4:
  print('Usage: %s <cs> <gammas> <rs>' % sys.argv[0]);
  sys.exit(1);

tr=np.load('MNIST\\train-images-idx3-ubyte.pca20.npz');  tr=tr[tr.files[0]];
trl=np.load('MNIST\\train-labels-idx1-ubyte.pca20.npz'); trl=trl[trl.files[0]];
S=max(tr.max(),abs(tr.min())); tr/=S;

C=np.fromstring(sys.argv[1], dtype=float, sep=" ");
G=np.fromstring(sys.argv[2], dtype=float, sep=" ")
R=np.fromstring(sys.argv[3], dtype=float, sep=" ")

folder = 'sigmoid\\models\\'

for r in R:
  for g in G:
    for c in C:
      filename = 'sigmoid_save' + '_r' + str(r) + '_g' + str(g) + '_c' + str(c) + '.clf'

      if not os.path.exists(folder + filename):
        clf=svm.SVC(kernel='sigmoid', C=c, gamma=g, coef0=r).fit(tr,trl);
        pickle.dump(clf,open(folder + filename,'wb'));
      else:
        clf=pickle.load(folder + filename,'rb')

      etr=(trl!=clf.predict(tr)).mean();
      print(filename + "\t%8g %8g %8g %8.2f" % (r,g,c,etr*100));
      os.system('du -sh ' + folder + filename)