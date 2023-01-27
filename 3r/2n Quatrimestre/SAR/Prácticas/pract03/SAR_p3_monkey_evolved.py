#!/usr/bin/env python
#! -*- encoding: utf8 -*-
# 3.- Mono Evolved

import pickle
import random
import sys
from SAR_p3_monkey_lib import Monkey


if __name__ == "__main__":

    if len(sys.argv) not in (2, 3):
        print("python %s indexfile [n]" % sys.argv[0])
        sys.exit(-1)
    
    index_filename = sys.argv[1]
    try:
        n = int(sys.argv[2])
    except:
        n = 10

    m = Monkey()
    m.load_index(index_filename)
    m.generate_sentences(n)
