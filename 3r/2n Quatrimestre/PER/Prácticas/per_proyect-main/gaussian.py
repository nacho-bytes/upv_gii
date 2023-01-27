import numpy as np

def gaussian(Xtr, xltr, Xdv, xldv, alphas):
    N = Xtr.shape[0] # Número de muestras
    D = Xtr.shape[1] # Número de dimensiones 
    labs = np.unique(xltr) # Vector de clases  
    labs = labs.astype(int)
    C = len(labs) # Número de clases 
    probc = np.zeros((C)) # Probabilidad de las clases 
    muc = np.zeros((C,D))
    covx = np.zeros((C,N,N))

    for i,c in enumerate(labs): # Para cada clase 
        idx = np.where(xltr == c) # Índices de la clase en cuestión 
        Xc = Xtr[idx] # Muestras de esa clase 
        Nc = Xc.shape[0] # Número de muestras de esa clase 
        probc[i] = Nc/N # Probabilidad de la clase
        suma = np.sum(Xc, axis=0) # Vector suma de las muestras por dimensiones
        muc[i] = suma / Nc
        xcmmuc = Xc - muc[i]
        sumac = np.sum(xcmmuc @ np.transpose(xcmmuc), axis=0)
        covx[i] = sumac / Nc

    for alpha in alphas:
        acovx = alpha * covx + (1 - alpha) * np.identity(D)
        iacovx = np.linalg.pinv(acovx)
        G = np.zeros(C)
        for i in range(C):
            Wc = - iacovx[i] / 2
            wc = iacovx[i] @ muc[i]
            wc0 = np.log(probc[i]) - logdet(acovx[i]) / 2
            Gc[i] = np.transpose(Xtr) @ Wc @ Xtr + np.tranpose(wc) @ Xtr + wc0  

    return edv

def logdet(X):
    w, v = np.eig(X)
    return np.sum(np.log(w))

def pxc(pc[c], mu[c], sigma[c],X):
