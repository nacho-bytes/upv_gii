import sys
import numpy as np
from ej1 import media

if len(sys.argv)!=3:
    print('Usage: %s <trdata> <trlabels>' % sys.argv[0]);
    sys.exit(1);

X= np.load(sys.argv[1])['X'];
xl=np.load(sys.argv[2])['xl'];

labs = np.unique(xl).astype(int);
m = np.zeros((np.shape(X)[1],np.shape(labs)[0]));

for c in labs:
    Xc = X[np.where(xl==c)];
    m[:,c] = media(Xc);
    # m[:,c]=np.mean(Xc,axis=0);

print(m[:50,0])