######################################################################
# Práctica realizada por:
# - Andrea Gascó Pau
# - Iñaki Diez Lambies
######################################################################

import numpy as np
import heapq
import collections

######################################################################
#
#                     GENERACIÓN DE INSTANCIAS
#
######################################################################

def genera_instancia(M, low=1, high=1000):
    return np.random.randint(low=low,high=high,
                             size=(M,M),dtype=int)

######################################################################
#
#                       ALGORITMOS VORACES
#
######################################################################

def compute_score(costMatrix, solution):
    return sum(costMatrix[pieza,instante]
               for pieza,instante in enumerate(solution))

def naive_solution(costMatrix):
    solution = list(range(costMatrix.shape[0]))
    return compute_score(costMatrix,solution), solution

def voraz_x_pieza(costMatrix):
    # costMatrix[i,j] el coste de situar pieza i en instante j
    M = costMatrix.shape[0] # nº piezas
    solution=[]; score=0
    for piece in range(M):
        avaliableSortedPieces = list(filter(lambda index: index not in solution, np.argsort(costMatrix[piece])))
        solution.append(avaliableSortedPieces[0])
    return compute_score(costMatrix,solution),solution

def voraz_x_instante(costMatrix):
    # costMatrix[i,j] el coste de situar pieza i en instante j
    M = costMatrix.shape[0] # nº piezas
    solution=[-1]*M; score=0
    for pieceOrder in range(costMatrix.shape[1]):
        solutionIndexes = [-1 if solution[i] == -1 else i for i in range(len(solution))]
        avaliableSortedPieces = list(filter(lambda index: index not in solutionIndexes, np.argsort(costMatrix[:, pieceOrder])))
        solution[avaliableSortedPieces[0]] = pieceOrder
    return compute_score(costMatrix,solution),solution

def voraz_x_coste(costMatrix):
    # costMatrix[i,j] el coste de situar pieza i en instante j
    M = costMatrix.shape[0] # nº piezas
    solution=[-1]*M; score=0
    avaliableSortedIndexes=costMatrix.flatten().argsort()
    for piece in range(M):
        selectedIndex = avaliableSortedIndexes[0]
        pieceIndex = int(selectedIndex / M); intantIndex = int(selectedIndex % M)
        solution[pieceIndex] = intantIndex
        avaliableSortedIndexes = list(filter(lambda i: int(i % M) != intantIndex and int(i / M) != pieceIndex, avaliableSortedIndexes))
    return compute_score(costMatrix,solution),solution

def voraz_combina(costMatrix):
    score, solution = float('inf'), []
    vorazFunctions = [naive_solution, voraz_x_pieza, voraz_x_instante, voraz_x_coste]
    for f in vorazFunctions:
        fRes = f(costMatrix)
        if fRes[0] < score:
            score, solution = fRes
    return score,solution
        
######################################################################
#
#                       RAMIFICACIÓN Y PODA
#
######################################################################

class Ensamblaje:

    def __init__(self, costMatrix, initial_sol = None):
        '''
        costMatrix es una matriz numpy MxM con valores positivos
        costMatrix[i,j] es el coste de ensamblar la pieza i cuando ya
        se han ensamblado j piezas.
        '''
        # no haría falta pero por si acaso comprobamos que costMatrix
        # es una matriz numpy cuadrada y de costMatrix positivos
        assert(type(costMatrix) is np.ndarray and len(costMatrix.shape) == 2
               and costMatrix.shape[0] == costMatrix.shape[1]
               and costMatrix.dtype == int and costMatrix.min()>=0)
        self.costMatrix = costMatrix
        self.M = costMatrix.shape[0]
        # la forma más barata de ensamblar la pieza i si podemos
        # elegir el momento de ensamblaje que más nos convenga:
        self.minPieza = [costMatrix[i,:].min() for i in range(self.M)]
        self.x = initial_sol
        if initial_sol is None:
            self.fx = np.inf
        else:
            self.fx = compute_score(costMatrix,initial_sol)
        
    def branch(self, s_score, s):
        '''
        s_score es el score de s
        s es una solución parcial
        '''
        i = len(s) # i es la siguiente pieza a montar, i<M
        
        # costMatrix[i,j] coste ensamblar objeto i en instante j
        for j in range(self.M): # todos los instantes
            # si j no ha sido utilizado en s
            if j not in s: # NO es la forma más eficiente
                           # al ser lineal con len(s)
                new_score = s_score - self.minPieza[i] + self.costMatrix[i,j]
                yield (new_score, s + [j])

    def is_complete(self, s):
        '''
        s es una solución parcial
        '''
        return len(s) == self.M

    def initial_solution(self):
        return (sum(self.minPieza),[])

    def solve(self):
        A = [ self.initial_solution() ] # cola de prioridad
        iterations = 0 # nº iteraciones
        gen_states = 0 # nº estados generados
        podas_opt  = 0 # nº podas por cota optimista
        maxA       = 0 # tamaño máximo alzanzado por A
        # bucle principal ramificacion y poda (PODA IMPLICITA)
        while len(A)>0 and A[0][0] < self.fx:
            iterations += 1
            lenA = len(A)
            maxA = max(maxA, lenA)
            s_score, s = heapq.heappop(A)
            for child_score, child in self.branch(s_score, s):
                gen_states += 1
                if self.is_complete(child): # si es terminal
                    # es factible (pq branch solo genera factibles)
                    # falta ver si mejora la mejor solucion en curso
                    if child_score < self.fx:
                        self.fx, self.x = child_score, child
                else: # no es terminal
                    # lo metemos en el cjt de estados activos si
                    # supera la poda por cota optimista:
                    if child_score < self.fx:
                        heapq.heappush(A, (child_score, child) )
                    else:
                        podas_opt += 1
                        
        stats = { 'iterations':iterations,
                  'gen_states':gen_states,
                  'podas_opt':podas_opt,
                  'maxA':maxA}
        return self.fx, self.x, stats

