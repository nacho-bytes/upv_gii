import math
import numpy as np

def linmach(w,X):
    return np.argmax(X@w,axis=1)
