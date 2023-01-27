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

  def backtracking(nodo):
    if terminal(nodo):
      print(nodo)
    else:
      for hijo in ramificar(nodo):
        if prometedor(hijo):
          backtracking(hijo)

  backtracking([])

nreinas(8)

              
         
