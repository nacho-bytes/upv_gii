# -*- coding: utf-8 -*-
import sys
from exactcover import exact_cover

# AUTORES:
# Andrea Gascó Pau y Iñaki Diez Lambies

def langford_data_structure(N):
    # n1,n2,... means that the value has been used
    # p0,p1,... means that the position has been used
    def value(i):
        return sys.intern(f'n{i}')
    def position(i):
        return sys.intern(f'p{i}')
    # Universo de elementos
    U = []
    # Para todos los números
    for i in range(1, N+1):
        # Y todas las posiciones
        for p in range(2*N):
            secondPos = p + i + 1
            # Si son válidas
            if (secondPos < 2*N):
                # Añadir el set al universo
                U.append(set([position(p), position(secondPos), value(i)])) 

    print(U)
    return U

def langford_exact_cover(N):
    if N%4 in (0,3):
        U = langford_data_structure(N)
        sol = [None]*2*N
        for coversol in exact_cover(U):
            for item in coversol:
                elems = sorted(item)
                n = int(elems[0][1:])
                p = int(elems[1][1:])
                sol[p]=n
                p = int(elems[2][1:])
                sol[p]=n
            yield "-".join(map(str,sol))

if __name__ == "__main__":
    if len(sys.argv) not in (2,3):
        print('\nUsage: %s N [maxsoluciones]\n' % (sys.argv[0],))
        sys.exit()
    try:
        N = int(sys.argv[1])
    except ValueError:
        print('First argument must be an integer')
        sys.exit()
    numSolutions = None
    if len(sys.argv) == 3:
        try:
            numSolutions = int(sys.argv[2])
        except ValueError:
            print('Second (optional) argument must be an integer')
            sys.exit()

    i = 0
    for sol in langford_exact_cover(N):
        if numSolutions is not None and i>=numSolutions:
            break
        i += 1
        print(f'sol {i:4} ->',sol)
