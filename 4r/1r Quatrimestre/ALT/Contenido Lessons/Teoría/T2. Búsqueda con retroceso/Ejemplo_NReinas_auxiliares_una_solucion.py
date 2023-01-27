# -*- coding: utf-8 -*-

def nreinas(N):
  def terminal(nodo):
    return len(nodo)==N
  
  def prometedor(nodo):
    ultimo = nodo[-1]
    posultimo = len(nodo)-1
    anteriores = nodo[:-1]
    if ultimo in anteriores:
      return False
    for i in range(len(anteriores)):
      if abs(anteriores[i]-ultimo)==abs(i-posultimo):
        return False
    return True

  def ramificar(nodo):
    return (nodo+[h] for h in range(N))

  def factible(nodo):
    # en este caso prometedor+terminal implica factible
    return True

  def backtracking(nodo):
    if terminal(nodo):
      if factible(nodo):
        return nodo
    else:
      for hijo in ramificar(nodo):
        if prometedor(hijo):
          sol=backtracking(hijo)
          if sol!=None:
            return sol
    return None

    return backtracking([])

import sys
if __name__ == "__main__":
  if len(sys.argv)!=2:
    print("\nUsage: %s N\n" % (sys.argv[0],))
    sys.exit()
  N = int(sys.argv[1])
  print(nreinas(N))



              
         
