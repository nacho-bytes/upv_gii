#!/usr/bin/env python
import numpy as np
import matplotlib.pyplot as plt

with open('polynomial\\polynomial.out') as file:
  header = file.readline().split(' ')
  D=int(header[0])
  R=int(header[1])
  G=int(header[2])
  C=int(header[3])

data=np.loadtxt('polynomial\\polynomial.out', skiprows=1)

# TODO
for d in range(D):
  dv=data[d*R*G*C][0]
  di= d*R*G*C; df= (d+1)*R*G*C
  for r in range(R):
    rv=data[r*G*C][1]
    ri=di + r*G*C ; rf= di + (r+1)*G*C
    for g in range(G):
      gv=data[g*C][2]
      gi=ri + g*C; gf=ri + (g+1)*C

      fig, ax = plt.subplots()
      ax.set_title('Kernel polinómico con degree=' + str(dv) + ', \ncoef0=' + str(rv) + ' y gamma=' + str(gv) +' en MNIST con tr 12k y dv 6k');
      ax.grid();
      ax.set_xscale('log');
      ax.set_xlim([1e-2,1.5e4]);
      ax.set_xlabel('C');
      ax.set_ylim([0,6]);
      ax.set_ylabel('error de clasificación');
      ax.plot(data[gi:gf,3], data[gi:gf,4], label='tr', lw=2, marker='o', markersize=10)
      ax.plot(data[gi:gf,3], data[gi:gf,5], label='dv', lw=2, marker='x', markersize=10)
      ax.legend();
      plt.savefig('polynomial\\plots\\polynomial' + '_d' + str(dv) + '_r' + str(rv) + '_g' + str(gv) + '_C.pdf');
      plt.close()
      #plt.show();