def functionRyP(costMatrix):
    e = Ensamblaje(costMatrix)
    fx,x,stats = e.solve()
    return fx,x

######################################################################
#
#                        EXPERIMENTACIÓN
#
######################################################################

cjtAlgoritmos = {'naif': naive_solution,
                 'x_pieza': voraz_x_pieza,
                 'x_instante': voraz_x_instante,
                 'x_coste': voraz_x_coste,
                 'combina': voraz_combina,
                 'RyP': functionRyP}


def probar_ejemplo():
    ejemplo = np.array([[7, 3, 7, 2],
                        [9, 9, 4, 1],
                        [9, 4, 8, 1],
                        [3, 4, 8, 4]], dtype=int)
    
    for label,function in cjtAlgoritmos.items():
        score,solution = function(ejemplo)
        print(f'Algoritmo {label:10}', solution, score)

def comparar_algoritmos():
    print('talla',end=' ')
    for label in cjtAlgoritmos:
        print(f'{label:>10}',end=' ')
    print()
    numInstancias = 10
    for talla in range(5,15+1):
        dtalla = collections.defaultdict(float)
        for instancia in range(numInstancias):
            cM = genera_instancia(talla)
            for label,function in cjtAlgoritmos.items():
                score,solution = function(cM)
                dtalla[label] += score
        print(f'{talla:>5}',end=' ')
        for label in cjtAlgoritmos:
            media = dtalla[label]/numInstancias
            print(f'{media:10.2f}', end=' ')
        print()

def probar_ryp():
    ejemplo = np.array([[7, 3, 7, 2],
                        [9, 9, 4, 1],
                        [9, 4, 8, 1],
                        [3, 4, 8, 4]], dtype=int)
    # scorevoraz, solvoraz = voraz_combina(ejemplo)
    # bb = Ensamblaje(ejemplo, solvoraz)
    bb = Ensamblaje(ejemplo)
    fx, x, stats = bb.solve()
    print(x,fx,compute_score(ejemplo,x))
    print(stats)

def comparar_sol_inicial():
    stats_t = ['iterations',
                'gen_states',
                'podas_opt',
                'maxA']
    tallas = range(5,15+1)
    # Lista de diccionarios. Uno por cada algoritmo a probar
    statsList = [] 
    numInstancias = 10
    for index, talla in enumerate(tallas):
        statsList.append({})
        for instancia in range(numInstancias):
            cM = genera_instancia(talla)
            for label,function in cjtAlgoritmos.items():
                score,solution = function(cM)
                if (label != 'RyP'):
                    bb = Ensamblaje(cM, solution)
                else:
                    bb = Ensamblaje(cM)
                fx, x, stats = bb.solve()
                actualStats = statsList[index].get(label, [])  
                actualStats.append(stats)
                statsList[index][label] = actualStats
        for label,function in cjtAlgoritmos.items():
            allStats = statsList[index][label]
            avgStats = {}
            for s in stats_t:
                avgStats[s] = sum(d[s] for d in allStats) / len(allStats)
            statsList[index][label] = avgStats
        

    for s in stats_t:
        print(s.center(20,' ').center(100, '-'))
        print('talla',end=' ')
        for label in cjtAlgoritmos:
            if (label != 'RyP'):
                label += '+RyP'
            print(f'{label:>10}',end=' ')
        print()
        for index, talla in enumerate(tallas):
            print(f'{talla:>5}',end=' ')
            for label,function in cjtAlgoritmos.items():
                print(f'{statsList[index][label][s]:10.2f}', end=' ')
            print()
                

            

######################################################################
#
#                             PRUEBAS
#
######################################################################
    
if __name__ == '__main__':
    probar_ejemplo()
    print('-'*70)
    probar_ryp()
    print('-'*70)
    comparar_algoritmos()
    print('-'*70)
    comparar_sol_inicial()

