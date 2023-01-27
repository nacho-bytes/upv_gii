#!/usr/bin/env python
import numpy as np
import matplotlib.pyplot as plt

d=np.loadtxt('linear\\linear.out')
fig, ax = plt.subplots()
ax.set_title('kernel lineal en MNIST con tr 12k y dv 6k');
ax.grid();
ax.set_xscale('log');
ax.set_xlim([1e-2,1.5e4]);
ax.set_xlabel('C');
ax.set_ylim([8,15]);
ax.set_ylabel('error de clasificación');
ax.plot(d[:,0], d[:,1], label='tr', lw=2, marker='o', markersize=10)
ax.plot(d[:,0], d[:,2], label='dv', lw=2, marker='x', markersize=10)
ax.legend();
plt.savefig('linear\\plots\\linear_C.pdf');
plt.show();
