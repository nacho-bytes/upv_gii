# -*- coding: utf-8 -*-

def subset_sum(w,W,allSolutions):
  n = len(w) # number of objects
  sol = [None]*n
  sum_w = [ sum(w[j] for j in range(i+1,n)) for i in range(n)] # inefficient!
  solutions = []

  def backtracking(longSol,W):
    if longSol == n: # is complete
      # in this case, we don't have to check "is feasible"
      solutions.append(sol[:])
      return True
    # not complete, lets branch
    # 1) consider first including the object:
    if W>=w[longSol] and w[longSol]+sum_w[longSol]>=W: # promising
      sol[longSol]=1
      if backtracking(longSol+1,W-w[longSol]) and not allSolutions:
        return True
    # 2) now consider not including the object:
    if sum_w[longSol]>=W: # promising
      sol[longSol]=0
      if backtracking(longSol+1,W) and not allSolutions:
        return True
    return allSolutions

  backtracking(0,W)
  return solutions

if __name__ == "__main__":
  w = [4,5,3,6,2]
  for W in range(3,15):
    print("Capacidad",W,"objetos de peso",w)
    for solution in subset_sum(w,W,True):
      print(solution)

