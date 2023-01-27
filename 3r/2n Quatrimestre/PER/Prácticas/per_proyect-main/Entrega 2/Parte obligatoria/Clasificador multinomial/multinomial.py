import numpy as np

def multinomial(Xtr,xltr,Xdv,xldv,epsilons):
    etqs = np.unique(xltr).astype(int)
    N = Xtr.shape[0]
    D = Xtr.shape[1]
    # Calculo de parametros
    probcs = np.zeros(len(etqs))
    pcs = np.zeros((len(etqs), D))
    for ind, etq in enumerate(etqs):
        idc = np.where(xltr==etq)
        Nc = len(idc)
        probcs[ind] = Nc/N
        Xc = Xtr[idc]
        suma = np.sum(Xc, axis=0)
        pcs[ind] = suma/np.sum(suma)

    wc0 = np.log(probcs)
    edv = np.zeros((len(epsilons), 1))
    # Suavizado de parametros y clasificacion
    for i,e in enumerate(epsilons):
        pce = pcs + e
        pcsuave = pce/(1 + D*e)
        wc = np.transpose(np.log(pcsuave))
        G = Xdv@wc + wc0
        indexes = np.argmax(G, axis=1)
        clasif = etqs[indexes]
        edv[i] = np.mean(xldv!=clasif)*100;
    return edv;