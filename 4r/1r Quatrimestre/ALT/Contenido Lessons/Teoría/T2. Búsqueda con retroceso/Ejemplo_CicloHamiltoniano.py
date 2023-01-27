# En el problema de la existencia de un ciclo Hamiltoniano, dado un
# grafo G = (V, E), deseamos encontrar un camino que parta de un
# vertice, termine en el mismo vertice y visite todos los vertices
# del grafo una sola vez (excepto en el caso del vertice de
# partida, que debera coincidir con el de llegada).

# Se pide que implementes un algoritmo que, utilizando la tecnica
# de Busqueda con Retroceso, devuelva la solucion encontrada, si es
# que existe. Utiliza una representacion de grafo en forma de
# listas de adyacencia. Recuerda que, como el ciclo hamiltoniano
# puede empezar en cualquier vertice, es una practica habitual
# empezar la comprobacion por el primer vertice del grafo.

# un grafo dirigido representado mediante listas de adyacencia seria
# simplemente una lista de listas del tipo, este grafo es el ejemplo
# de la figura 6.19 de los apuntes (pagina 6-31):

G = [[1,2,3],       # del vertice 0 vamos a los vertices 1,2,3
     [0,3,4],       # del vertice 1 vamos a los vertices 0,3,4
     [0,3,5],       # del vertice 2 vamos a los vertices 0,3,5
     [0,1,2,4,5,6], # del vertice 3 vamos a los vertices 0,1,2,4,5,6
     [1,3,7],       # del vertice 4 vamos a los vertices 1,3,7
     [2,3,6,8],     # del vertice 5 vamos a los vertices 2,3,6,8
     [3,5,7,8,9],   # del vertice 6 vamos a los vertices 3,5,7,8,9
     [4,6,9],       # del vertice 7 vamos a los vertices 4,6,9
     [5,6,9],       # del vertice 8 vamos a los vertices 5,6,9
     [6,7,8]]       # del vertice 9 vamos a los vertices 6,7,8

def hamiltonian_cycle1(G):
  def backtracking(path):
    if len(path)==len(G):
      if path[0] in G[path[-1]]: return path+[0]
    else:
      for v in [x for x in G[path[-1]] if x not in path]:
        found = backtracking(path+[v])
        if found!=None: return found
    return None
  return backtracking([0])

# ejemplo de uso:
# print(hamiltonian_cycle1(G))

# otra forma usando un solo vector para albergar el camino:
def hamiltonian_cycle2(G,allSolutions):
  nV = len(G)
  path = [None]*(nV+1)
  visited = [False]*nV
  solutions = []

  def backtracking(pathlength):
    if pathlength==nV: # is complete
      if path[0] in G[path[nV-1]]: # is feasible
        path[nV]=path[0]
        solutions.append(path[:])
        return True
      return False
    for v in G[path[pathlength-1]]:
      if not visited[v]:
        visited[v] = True
        path[pathlength]=v
        if backtracking(pathlength+1) and not allSolutions:
          return True
        visited[v] = False
    return False

  firstVertex = 0
  visited[firstVertex]=True
  path[0]=firstVertex
  backtracking(1) # first path has length 1
  return solutions

if __name__ == "__main__":
  for solution in hamiltonian_cycle2(G,True):
    print(solution)

