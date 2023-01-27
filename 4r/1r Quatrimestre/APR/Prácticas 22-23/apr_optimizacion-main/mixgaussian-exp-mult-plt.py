import numpy as np
import matplotlib.pyplot as plt

# nK's nRC's %tr %dv
# rc k tr dv

with open('mixgaussian-exp.out') as file:
  header = file.readline().split(' ')
  K=int(header[0])
  RC=int(header[1])
  trp=header[2]
  dvp=header[3]

data=np.loadtxt('mixgaussian-exp.out', skiprows=1)

for rc in range(RC):
  rcv=data[rc*K][0]
  rci=rc*K; rcf=(rc+1)*K
  fig, ax = plt.subplots()
  ax.set_title('MNIST con ' + trp + '% entrenamiento y '+ dvp + '% validación. rc =' + str(rcv));
  ax.grid();
  ax.set_xlabel('Número de componentes');
  ax.set_xlim([0.9,220]);
  ax.set_xscale('log');
  ax.set_xticks([1,2,5,10,20,50,100,200])
  ax.set_xticklabels([1,2,5,10,20,50,100,200])
  ax.set_ylim([0,5]);
  ax.set_ylabel('error de clasificación');
  ax.set_yticks(range(5))
  ax.plot(data[rci:rcf,1], data[rci:rcf,2], label='tr', lw=2, marker='o', markersize=10)
  ax.plot(data[rci:rcf,1], data[rci:rcf,3], label='dv', lw=2, marker='x', markersize=10)
  ax.legend();
  plt.savefig('plots/mixgaussian-K-rc' + str(rcv) + '.pdf');
  #plt.show();
