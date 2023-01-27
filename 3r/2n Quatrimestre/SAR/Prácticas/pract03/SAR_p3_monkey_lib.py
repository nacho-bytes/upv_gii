#!/usr/bin/env python
#! -*- encoding: utf8 -*-
# 3.- Mono Library

import pickle
import random
import re
import sys

## Nombres:
## Andrea Gascó Pau y Iñaki Diez Lambies  

###########################################
###########################################
###                                     ###
###  SE HAN IMPLEMENTADO LOS TRIGRAMAS  ###
###                                     ###
###########################################
###########################################

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
        # Inicializamos variables para tener en cuenta el historial
        # (2 en caso bigrams, 3 para trigrams) 
        word = None
        last_word = None
        last_last_word = None
        # Dividimos la frase en palabras 
        for word in sentence.split() :
            # No diferenciamos mayus/minus 
            word = word.lower()
            if last_word is not None : # 1a iteración no cuenta 
                # Creamos la entrada si no existe 
                self.index['bi'][last_word] = self.index['bi'].get(last_word, {}) 
                # Actualizamos el conteo 
                self.index['bi'][last_word][word] = self.index['bi'][last_word].get(word, 0) + 1
                if tri and last_last_word is not None :
                    # Ídem para los trigramas 
                    self.index['tri'][(last_last_word, last_word)] = self.index['tri'].get(((last_last_word, last_word)), {})
                    self.index['tri'][(last_last_word, last_word)][word] = self.index['tri'][(last_last_word, last_word)].get(word, 0) + 1
            # Actualizamos el histórico 
            last_last_word = last_word
            last_word = word

    def compute_index(self, filename, tri):
        self.index = {'name': filename, "bi": {}}
        if tri:
            self.index["tri"] = {}
        
        # Abrimos el archivo 
        with open(filename) as f :
            # Cargamos en un string todo el archivo 
            data = f.read()
            # Creamos un iterable de frases dividéndolas por alfanuméricos 
            sentences = self.r1.split(data)
            for sentence in sentences :
                # Pasamos a la función un iterable (diviendo por espacios)
                # y con $ al principio y al final  
                sentence = '$ ' + self.r2.sub(' ', sentence).strip() + ' $'
                self.index_sentence(sentence, tri)
        
        sort_index(self.index['bi'])
        if tri:
            sort_index(self.index['tri'])
        

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
        # Una por frase 
        for x in range(n) :
            # Inicializamos la frase a imprimir como string vacio  
            sentence = ""
            # Creamos variables de histórico (last_last_word para trigramas
            # el resto para bigramas) 
            last_last_word = None
            last_word = '$'
            next_word = None
            l = 25 # Frases de como mucho 25 palabras 
            # Paramos si la siguiente palabra es un $ 
            while l > 0 and next_word != '$' : 
                # Si es por bigramas o si es la primera palabra
                # aplicamos solo dos términos  
                if 'tri' not in self.index or last_last_word is None :
                    next_word_list = self.index['bi'][last_word][1]
                # En caso contrario tenemos en cuenta trigramas 
                else:
                    next_word_list = self.index['tri'][(last_last_word, last_word)][1]
                # Scamos un array de pesos y otro de las palabras correspondientes 
                next_word_weights, next_words = map(list, zip(*next_word_list))
                # Calculamos la siguiente palbra a partir de esto 
                next_word = random.choices(next_words, next_word_weights)[0]
                # En caso trigramas guardamos histórico de 3 
                if 'tri' in self.index : last_last_word = last_word
                # En cualquier caso guardamos el anterior 
                last_word = next_word
                # Si no se trata de $ la escribimos 
                if next_word != '$' : sentence = ' '.join([sentence, next_word])
                l = l -1
            # Imprimimos el resultado 
            print(sentence)



if __name__ == "__main__":
    print("Este fichero es una librería, no se puede ejecutar directamente")


