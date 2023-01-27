# AUTORES:
# (poner aquí el nombre o 2 nombres del equipo de prácticas

def variacionesRepeticion(elementos, cantidad):
    sol = [None]*cantidad
    def backtracking(longSol):
        if longSol == cantidad:
            yield sol.copy()
        else:
            for child in elementos:
                sol[longSol] = child
                yield from backtracking(longSol+1)
    yield from backtracking(0)

if __name__ == "__main__":    
    for x in variacionesRepeticion(['tomate','queso','anchoas'],3):
        print(x)

