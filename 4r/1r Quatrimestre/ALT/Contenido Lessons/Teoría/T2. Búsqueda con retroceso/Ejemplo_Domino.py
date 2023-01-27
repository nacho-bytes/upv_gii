# -*- coding: utf-8 -*-
import sys

def domino(matrix,allSolutions):
  numFichas = sum(sum(matrix[i]) for i in range(7))
  sol = [0]*(numFichas+1)
  solutions = []

  def backtracking(longsol):
    if longsol==numFichas:
      solutions.append(sol[:])
      return True
    for ficha in range(7):
      u,v = min(sol[longsol],ficha),max(sol[longsol],ficha)
      if matrix[u][v]>0:
        sol[longsol+1] = ficha
        matrix[u][v] -= 1
        if backtracking(longsol+1) and not allSolutions:
          return True
        matrix[u][v] += 1
    return allSolutions

  for primeraFicha in range(7):
    sol[0] = primeraFicha
    if backtracking(0) and not allSolutions:
      break
  return solutions

def read_domino(filename):
  matrix = [[0]*7 for i in range(7)]
  for line in open(filename):
    i,j = map(int,line.split())
    i,j = min(i,j),max(i,j)
    matrix[i][j] += 1
  return matrix

def write_domino_solution(sol):
  print("->".join("[%d|%d]" % (sol[i],sol[i+1]) for i in range(len(sol)-1)))

if __name__ == "__main__":
  if len(sys.argv) not in [2,3]:
    print('\nUsage: %s filename [TODAS]\n' % (sys.argv[0],))
    sys.exit()
  filename = sys.argv[1]
  allSolutions = len(sys.argv)==3 and sys.argv[2]=='TODAS'
  matrix = read_domino(filename)
  for sol in domino(matrix,allSolutions):
    write_domino_solution(sol)

