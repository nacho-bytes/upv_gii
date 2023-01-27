######################################################################
# Examen realizado por: ->REEMPLAZAR POR TU NOMBRE<-
######################################################################

"""

                            ENUNCIADO


- Ves más abajo donde pone EXAMEN y completa la clase:

   class TSP_Examen(TSP, BranchBoundExplicit):

  Busca la cadena "COMPLETAR" (aparece 2 veces en este fichero
  donde hay que completar código).

- Pon en la clase TSP_Examen el código de tu práctica con esta cota:

    Las aristas de mínimo coste que parten de cada vértice
    no visitado (más el último visitado)
    y llegan a vértices no visitados o al vértice origen.
    No es incremental.

- Modifica el método branch para que solamente genere aquellos
  estados (de los que ya generaba) que cumplan una de estas 2
  condiciones:

  - no hay vértices en la parte desconocida (es terminal)

  - alguno de los vértices de la parte desconocida tiene una arista
    que llega al vértice inicial

- Para comprobar que funciona correctamente debes ir al __main__ del
  final y COMPLETAR EL CÓDIGO que crea el objeto de tipo TSP_Examen
  con el grafo proporcionado y calcula la solución.

- Tras ejecutar el programa el resultado esperado por salida estándar
  es:

    Las estadísticas coinciden con el resultado esperado ^_^
    Indica que la solución es probablemente correcta.

  Es decir, es posible por casualidad un código no 100% correcto dé
  los mismos valores en el ejemplo.

  Por otra parte, si no diera el mismo resultado no significa que
  esté totalmente mal, podría estar 'casi bien'.

"""

class DiGraph:
    '''
    Grafo dirigido representado mediante listas de adyacencia
    y de incidencia.
    
    Hay 2 atributos. Si tenemos aristas de u a v con peso w

    - self.forward es un diccionario que a cada vértice u le asocia
      una lista de pares (v,w)

    - self.backwards es un diccionario que a cada vértice v le asocia
      una lista de pares (u,w)

    forward es una lista de adyacencia (se vió en EDA)

    backwards es como la lista de adyacencia del grafo transpuesto
    (darle la vuelta a la orientación de las aristas)
    '''
    
    def __init__(self):
        self.forward = {} # aristas que salen de cada vértice
        # backwards solo se utiliza por Dijkstra cuando reverse=True
        # pero hay una cota que lo usa muchas veces
        self.backwards = {} # aristas que llegan a cada vértice

    def nV(self):
        '''
        devuelve |V| nº vértices
        '''
        return len(self.forward)

    def add_node(self, u):
        '''
        añade un nuevo nodo
        en este caso no pasa nada si ya estaba
        '''
        if u not in self.forward:
            self.forward[u] = []
            self.backwards[u] = []

    def add_edge(self, u, v, weight=1):
        '''
        añade una arista de u a v con peso weight
        asume que esa arista no estaba previamente
        '''        
        # we assume there is no edge (u,v)
        self.add_node(u) # just in case
        self.add_node(v) # just in case
        self.forward[u].append((v,weight))
        self.backwards[v].append((u,weight))

    def nodes(self):
        '''
        para poder iterar sobre los nodos desde fuera
        de la clase sin acceder explícitamente a self.forward
        '''
        return self.forward.keys()
    
    def edges_from(self, u):
        '''
        para poder iterar sobre las aristas que salen de u
        sin acceder explícitamente a un atributo
        '''
        for v,w in self.forward[u]:
            yield v,w
    
    def is_edge(self, u, v):
        '''
        se limita a decir si hay una arista de u a v
        '''
        return any(dst == v for (dst,w) in self.forward[u])

    def weight_edge(self, u, v):
        '''
        devuelve el peso de la arista de u a v
        returns None if there is no such edge
        '''
        for (dst,w) in self.forward[u]:
            if v == dst:
                return w

    def lowest_out_weight(self, vertex, forbidden=()):
        '''
        devuelve el peso de la arista de menor peso
        de las que salen de vertex pero no llegan
        a ninguna de forbidden
        '''
        return min((w for v,w in self.forward[vertex]
                    if v not in forbidden),default=float('inf'))

    def path_weight(self, path):
        '''
        Devuelve el coste del camino path si este existe
        En caso contrario devuelve None
        '''
        score = 0
        for u,v in zip(path,path[1:]):
            w = self.weight_edge(u,v)
            if w is None:
                return None
            score += w
        return score

    
def load_dimacs_graph(dimacsString, symmetric=False):
    g = DiGraph()
    for line in dimacsString.split('\n'):
        if line.startswith('FORMAT'):
            nV,nE = map(int,line.split()[1:])
            for v in range(nV):
                g.add_node(v)
        elif line.startswith('e '):
            u,v,w = map(int,line.split()[1:])
            g.add_edge(u,v,w)
            if symmetric:
                g.add_edge(v,u,w)
    return g

######################################################################
#
#                       RAMIFICACIÓN Y PODA
#
######################################################################

import heapq

