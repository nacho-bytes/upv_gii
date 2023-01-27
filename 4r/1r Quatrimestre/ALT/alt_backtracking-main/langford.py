# -*- coding: utf-8 -*-

# AUTORES:
# Andrea Gascó Pau y Iñaki Diez Lambies

import sys

def langford(N):
    N2   = 2*N
    seq  = [0]*N2
    def backtracking(num):
        # Caso base ya tenemos todos 
        # los números en seq[]
        if num<=0:
            yield "-".join(map(str, seq))
        else:
            # Para todas las posiciones posibles
            for indx, val in enumerate(seq):
                secondPos = indx + num + 1
                # Miramos las válidas
                if secondPos < N2 and\
                    val == 0 and seq[secondPos] == 0:
                        # Añadimos y continuamos
                        seq[indx] = num; seq[secondPos] = num
                        yield from backtracking(num - 1)
                        # Volvemos atrás
                        seq[indx] = 0; seq[secondPos] = 0
    if N%4 in (0,3):
        yield from backtracking(N)

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
    for sol in langford(N):
        if numSolutions is not None and i>=numSolutions:
            break
        i += 1
        print(f'sol {i:4} ->',sol)
