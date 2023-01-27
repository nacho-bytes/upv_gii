# -*- coding: utf-8 -*-

def show_solutions(solutions):
  n = len(solutions[0])
  for num_solution in range(len(solutions)):
    sol = sols[num_solution]
    print("Solution", num_solution + 1)
    print(" ","".join(str(i+1) for i in  range(n)))
    for i in range(n):
      print(i+1,"".join("X" if sol[j]==i else "." for j in range(n)))
    print()

def just_first_nqueens(n):
  def is_promising(longSol, queen):
    return all(queen != sol[i] and longSol-i != abs(queen-sol[i]) for i in range(longSol))
  def backtracking(longSol):
    if longSol == n:
      return True
    for queen in range(n):
      if is_promising(longSol, queen):
        sol[longSol] = queen
        if backtracking(longSol+1):
          return True
    return False

  sol = [None]*n
  solutions = []
  if backtracking(0):
    solutions.append(sol)
  return solutions

def all_nqueens(n):
  def is_promising(longSol, queen):
    return all(queen != sol[i] and longSol-i != abs(queen-sol[i]) for i in range(longSol))
  def backtracking(longSol):
    if longSol == n:
      solutions.append(sol[:])
    for queen in range(n):
      if is_promising(longSol, queen):
        sol[longSol] = queen
        backtracking(longSol+1)

  sol = [None]*n
  solutions = []
  backtracking(0)
  return solutions

def nqueens(n, allSolutions):
  def is_promising(longSol, queen):
    return all(queen != sol[i] and longSol-i != abs(queen-sol[i]) for i in range(longSol))
  def backtracking(longSol):
    if longSol == n:
      solutions.append(sol[:])
      return True
    for queen in range(n):
      if is_promising(longSol, queen):
        sol[longSol] = queen
        if backtracking(longSol+1) and not allSolutions:
          return True
    return False

  sol = [None]*n
  solutions = []
  backtracking(0)
  return solutions

if __name__ == "__main__":
  for n in range(4,9):
    sols = just_first_nqueens(n)
    print("%d-queen problem, just first found solution" % (n,))
    show_solutions(sols)
  for n in range(4,9):
    sols = all_nqueens(n)
    print("%d-queen problem, all found solutions" % (n,))
    show_solutions(sols)
  for allSolutions in [False,True]:
    for n in range(4,9):
      print("%d-queen problem (%s)\n" % (n,"all solutions" if allSolutions else "only first solution"))
      sols = nqueens(n, allSolutions)
      show_solutions(sols)

