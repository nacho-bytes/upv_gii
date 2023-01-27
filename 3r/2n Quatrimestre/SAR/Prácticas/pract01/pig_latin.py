# Autores: Andrea Gascó Pau y Iñaki Diez Lambies  

#!/usr/bin/env python
#! -*- encoding: utf8 -*-

# 1.- Pig Latin


import sys
import re


class Translator():

    def __init__(self, punt=None):
        """
        Constructor de la clase Translator

        :param punt(opcional): una cadena con los signos de puntuación
                                que se deben respetar
        :return: el objeto de tipo Translator
        """
        if punt is None:
            punt = ".,;?!"
        # Utilitzant self.re.findall(str) ens torna 
        # un list de tuples (paraula, signes_de_puntuacio)
        self.re = re.compile(r"(\w+)([" + punt + r"]*)")    

    def translate_word(self, word):
        """
        Recibe una palabra en inglés y la traduce a Pig Latin

        :param word: la palabra que se debe pasar a Pig Latin
        :return: la palabra traducida
        """

        # Si el primer caracter no es lletra no modifica
        if (not word[0].isalpha()) : 
            return word
        # Si el primer caracter es una vocal afegeix 'yay' al final
        elif (re.search('[aeiouyAEIOUY]', word[0])) : 
            # Depen si tota la paraula esta en majuscula o no
            # el 'yay' tambe ho estara
            return word + "yay" if not word.isupper() else word + "YAY"
        # Sino el primer caracter es una consonant
        else :
            # Busquem l'index de la primera vocal
            # Search ens torna un objecte de forma que podem extraure
            # el primer match amb .start()
            firts_vowel_index = re.search('[aeiouyAEIOUY]',word).start()
            # Menegem l'anterior al final i afegim 'ay'
            new_word = word[firts_vowel_index:] + word[:firts_vowel_index] + "ay"
            # Si es tota majuscula la nova tambe
            if word.isupper() : new_word = new_word.upper()
            # Si el primer caracter era majuscula la nova tambe
            elif word[0].isupper() : new_word = new_word.lower().capitalize()
            return new_word

    def translate_sentence(self, sentence):
        """
        Recibe una frase en inglés y la traduce a Pig Latin

        :param sentence: la frase que se debe pasar a Pig Latin
        :return: la frase traducida
        """
        # Separem la frase en tuples (paraula, signes)
        sentence = self.re.findall(sentence)
        # Crear array buit 
        new_sentence = list() 
        # Per a cada paraula la traduim i li afegim el signe de puntuacio
        for word in sentence : 
            new_sentence.append(self.translate_word(word[0]) + word[1])
        # La tornem com un string
        return ' '.join(new_sentence)

    def translate_file(self, filename):
        """
        Recibe un fichero y crea otro con su tradución a Pig Latin

        :param filename: el nombre del fichero que se debe traducir
        :return: True / False 
        """
        # Obrim el arxiu original
        file = open(filename)
        # Separem el nom de l'extencio
        filename = self.re.findall(filename)
        # Li fiquem el nou nom i el creem amb 'w' per poder escriure-hi
        new_filename = filename[0][0] + "_latin." + filename[1][0]
        new_file = open(new_filename, "w")
        # Traduim cada linia i l'afeim al nou arxiu
        for line in file.readlines() :
            new_file.write(self.translate_sentence(line) + "\n")
        # Tanquem els arxius
        file.close(); new_file.close()
        return True 


if __name__ == "__main__":
    if len(sys.argv) > 2:
        print(f'Syntax: python {sys.argv[0]} [filename]')
        exit()
    t = Translator()
    if len(sys.argv) == 2:
        t.translate_file(sys.argv[1])
    else:
        sentence = input("ENGLISH: ")
        while len(sentence) > 1:
            print("PIG LATIN:", t.translate_sentence(sentence))
            sentence = input("ENGLISH: ")