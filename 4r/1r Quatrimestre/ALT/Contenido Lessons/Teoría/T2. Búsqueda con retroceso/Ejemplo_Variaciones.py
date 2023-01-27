def variaciones(N):
  def ramificar(nodo):
    return (nodo+[hijo] for hijo in range(N))

  def prometedor(hijo):
    ultima = hijo[-1]
    anteriores = hijo[:-1]
    pos_ultima = len(hijo)-1
    for pos,val in enumerate(anteriores):
      if val==ultima or abs(pos-pos_ultima)==abs(ultima-val):
	return False
    return True  
  
  def aux(nodo):
    if len(nodo)==N:
      print(nodo)
    else:
      for hijo in ramificar(nodo):
        if prometedor(hijo):
          aux(hijo)
  aux([])

variaciones(5)
