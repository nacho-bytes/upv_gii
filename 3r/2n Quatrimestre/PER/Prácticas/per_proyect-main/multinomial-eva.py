#!/usr/bin/python3

import sys
import math
import numpy as np
from multinomial import multinomial

if len(sys.argv)!=6:
  print('Usage: %s <trdata> <trlabels> <tedata> <telabels> <e>' % sys.argv[0]);
  sys.exit(1);

X= np.load(sys.argv[1])['X'];
xl=np.load(sys.argv[2])['xl'];
Y= np.load(sys.argv[3])['Y'];
yl=np.load(sys.argv[4])['yl'];
e=float(sys.argv[5]);

# Archivo de salida
file = open("multinomial-eva.out", "w")
err = multinomial(X, xl, Y, yl, [e])
file.write(str(e)); file.write(' ')
file.write(str(err[0][0])); file.write('\n')
file.close()