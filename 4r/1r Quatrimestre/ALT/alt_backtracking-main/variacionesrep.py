# AUTORES:
# Andrea Gascó Pau y Iñaki Diez Lambies

def variacionesRepeticion(elementos, cantidad):
    sol = [None]*cantidad
    # Para el elemento sol[longSol]
    def backtracking(longSol):
        # Caso base tenemos una combinación posible
        if longSol == cantidad:
            yield sol.copy()
        else:
            # Para cada elemento en cada posición
            for child in elementos:
                # Si no está ya
                if (child not in sol):
                    sol[longSol] = child
                    yield from backtracking(longSol+1)
            # Volvemos atrás después de encontrar 
            # todas las hojas de este nivel
            sol[longSol] = None                 
    yield from backtracking(0)

if __name__ == "__main__":    
    for x in variacionesRepeticion(['tomate','queso','anchoas'],3):
        print(x)

