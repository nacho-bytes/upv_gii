from __future__ import print_function

import numpy as np
from numpy import linalg as LA

lx = [ [1, 1], [2, 1], [2, 2], [3, 2], [4, 3], [3, 4], [5, 3] ]
C = [ 'A', 'B', 'A', 'B', 'A', 'B', 'A', 'B' ]
X = np.array(lx)

print("Prototypes: ")
print(X)

print("\nLabels: ")
print(C)

y = np.array([3, 1])

print("\nPoint to classify: ")
print(y)

ld = []
for x in X:
  d = LA.norm(x-y)
  ld.append(d)

print("\nDistances: ")
print(ld)

c = np.argmin(ld)
print("\nFinal class: ", C[c])
