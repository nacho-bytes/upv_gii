import numpy as np

def multinomial(Xtr, xltr, Xdv, xldv, epsilons):
    N = Xtr.shape[0] # Número de muestras
    D = Xtr.shape[1] # Número de dimensiones 
    labs = np.unique(xltr) # Vector de clases  
    labs = labs.astype(int)
    C = len(labs) # Número de clases 
    probc = np.zeros((C)) # Probabilidad de las clases 
    pc = np.zeros((C,D)) # Probabilidad de la dimensión por clase 

    for i,c in enumerate(labs): # Para cada clase 
        idx = np.where(xltr == c) # Índices de la clase en cuestión 
        Xc = Xtr[idx] # Muestras de esa clase 
        Nc = Xc.shape[0] # Número de muestras de esa clase 
        suma = np.sum(Xc, axis=0) # Vector suma de las muestras por dimensiones
        pc[i] = suma / np.sum(suma) # Porbabilidad por dimensión por clase
        probc[i] = Nc/N # Probabilidad de la clase

    edv = np.zeros((len(epsilons))) # Vector de errores inicializado a 0
    sprobc = np.log(probc)
    for i,ep in enumerate(epsilons): # Para cada epsilon 
        spc = (pc + ep) / (1 + D*ep)
        spc = np.transpose(np.log(spc))
       # spc = (pc+ep) / (np.sum((pc+ep),axis=1)) # Cálculo de la probabilidad suavizada
        Gs = Xdv@spc + sprobc # Matriz de probabilidad 
        indexClassif = np.argmax(Gs, axis=1) # Clasificación por máxima verosimilitud 
        clasif = labs[indexClassif] 
        edv[i] = np.mean(xldv!=clasif) * 100 # Cálculo del error 
    return edv