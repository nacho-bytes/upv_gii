# AUTORES:
# Iñaki Diez Lambies y Andrea Gascó Pau

def combinaciones(elementos, longitud):
    sol = [None]*longitud
    # Para el elemento sol[longSol]
    # y último elemento añadido 
    # elementos[indxElem]
    def backtracking(longSol, indxElem):
        # Caso base tenemos una combinación posible
        if longSol == longitud:
            yield sol.copy()
        else:
            # Para cada elemento en cada posición
            for indx, child in enumerate(elementos):
                # Si no está ya y cumple el orden
                if (child not in sol and indx >= indxElem):
                    sol[longSol] = child
                    yield from backtracking(longSol + 1, indx + 1)
            # Volvemos atrás después de encontrar 
            # todas las hojas de este nivel
            sol[longSol] = None                 
    yield from backtracking(0, 0)

if __name__ == "__main__":    
    for x in combinaciones(['tomate','queso','anchoas', 'aceitunas'], 3):
        print(x)

