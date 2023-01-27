import numpy as np
import matplotlib.pyplot as plt

data=np.loadtxt('mixgaussian-exp.out')
fig, ax = plt.subplots()
ax.set_title('MNIST con 90% entrenamiento y 10% validación');
ax.grid();
ax.set_xlabel('Número de componentes');
ax.set_xlim([0.9,220]);
ax.set_xscale('log');
ax.set_xticks([1,2,5,10,20,50,100,200])
ax.set_xticklabels([1,2,5,10,20,50,100,200])
ax.set_ylim([0,6]);
ax.set_ylabel('error de clasificación');
ax.set_yticks(range(7))
ax.plot(data[:,0], data[:,1], label='tr', lw=2, marker='o', markersize=10)
ax.plot(data[:,0], data[:,2], label='dv', lw=2, marker='x', markersize=10)
ax.legend();
plt.savefig('mixgaussian-K.pdf');
lt.show();
