# pseudo-code python, backtracking
def MYPROBLEM(data):
  # internal function or closure, this one is recursive:
  def backtracking(sol):
    if is_complete(sol):
      if is_feasible(sol):
        return sol
      return None
    # "else:" is not required due to the previous return
    # not complete, lets branch
    for child in branch(sol):
      if is_promising(child):
        aux = backtracking(child)
        if aux != None:
          return aux
    return None
  solutions = []
  aux = backtracking([])
  # return a list of solutions or the empty list
  if aux != None:
    solutions.append(aux)
  return solutions

######################################################################
# scheme to find first solution using just one "sol" vector instead of
# creating one instance per child. Now, instead of returning "sol" we
# return a boolean value indicating if the solution has been found
######################################################################

# pseudo-code python, backtracking
def MYPROBLEM(data):
  sol = [None]*len(problem)
  solutions = []
  # internal funcions have read access to array sol, which means
  # that they can write inside
  def is_complete(solLength):
     ... # this function can be avoided, we can put the code in backtracking
  def is_feasible(solLength):
     ... # this function can be avoided, we can put the code in backtracking
  def branch(solLength):
     ... # this function can be avoided, we can put the code in backtracking
  def is_promising(child,solLength):
     ... # this function can be avoided, we can put the code in backtracking
  def backtracking(solLength):
    if is_complete(solLength):
      return is_feasible(solLength)
    # not complete, lets branch
    for child in branch(solLength):
      if is_promising(child,solLength):
        sol[solLength] = child
        if backtracking(solLength+1):
          return True
    return False

  if backtracking(0):
    solutions.append(sol) # sol should contain the unique solution
  return solutions

# pseudo-code python, backtracking
# scheme to find all solutions, we have removed some details, compare with previous scheme:
def MYPROBLEM(data):
  sol = [None]*len(problem)
  solutions = []
  def backtracking(solLength):
    if is_complete(solLength):
      if is_feasible(solLength):
        # we have to make and store a copy of the sol vector:
        solutions.append(sol[:])
    else:
      for child in branch(solLength):
        if is_promising(child,solLength):
          sol[solLength] = child
          backtracking(solLength+1)

  backtracking(0)
  return solutions

######################################################################
# This scheme can be simplified when is_complete and promising implies
# is_feasible as follows
######################################################################

# pseudo-code python, backtracking
def MYPROBLEM(data):
  sol = [None]*len(problem)
  solutions = []
  def backtracking(solLength):
    if is_complete(solLength):
      return True
    # not complete, lets branch
    for child in branch(solLength):
      if is_promising(child,solLength):
        sol[solLength] = child
        if backtracking(solLength+1):
          return True
    return False

  if backtracking(0):
    solutions.append(sol) # sol should contain the unique solution
  return solutions

# pseudo-code python, backtracking
# scheme to find all solutions, we have removed some details, compare with previous scheme:
def MYPROBLEM(data):
  sol = [None]*len(problem)
  solutions = []
  def backtracking(solLength):
    if is_complete(solLength):
      solutions.append(sol[:])
    else:
      for child in branch(solLength):
        if is_promising(child,solLength):
          sol[solLength] = child
          backtracking(solLength+1)

  backtracking(0)
  return solutions

