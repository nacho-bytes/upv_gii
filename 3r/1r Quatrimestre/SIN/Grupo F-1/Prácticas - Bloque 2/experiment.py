#!/usr/bin/python
import sys; 
import math; 
import numpy as np
from perceptron import perceptron; 
from confus import confus
from linmach import linmach

if len(sys.argv)!=4:
  print('Usage: %s <data> <alphas> <bs>' % sys.argv[0]);
  sys.exit(1);

#Leer argumentos de la línea de comandos
data=np.loadtxt(sys.argv[1]);
alphas=np.fromstring(sys.argv[2],sep=' ');
bs=np.fromstring(sys.argv[3],sep=' ');

# ...
# A COMPLETAR POR EL ALUMNO
# Incluir todos los pasos necesarios para preparar el entrenamiento del Perceptron.
# No hay que olvidarse de preparar los datos y hacer el split
# entrenamiento/validación 70/30%.
# ...

for a in alphas:
  for b in bs:
    w,E,k=perceptron(train,b,a); 
    rl=np.zeros((M,1));
    # ...
    # A COMPLETAR POR EL ALUMNO
    # Clasificar muestras de validación y mostrar en formato tabla los resultados completos
    # ...
