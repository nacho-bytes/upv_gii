import pca as p
import numpy as np
import matplotlib.pyplot as plt

X = np.load("./data/train-images-idx3-ubyte.npz")['X']
m,W = p.pca(X)
print(np.shape(W))

for rows in range(np.shape(X)[0]):
    x=np.reshape(W[:,rows],(28,28))
    plt.imshow(x,cmap='gray_r')
    plt.axis('off')
    plt.show()