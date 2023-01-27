#!/bin/bash

# Corpus web: http://yann.lecun.com/exdb/mnist/

wget http://yann.lecun.com/exdb/mnist/train-images-idx3-ubyte.gz
wget http://yann.lecun.com/exdb/mnist/train-labels-idx1-ubyte.gz
wget http://yann.lecun.com/exdb/mnist/t10k-images-idx3-ubyte.gz
wget http://yann.lecun.com/exdb/mnist/t10k-labels-idx1-ubyte.gz

zcat train-images-idx3-ubyte.gz | od -v -An -j16 -w784 -t u1 | gzip -f -c > train-images-idx3-ubyte.txt.gz

zcat train-labels-idx1-ubyte.gz | od -v -An -j8  -w1   -t u1 | gzip -f -c > train-labels-idx1-ubyte.txt.gz

zcat t10k-images-idx3-ubyte.gz  | od -v -An -j16 -w784 -t u1 | gzip -f -c >  t10k-images-idx3-ubyte.txt.gz

zcat t10k-labels-idx1-ubyte.gz  | od -v -An -j8  -w1   -t u1 | gzip -f -c >  t10k-labels-idx1-ubyte.txt.gz