class BranchBoundExplicit:
    def solve(self):
        A = [ self.initial_solution() ] # cola de prioridad
        iterations = 0 # nº iteraciones
        gen_states = 0 # nº estados generados
        podas_opt  = 0 # nº podas por cota optimista
        maxA       = 0 # tamaño máximo alzanzado por A
        cost_expl  = 0 # coste poda explícita
        podas_expl = 0 # podas dentro de A con la poda explícita
        # bucle principal ramificacion y poda (PODA IMPLICITA)
        while len(A)>0:
            iterations += 1
            lenA = len(A)
            maxA = max(maxA, lenA)
            s_score, s = heapq.heappop(A)
            for child_score, child in self.branch(s_score, s):
                gen_states += 1
                if self.is_complete(child): # si es terminal
                    if self.is_factible(child):
                        # falta ver si mejora la mejor solucion en curso
                        child_score, child = self.get_factible_state(child_score,
                                                                     child)
                        if child_score < self.fx:
                            self.fx, self.x = child_score, child
                            # poda explícita
                            cost_expl += len(A)
                            lenAprev = len(A)
                            A = [ (score,st) for (score,st) in A
                                  if score < child_score]
                            podas_expl += lenAprev - len(A)
                            # this method was called 'builheap' in EDA:
                            heapq.heapify(A) # transform into a heap, 
                else: # no es terminal
                    # lo metemos en el cjt de estados activos si
                    # supera la poda por cota optimista:
                    if child_score < self.fx:
                        heapq.heappush(A, (child_score, child) )
                    else:
                        podas_opt += 1
                        
        stats = { 'iterations' : iterations,
                  'gen_states' : gen_states,
                  'podas_opt' : podas_opt,
                  'maxA' : maxA,
                  'podas_expl' : podas_expl,
                  'cost_expl' : cost_expl }
        
        return self.fx, self.x, stats

class TSP:

    def __init__(self, graph, first_vertex=0):
        self.G = graph # DiGraph
        self.first_vertex = first_vertex
        self.fx = float('inf')
        self.x = None
        
    def is_complete(self, s):
        '''
        s es una solución parcial
        '''
        return len(s) == self.G.nV()

    def is_factible(self, s):
        '''
        asumimos s is complete, falta ver si hay una arista desde
        el último vértice s[-1] hasta el primero s[0]
        '''
        return self.G.is_edge(s[-1],s[0])

    def get_factible_state(self, s_score, s):
        '''
        En el caso del TSP se encarga de añadir la arista que
        vuelve al origen Dependiendo del tipo de cota optimista,
        hay que corregir el valor de la parte conocida y desconocida,
        en el caso general no nos la jugamos (mejor optimizar para
        casos particulares):
        '''
        s_new = s+[s[0]]
        return self.G.path_weight(s_new), s_new

######################################################################
#
#                              EXAMEN
#
######################################################################

class TSP_Examen(TSP, BranchBoundExplicit):
    
    def initial_solution(self):
        initial = [ self.first_vertex ]
        initial_score = sum(self.G.lowest_out_weight(u) for u in self.G.nodes())
        return (initial_score, initial)

    def branch(self, s_score, s):
        # esta solución admite muchas mejoras, hay formas más
        # eficientes precalculando cosas en el constructor, pero por
        # no marear
        s_known_score = self.G.path_weight(s) # coste parte conocida
        lastvertex = s[-1]
        for v,w in self.G.edges_from(lastvertex):
            if v not in s: # vertice no utilizado todavía
                child = s+[v]
                if (len(child) == self.G.nV() or # es terminal o bien
                    # ver si algun vertice de la parte desconocida de child
                    # tiene una arista de vuelta a self.first_vertex
                    any(self.G.is_edge(u, self.first_vertex)
                        for u in self.G.nodes()
                        if u not in child)):
                    avoid = set(child[1:])
                    child_score  = (s_known_score + w +
                                    # el sumatorio no se puede factorizar
                                    # fuera del for pq avoid depende de v
                                    sum(self.G.lowest_out_weight(x,avoid)
                                        for x in self.G.nodes()
                                        if x not in s))
                    yield (child_score, child)


######################################################################
#
#                       COMPROBAR QUE FUNCIONA
#
######################################################################

ejemplo_mediano = """
FORMAT 10 43
e 0 4 84637
e 0 3 113623
e 0 6 115689
e 0 8 28989
e 0 1 92751
e 1 3 39631
e 1 7 44708
e 1 6 26841
e 2 3 69204
e 2 5 92466
e 2 4 80275
e 3 0 102668
e 3 9 852
e 3 6 17788
e 3 1 40001
e 3 4 22637
e 3 5 34081
e 4 1 11291
e 4 5 30120
e 4 2 63483
e 5 6 16878
e 5 1 29329
e 5 7 68026
e 5 4 26577
e 5 0 92391
e 5 2 92195
e 6 4 12293
e 6 7 59774
e 6 5 16209
e 7 3 79204
e 7 2 126610
e 7 9 76392
e 7 8 91416
e 7 1 57764
e 7 0 71665
e 8 2 95620
e 8 9 132896
e 8 3 110810
e 8 1 95677
e 8 4 94689
e 9 4 26070
e 9 2 78506
e 9 1 40074
"""
        
if __name__ == '__main__':
    g = load_dimacs_graph(ejemplo_mediano)
    print("Probando el código TSP_Examen con el grafo mediano:\n")
    
    # COMPLETAR para probar la clase TSP_Examen con el grafo proporcionado:
    tspe = TSP_Examen(g)
    fx,x,stats = tspe.solve()
    # fin de la parte a completar
    print(fx,x)
    print(stats,end="\n\n")
    # aquí se comprueba que el resultado es correcto:
    esperado = {'iterations': 39, 'gen_states': 99, 'podas_opt': 13, 'maxA': 49, 'podas_expl': 47, 'cost_expl': 47}
    if fx == 414767 and stats == esperado:
        print("El resultado coincide con el esperado ^_^")
        print("Indica que la solución es probablemente correcta.")
    else:
        print("Las estadísticas NO coinciden con el resultado esperado :'(")


