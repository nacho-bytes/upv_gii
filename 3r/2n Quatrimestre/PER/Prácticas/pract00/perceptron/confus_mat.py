import numpy as np

def confus(truelabs,recolabs):
  return np.sum(np.not_equal(truelabs, recolabs))
