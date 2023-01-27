# -*- coding: utf-8 -*-

def backtracking(nodo,N):
  if len(nodo)==N:
    return nodo
  else:
    for h in range(N):
      if (h not in nodo and
          all(abs(nodo[i]-h)!=abs(len(nodo)-i) for i in range(len(nodo)))):
        sol=backtracking(nodo+[h],N)
        if sol!=None:
          return sol
    return None

print(backtracking([],8))

              
         
