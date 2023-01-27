#!/usr/bin/env python
import sys
import numpy as np
from sklearn import svm

if len(sys.argv)!=5:
  print('Usage: %s <cs> <gammas> <rs> <ds>' % sys.argv[0]);
  sys.exit(1);

tr=np.load('parts\\tr.npz');  tr=tr[tr.files[0]];
trl=np.load('parts\\trl.npz'); trl=trl[trl.files[0]];
dv=np.load('parts\\dv.npz');  dv=dv[dv.files[0]];
dvl=np.load('parts\\dvl.npz'); dvl=dvl[dvl.files[0]];

C=np.fromstring(sys.argv[1], dtype=float, sep=" ")
G=np.fromstring(sys.argv[2], dtype=float, sep=" ")
R=np.fromstring(sys.argv[3], dtype=float, sep=" ")
D=np.fromstring(sys.argv[4], dtype=float, sep=" ")

# normalizamos las características en [-1,1]
S=max(tr.max(),abs(tr.min())); tr/=S; dv/=S;

# probamos diferentes valores para el parámetro de penalización C, C>0,
# y hallamos el error en tr y dv para cada uno de ellos
with open('polynomial/polynomial.out', 'w') as fh:
  fh.write("%g %g %g %g\n" % (len(D), len(R), len(G), len(C)))

  for d in D:
    for r in R:
      for g in G:
        for c in C:
          clf=svm.SVC(kernel='poly',C=c, gamma=g, coef0=r, degree=d).fit(tr, trl)
          etr=(trl!=clf.predict(tr)).mean();
          edv=(dvl!=clf.predict(dv)).mean();
          fh.write("%g %g %g %g %.2f %.2f\n" % (d,r,g,c,etr*100,edv*100));