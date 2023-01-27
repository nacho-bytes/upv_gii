#!/usr/bin/env python
import sys
import numpy as np

if len(sys.argv)!=8:
  print('%s <dat> <lab> <tr%%> <dv%%> <seed> <tr> <dv>' % sys.argv[0]);
  sys.exit(1);

X=np.load(sys.argv[1]);  X=X[X.files[0]];    # imágenes MNIST en npz
xl=np.load(sys.argv[2]); xl=xl[xl.files[0]]; # etiquetas MNIST en npz
trper=int(sys.argv[3]); # porcentaje para training
dvper=int(sys.argv[4]); # porcentaja para dev
seed=int(sys.argv[5]);  # semilla
tr='parts\\' + sys.argv[6];         # nombre ficheros tr (tr imágenes y trl labels)
dv='parts\\' + sys.argv[7];         # nombre ficheros dv (dv imágenes y dvl labels)
N=X.shape[0];           # número de datos

# permutamos aleatoriamente todos los datos
np.random.seed(seed); p=np.random.permutation(N); X=X[p]; xl=xl[p];

# guardamos imágenes y labels de tr y dv en formato npz
Ntr=round(trper/100*N); Ndv=round(dvper/100*N);
np.savez_compressed(tr,     dat=X[:Ntr]);
np.savez_compressed(tr+'l', dat=xl[:Ntr])
np.savez_compressed(dv,     dat=X[N-Ndv:]);
np.savez_compressed(dv+'l', dat=xl[N-Ndv:])
