#!/usr/bin/python3

import sys
import math
import numpy as np
from gaussian import gaussian
from pca import pca

if len(sys.argv)!=7:
  print('Usage: %s <trdata> <trlabels> <tedata> <telabels> <a> <k>' % sys.argv[0]);
  sys.exit(1);

X= np.load(sys.argv[1])['X'];
xl=np.load(sys.argv[2])['xl'];
Y= np.load(sys.argv[3])['Y'];
yl=np.load(sys.argv[4])['yl'];
a=float(sys.argv[5]);
k=int(sys.argv[6]);

m,W = pca(X)
Wk = W[:,:k]
Xtrk = (X - m) @ Wk 
Yk = (Y - m) @ Wk 


# Archivo de salida
file = open("pca+gaussian-eva.out", "w")
err = gaussian(Xtrk, xl, Yk, yl, [a])
file.write('Alpha = ' + str(a) + '  K = ' + str(k)); file.write(' ')
file.write(str(err[0])); file.write('\n')
file.close()