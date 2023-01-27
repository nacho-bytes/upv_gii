# -*- coding: utf-8 -*-

# El enunciado de este problema es más o menos así:
# Dado un conjunto de N cajas donde cada caja tiene
# un peso w_i y soporta en cima un peso s_i
# Nos piden encontrar las formas de apilar las cajas
# de manera que ninguna quede aplastada por las de encima

def cajas(w,s):
  # w es una lista python de pesos, el peso de cada objeto
  # s es una lista python de pesos, el peso que soporta
  # asumimos len(w)==len(s)
  N = len(w)
  soluciones = []
  
  def terminal(listaCajas):
    return len(listaCajas)==N
  
  def prometedor(listaCajas):
    ultima = listaCajas[-1]
    debajo = listaCajas[:-1]
    return (ultima not in debajo and
            s[ultima]>=sum(w[i] for i in range(N) if i not in listaCajas))

  def ramificar(listaCajas):
    return (listaCajas+[hijo] for hijo in range(N))
  
  def backtracking(listaCajas):
    if terminal(listaCajas):
      # prometedor+terminal->factible
      soluciones.append(listaCajas)
    else:
      for hijo in ramificar(listaCajas):
        if prometedor(hijo):
          backtracking(hijo)
    return None

  backtracking([])
  return soluciones

def mostrar_caja(w,s,listaCajas):
  # la lista tiene las cajas empezando por la base
  N = len(listaCajas)
  encima = 0
  for i in range(N-1,-1,-1):
    caja = listaCajas[i]
    print("caja[%d] pesa %3g kg soporta %3g kg encima lleva %3g kg" %
          (caja,w[caja],s[caja],encima))
    encima += w[caja]


if __name__ == "__main__":
  w = [40,30,20,40]
  s = [60,30,80,95]
  for index,solucion in enumerate(cajas(w,s)):
    print("Solución",index)
    mostrar_caja(w,s,solucion)

