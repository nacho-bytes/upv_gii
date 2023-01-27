# AUTORES:
# Andrea Gascó Pau y Iñaki Diez Lambies

def exact_cover(listaConjuntos):
    # Universo
    U = set().union(*listaConjuntos)
    # Número de elementos
    N = len(listaConjuntos)
    solucion = []
    # Para el elemento sol[longSol] y 
    # un conjunto acumulado cjtAcumulado
    def backtracking(longSol, cjtAcumulado):
        # Si nuestro conjunto forma el universo
        # hemos acabado
        if set().union(*cjtAcumulado) == U:
            yield solucion.copy()
        # Sino ramificamos si aún hay posibilidades
        elif longSol < len(listaConjuntos):
            # Escojemos un conjunto
            cjt = listaConjuntos[longSol]
            # Comprobamos la condición
            if set().union(*cjtAcumulado).isdisjoint(cjt):
                # Si se cumple, añadimos y avanzamos
                solucion.append(cjt)
                yield from backtracking(longSol + 1, solucion)
                # Volvemos atrás
                solucion.pop()
            # Ramificamos sin añadir
            yield from backtracking(longSol + 1, solucion)
    yield from backtracking(0, set())

if __name__ == "__main__":
    cjtdcjts = [{"casa","coche","gato"},
                {"casa","bici"},
                {"bici","perro"},
                {"boli","gato"},
                {"coche","gato","bici"},
                {"casa", "moto"},
                {"perro", "boli"},
                {"coche","moto"},
                {"casa"}]

    for solucion in exact_cover(cjtdcjts):
        print(solucion)
