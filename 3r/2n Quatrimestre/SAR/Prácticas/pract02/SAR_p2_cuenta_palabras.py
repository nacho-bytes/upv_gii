#! -*- encoding: utf8 -*-

## Nombres: 
## Andrea Gascó Pau y Iñaki Diez Lambies  

##########################################
##########################################
###                                    ###
###  SE HAN IMPLEMENTADO LOS BIGRAMAS  ###
###                                    ###
##########################################
##########################################

########################################################################
########################################################################
###                                                                  ###
###  Todos los métodos y funciones que se añadan deben documentarse  ###
###                                                                  ###
########################################################################
########################################################################

import argparse
import re
import sys


def sort_dic_by_values(d, asc=True):
    return sorted(d.items(), key=lambda a: (-a[1], a[0]))

class WordCounter:

    def __init__(self):
        """
           Constructor de la clase WordCounter
        """
        # Hace macth con cualquier cosa que no 
        # sea una cadena alfanumérica.
        # Para limpiar se puede utilizar 
        # clean_re.sub(repl, str).split()
        self.clean_re = re.compile('\W+') 

    def write_stats(self, filename, stats, use_stopwords, full):
        """
        Este método escribe en fichero las estadísticas de un texto
            
        :param 
            filename: el nombre del fichero destino.
            stats: las estadísticas del texto.
            use_stopwords: booleano, si se han utilizado stopwords
            full: boolean, si se deben mostrar las stats completas

        :return: None
        """
        # Contear el nombre de stopwords al diccionari i llevar-lo del total
        with open(filename, 'w') as fh:
            fh.write('Lines: '  +  str(stats['nlines']) + '\n')
            fh.write('Number words (including stopwords): ' +  str(stats['nwords']) + '\n')
            if use_stopwords :
                fh.write('Number words (without stopwords): ' +  str(stats['nnonstopwords']) + '\n')
            fh.write('Vocabulary size: ' +  str(len(stats['word'])) + '\n')
            fh.write('Number of symbols ' +  str(sum(stats['symbol'].values())) + '\n')
            fh.write('Number of different symbols: ' +  str(len(stats['symbol'])) + '\n')
            
            """
            Para la frecuencia de las palabras consultamos las entradas
            correspondiente de cada diccionario (word y symbol) y los 
            ordenamos respecto a su clave (alfabéticamente) con v: v[0]
            o respecto a su valor y luego clave (frecuencia) v: (-v[1],v[0])
            """
            fh.write('Words (alphabetical order):\n')
            i = 0
            for key,value in sorted(stats['word'].items(), key=lambda v: v[0]):
                fh.write('\t' + str(key) + ' : ' + str(value) + '\n') 
                i += 1
                if i == 20 and not full: break;
            fh.write('Words (by frequency order):\n')
            i = 0
            for key,value in sorted(stats['word'].items(), key = lambda v: (-v[1],v[0])):
                fh.write('\t' + str(key) + ' : ' + str(value) + '\n')  
                i += 1
                if i == 20 and not full: break;
            fh.write('Symbols (alphabetical order):\n')
            i = 0
            for key,value in sorted(stats['symbol'].items(), key=lambda v: v[0]):
                fh.write('\t' + str(key) + ' : ' + str(value) + '\n') 
                i += 1
                if i == 20 and not full : break;
            fh.write('Symbols (by frequency order):\n')
            i = 0
            for key,value in sorted(stats['symbol'].items(), key = lambda v: (-v[1],v[0])):
                fh.write('\t' + str(key) + ' : ' + str(value) + '\n') 
                i += 1
                if i == 20 and not full: break;
            """
            En el caso de que se requiera bigramas realizamos el mismo
            proceso anteriormente descrito
            """
            if 'biword' and 'bisymbol' in stats:
                fh.write('Words pairs (alphabetical order):\n')
                i = 0
                for key,value in sorted(stats['biword'].items(), key=lambda v: v[0]):
                    fh.write('\t' + str(key) + ' : ' + str(value) + '\n') 
                    i += 1
                    if i == 20 and not full: break;
                fh.write('Words pairs (by frequency order):\n')
                i = 0
                for key,value in sorted(stats['biword'].items(), key = lambda v: (-v[1],v[0])):
                    fh.write('\t' + str(key) + ' : ' + str(value) + '\n')  
                    i += 1
                    if i == 20 and not full: break;
                fh.write('Symbols pairs (alphabetical order):\n')
                i = 0
                for key,value in sorted(stats['bisymbol'].items(), key=lambda v: v[0]):
                    fh.write('\t' + str(key) + ' : ' + str(value) + '\n') 
                    i += 1
                    if i == 20 and not full : break;
                fh.write('Symbols pairs (by frequency order):\n')
                i = 0
                for key,value in sorted(stats['bisymbol'].items(), key = lambda v: (-v[1],v[0])):
                    fh.write('\t' + str(key) + ' : ' + str(value) + '\n') 
                    i += 1
                    if i == 20 and not full: break;
            fh.close()
        


    def file_stats(self, filename, lower, stopwordsfile, bigrams, full):
        """
        Este método calcula las estadísticas de un fichero de texto

        :param 
            filename: el nombre del fichero.
            lower: booleano, se debe pasar todo a minúsculas?
            stopwordsfile: nombre del fichero con las stopwords o None si no se aplican
            bigram: booleano, se deben calcular bigramas?
            full: booleano, se deben montrar la estadísticas completas?

        :return: None
        """

        stopwords = [] if stopwordsfile is None else open(stopwordsfile).read().split()

        # variables for results

        sts = {
                'nwords': 0,
                'nnonstopwords': 0,
                'nlines': 0,
                'word': {},
                'symbol': {}
                }

        if bigrams:
            sts['biword'] = {}
            sts['bisymbol'] = {}

        # completar
        with open(filename) as file:
            for line in file.readlines() :
                # Convertimos la linea sustituyendo por los espacios  
                line = self.clean_re.sub(' ', line).split()
                # Si es bigrama insertamos $ al principio y al final  
                if bigrams : 
                    line.insert(0, '$')
                    line.append('$')
                # Variable auxiliar para cuando usamos bigramas 
                lastWord = None
                for word in line :
                    # Variable auxiliar bool para saber 
                    # si la palabra a analizar es una stopword  
                    stopword = word in stopwords
                    # Si no hay que tener en cuenta las mayúsculas 
                    # la hacemos minúscula  
                    if lower : word = word.lower()
                    # Si la palabra no es una stopword o un símbolo
                    # auxiliar la añadimos al conteo  
                    if not stopword and word != '$': sts['word'][word] = sts['word'].get(word, 0) + 1
                    # Idem para cada símbolo 
                    lastSymbol = None
                    for symbol in word :
                        if not stopword and symbol != '$': sts['symbol'][symbol] = sts['symbol'].get(symbol, 0) + 1    
                        if bigrams and lastSymbol is not None :
                            bisymbol = lastSymbol + symbol
                            if bisymbol != '$$':
                                sts['bisymbol'][bisymbol] = sts['bisymbol'].get(bisymbol, 0) + 1
                        lastSymbol = symbol
                    # Realizamos conteo de las palabras totales 
                    sts['nwords'] += 1 
                    # y de aquellas que no son stopwords 
                    if not stopword : 
                        sts['nnonstopwords'] += 1
                    # Si trabajamos con bigramas entonces
                    # vamos sumando los pares de palabras 
                    # diferentes de los auxiliares   
                    if bigrams and lastWord is not None:
                        bigram = lastWord + ' ' + word
                        if bigram != '$ $':
                            sts['biword'][bigram] = sts['biword'].get(bigram, 0) + 1
                    lastWord = word
                # Conteo de líneas totales 
                sts['nlines'] += 1
        
        new_filename = filename.split('.')
        options = '_'
        if lower : options += 'l'
        if stopwordsfile : options += 's'
        if bigrams : options += 'b'
        if full : options += 'f'
        if not options == '_' : new_filename[0] += options
        # Si l'array no té extensió, aleshores té llargaria 1
        # i per tant no cal juntar-lo en res, en cas contrari join amb el punt

        if not len(new_filename) == 1 :
            new_filename[0] += '_stats' 
            new_filename = '.'.join(new_filename)
        else: 
            new_filename[0] += '_stats' 
            new_filename = ''.join(new_filename)

        self.write_stats(new_filename, sts, stopwordsfile is not None, full)


    def compute_files(self, filenames, **args):
        """
        Este método calcula las estadísticas de una lista de ficheros de texto

        :param 
            filenames: lista con los nombre de los ficheros.
            args: argumentos que se pasan a "file_stats".

        :return: None
        """

        for filename in filenames:
            self.file_stats(filename, **args)

if __name__ == "__main__":

    parser = argparse.ArgumentParser(description='Compute some statistics from text files.')
    parser.add_argument('file', metavar='file', type=str, nargs='+',
                        help='text file.')

    parser.add_argument('-l', '--lower', dest='lower',
                        action='store_true', default=False, 
                        help='lowercase all words before computing stats.')

    parser.add_argument('-s', '--stop', dest='stopwords', action='store',
                        help='filename with the stopwords.')

    parser.add_argument('-b', '--bigram', dest='bigram',
                        action='store_true', default=False, 
                        help='compute bigram stats.')

    parser.add_argument('-f', '--full', dest='full',
                        action='store_true', default=False, 
                        help='show full stats.')

    args = parser.parse_args()
    wc = WordCounter()
    wc.compute_files(args.file,
                     lower=args.lower,
                     stopwordsfile=args.stopwords,
                     bigrams=args.bigram,
                     full=args.full)


