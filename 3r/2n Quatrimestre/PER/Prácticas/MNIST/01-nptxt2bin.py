#!/usr/bin/python
  
import sys
import numpy as np

if len(sys.argv)!=5:
  print('Usage: %s <trdata> <trlabels> <tedata> <telabels>' % sys.argv[0]);
  sys.exit(1);

X= np.loadtxt(sys.argv[1]);
xl=np.loadtxt(sys.argv[2]);
Y= np.loadtxt(sys.argv[3]);
yl=np.loadtxt(sys.argv[4]);

np.savez_compressed(sys.argv[1].split('.')[0]+'.npz', X=X)
np.savez_compressed(sys.argv[2].split('.')[0]+'.npz', xl=xl)
np.savez_compressed(sys.argv[3].split('.')[0]+'.npz', Y=Y)
np.savez_compressed(sys.argv[4].split('.')[0]+'.npz', yl=yl)
