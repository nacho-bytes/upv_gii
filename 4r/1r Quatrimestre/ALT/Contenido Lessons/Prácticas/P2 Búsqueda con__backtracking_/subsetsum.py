def subsetSum(valores, objetivo):
    N = len(valores)
    sol, pesoDerecha = [None]*N, [0]*N
    for i in range(N-2,-1,-1):
        pesoDerecha[i] = pesoDerecha[i+1] + valores[i+1]
    def backtracking(longSol, pesoAcum):
        if longSol == N: # hemos llegado a una hoja
            if pesoAcum == objetivo: # me sirve?
                yield (sol,[valores[i] for i in range(N) if sol[i]==1])
        else: # es nodo interno, vamos a RAMIFICAR
            w = valores[longSol]
            if pesoAcum + w <= objetivo: # si no me paso
                sol[longSol] = 1
                yield from backtracking(longSol+1, pesoAcum+w)
            if pesoAcum + pesoDerecha[longSol] >= objetivo:
                sol[longSol] = 0
                yield from backtracking(longSol+1, pesoAcum)
    yield from backtracking(0,0)

if __name__ == "__main__":    
    valores = [5, 7, 12, 30, 40, 15, 20, 9]
    objetivo = 49
    for x,y in subsetSum(valores, objetivo):
        print(x,y)

