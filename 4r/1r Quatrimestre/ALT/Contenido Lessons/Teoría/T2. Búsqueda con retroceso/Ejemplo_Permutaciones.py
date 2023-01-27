# generar, mediante backtracking, las permutaciones de N elementos

# es posible una version con yield, aqui nos conformamos con mostrar
# al vuelo (imprimir) las soluciones a medida que se van generando

def permutaciones(N):
  sol = [None]*N
  usadas = [False]*N
  def backtracking(longSol):
    if longSol==N: # is complete
      print(sol)
    else:
      for i in range(N):
        if not usadas[i]:
          sol[longSol]=i
          usadas[i]=True
          backtracking(longSol+1)
          usadas[i]=False
  backtracking(0)

import sys
if __name__ == "__main__":
  if len(sys.argv)!=2:
    print("\nUsage: %s N\n" % (sys.argv[0],))
    sys.exit()
  N = int(sys.argv[1])
  permutaciones(N)

