# generar, mediante backtracking, las combinaciones de M elementos
# tomados de N en N

# es posible una version con yield, aqui nos conformamos con mostrar
# al vuelo (imprimir) las soluciones a medida que se van generando

# la idea es, sin perdida de generalidad, sacar subsecuencias
# crecientes de valores de M y que tengan longitud N

def combinaciones(M,N):
  sol = [None]*N # vamos a tomar N elementos
  def backtracking(longSol):
    if longSol==N: # is complete
      print(sol)
    else:
      desde = 1 if longSol==0 else sol[longSol-1]+1
      # tenemos que rellenar desde longSol hasta N-1, son N-longSol+1 valores
      hasta = M-(N-longSol)+1
      for i in range(desde,hasta+1):
        sol[longSol]=i
        backtracking(longSol+1)
  backtracking(0)

import sys
if __name__ == "__main__":
  if len(sys.argv)!=3:
    print("\nUsage: %s M N\n" % (sys.argv[0],))
    sys.exit()
  M = int(sys.argv[1])
  N = int(sys.argv[2])
  combinaciones(M,N)

