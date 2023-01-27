import numpy as np
import matplotlib.pyplot as plt

with open('mlp.out') as file:
  header = file.readline().split(' ')
  batchs=int(header[0])
  layers=int(header[1])
  neurons=int(header[2])
  learning_rates=int(header[3])
  epochs=int(header[4])

d=np.loadtxt('mlp.out', skiprows=1)

for b in range(batchs):
  bv=d[b*layers*neurons*learning_rates*epochs][0]
  bi=b*layers*neurons*learning_rates*epochs; hf=(b+1)*layers*neurons*learning_rates*epochs
  for l in range(layers):
    lv=d[l*neurons*learning_rates*epochs][1]
    li=bi + l*neurons*learning_rates*epochs; lf=bi + (l+1)*neurons*learning_rates*epochs
    for n in range(neurons):
      nv=d[n*learning_rates*epochs][2]
      ni=li + n*learning_rates*epochs; hf=li + (n+1)*learning_rates*epochs
      for lr in range(learning_rates):
        lrv=d[lr*epochs][3]
        lri=ni + lr*epochs; lrf=ni + (lr+1)*epochs

        fig, ax = plt.subplots()
        ax.set_title('Red neuronal con tamaño de batch %s, \n%s capas, %s neuronas por capa \ny un factor de aprendizaje de %s entrenado durante %s épocas' %\
          (str(bv), str(lv), str(nv), str(lrv), str(epochs)));
        ax.grid();
        ax.set_xscale('linear');
        ax.set_xlim([1,12]);
        ax.set_xlabel('epoch');
        ax.set_ylim([60,100]);
        ax.set_ylabel('tasa de acierto');
        ax.plot(d[lri:lrf,4], d[lri:lrf,5], label='tacc', lw=2, marker='o', markersize=10, color="green")
        ax2=ax.twinx()
        ax2.set_ylabel('tasa de perdida')
        ax2.set_ylim([0, 3])
        ax2.plot(d[lri:lrf,4], d[lri:lrf,6], label='tloss', lw=2, marker='x', markersize=10, color="blue")
        plt.savefig('mlp_plot\\mlp_b' + str(bv) + '_l' + str(lv) + '_n' + str(nv) + '_lr' + str(lrv) + '_e' + str(epochs) + '.pdf');
        plt.close()
        #plt.show();
