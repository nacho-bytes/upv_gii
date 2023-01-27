#!/usr/bin/env python
#! -*- encoding: utf8 -*-
# 3.- Mono Library

import pickle
import random
import re
import sys

## Nombres: 

########################################################################
########################################################################
###                                                                  ###
###  Todos los métodos y funciones que se añadan deben documentarse  ###
###                                                                  ###
########################################################################
########################################################################



def sort_index(d):
    for k in d:
        l = sorted(((y, x) for x, y in d[k].items()), reverse=True)
        d[k] = (sum(x for x, _ in l), l)


class Monkey():

    def __init__(self):
        self.r1 = re.compile('[.;?!]|\n\n')
        self.r2 = re.compile('\W+')


    def index_sentence(self, sentence, tri):
        #############
        # COMPLETAR #
        #############
        last_word = None
        for word in sentence.split() :
            word = word.lower()
            if last_word is not None :
                self.index['bi'][last_word] = self.index['bi'].get(last_word, {}) 
                self.index['bi'][last_word][word] = self.index['bi'][last_word].get(word, 0) + 1
            last_word = word



    def compute_index(self, filename, tri):
        self.index = {'name': filename, "bi": {}}
        if tri:
            self.index["tri"] = {}
        #############
        # COMPLETAR #
        #############
        with open(filename) as f :
            data = f.read()
            sentences = self.r1.split(data)
            for sentence in sentences :
                sentence = '$ ' + self.r2.sub(' ', sentence).strip() + ' $'
                self.index_sentence(sentence, tri)
        sort_index(self.index['bi'])
        if tri:
            sort_index(self.index['tri'])
        print(self.index)
        

    def load_index(self, filename):
        with open(filename, "rb") as fh:
            self.index = pickle.load(fh)


    def save_index(self, filename):
        with open(filename, "wb") as fh:
            pickle.dump(self.index, fh)


    def save_info(self, filename):
        with open(filename, "w") as fh:
            print("#" * 20, file=fh)
            print("#" + "INFO".center(18) + "#", file=fh)
            print("#" * 20, file=fh)
            print("filename: '%s'\n" % self.index['name'], file=fh)
            print("#" * 20, file=fh)
            print("#" + "BIGRAMS".center(18) + "#", file=fh)
            print("#" * 20, file=fh)
            for word in sorted(self.index['bi'].keys()):
                wl = self.index['bi'][word]
                print("%s\t=>\t%d\t=>\t%s" % (word, wl[0], ' '.join(["%s:%s" % (x[1], x[0]) for x in wl[1]])), file=fh)
            if 'tri' in self.index:
                print(file=fh)
                print("#" * 20, file=fh)
                print("#" + "TRIGRAMS".center(18) + "#", file=fh)
                print("#" * 20, file=fh)
                for word in sorted(self.index['tri'].keys()):
                    wl = self.index['tri'][word]
                    print("%s\t=>\t%d\t=>\t%s" % (word, wl[0], ' '.join(["%s:%s" % (x[1], x[0]) for x in wl[1]])), file=fh)


    def generate_sentences(self, n=10):
        #############
        # COMPLETAR #
        #############
        for x in range(n) :
            sentence = ""
            next_word = '$'
            l = 25
            while l > 0 and (next_word != '$' or (next_word == '$' and l == 25)):
                next_word_list = self.index['bi'][next_word][1]
                weights, words = map(list, zip(*next_word_list))
                word = random.choices(words, weights)[0] 
                if word != '$' : sentence = " ".join([sentence, word])
                next_word = word
                l = l - 1
            print(sentence)



if __name__ == "__main__":
    print("Este fichero es una librería, no se puede ejecutar directamente")


