import numpy as np
from numpy import linalg as LA

"""
Función que recibe como entrada los datos de entrenamiento
dispustos en filas y devuelve el vector media m y la matriz 
de proyección W donde los vectores están dispuestos de mayor
a menor valor propio asociado por filas
"""
def pca(X):
    # Vector media de los datos de entrenamiento
    # resultado de sumar cada dimension (por columnas) 
    # y dividir entre el número de muestras  
    m = np.mean(X, axis=0)
    # Se restan los datos a la media
    Xm = X - m
    # Matriz de covarianza sigma resultado del 
    # coeficiente entre Xm traspuesta consigo misma
    # dividido por el número de muestras
    sigma = (np.transpose(Xm) @ Xm) / Xm.shape[0]
    # Cálculo de los valores propios v y la matriz
    # de vectores propios
    v, W = LA.eig(sigma)
    # Órden de los vectores propios ordenados de
    # mayor a menor valor propio  
    sort_index = np.argsort(v)[::-1]
    # Ordenamos W a partir de este órden 
    W = W[:,sort_index] 
    W = W.real
    return m, W