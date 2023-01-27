from distutils import filelist
import json
from nltk.stem.snowball import SnowballStemmer
import os
import re
import pickle
import sys

from numpy import true_divide

class SAR_Project:
    """
    Prototipo de la clase para realizar la indexacion y la recuperacion de noticias
        
        Preparada para todas las ampliaciones:
          parentesis + multiples indices + posicionales + stemming + permuterm + ranking de resultado

    Se deben completar los metodos que se indica.
    Se pueden añadir nuevas variables y nuevos metodos
    Los metodos que se añadan se deberan documentar en el codigo y explicar en la memoria
    """

    # lista de campos, el booleano indica si se debe tokenizar el campo
    # NECESARIO PARA LA AMPLIACION MULTIFIELD
    fields = [("title", True), ("date", False),
              ("keywords", True), ("article", True),
              ("summary", True)]
    
    
    # numero maximo de documento a mostrar cuando self.show_all es False
    SHOW_MAX = 10


    def __init__(self):
        """
        Constructor de la classe SAR_Indexer.
        NECESARIO PARA LA VERSION MINIMA

        Incluye todas las variables necesaria para todas las ampliaciones.
        Puedes añadir más variables si las necesitas 

        """
        self.index = {} # hash para el indice invertido de terminos --> clave: termino, valor: posting list.
                        # Si se hace la implementacion multifield, se pude hacer un segundo nivel de hashing de tal forma que:
                        # self.index['title'] seria el indice invertido del campo 'title'.
        self.sindex = {} # hash para el indice invertido de stems --> clave: stem, valor: lista con los terminos que tienen ese stem
        self.ptindex = {} # hash para el indice permuterm --> clave: permuterm, valor: lista con los terminos que tienen ese permuterm
        self.docs = {} # diccionario de documentos --> clave: entero(docid),  valor: ruta del fichero.
        self.weight = {} # hash de terminos para el pesado, ranking de resultados. puede no utilizarse
        self.news = {} # hash de noticias --> clave entero (newid), valor: la info necesaria para diferenciar la noticia dentro de su fichero (doc_id y posición dentro del documento)
        self.tokenizer = re.compile("\W+") # expresion regular para hacer la tokenizacion
        self.stemmer = SnowballStemmer('spanish') # stemmer en castellano
        self.show_all = False # valor por defecto, se cambia con self.set_showall()
        self.show_snippet = False # valor por defecto, se cambia con self.set_snippet()
        self.use_stemming = False # valor por defecto, se cambia con self.set_stemming()
        self.use_ranking = False  # valor por defecto, se cambia con self.set_ranking()

    ###############################
    ###                         ###
    ###      CONFIGURACION      ###
    ###                         ###
    ###############################


    def set_showall(self, v):
        """

        Cambia el modo de mostrar los resultados.
        
        input: "v" booleano.

        UTIL PARA TODAS LAS VERSIONES

        si self.show_all es True se mostraran todos los resultados el lugar de un maximo de self.SHOW_MAX, no aplicable a la opcion -C

        """
        self.show_all = v


    def set_snippet(self, v):
        """

        Cambia el modo de mostrar snippet.
        
        input: "v" booleano.

        UTIL PARA TODAS LAS VERSIONES

        si self.show_snippet es True se mostrara un snippet de cada noticia, no aplicable a la opcion -C

        """
        self.show_snippet = v


    def set_stemming(self, v):
        """

        Cambia el modo de stemming por defecto.
        
        input: "v" booleano.

        UTIL PARA LA VERSION CON STEMMING

        si self.use_stemming es True las consultas se resolveran aplicando stemming por defecto.

        """
        self.use_stemming = v


    def set_ranking(self, v):
        """

        Cambia el modo de ranking por defecto.
        
        input: "v" booleano.

        UTIL PARA LA VERSION CON RANKING DE NOTICIAS

        si self.use_ranking es True las consultas se mostraran ordenadas, no aplicable a la opcion -C

        """
        self.use_ranking = v




    ###############################
    ###                         ###
    ###   PARTE 1: INDEXACION   ###
    ###                         ###
    ###############################


    def index_dir(self, root, **args):
        """
        NECESARIO PARA TODAS LAS VERSIONES
        
        Recorre recursivamente el directorio "root" e indexa su contenido
        los argumentos adicionales "**args" solo son necesarios para las funcionalidades ampliadas

        """

        self.multifield = args['multifield']
        self.positional = args['positional']
        self.stemming = args['stem']
        self.permuterm = args['permuterm']

        # Inicializar diccionarios adicionales
        self.index['article'] = {}
        if (self.multifield):
            self.index['title'] = {}
            self.index['date'] = {}
            self.index['keywords'] = {}
            self.index['summary'] = {}

        for dir, subdirs, files in os.walk(root): # Para todos los directorios
            for filename in files: # Para todos los archivos
                if filename.endswith('.json'):
                    fullname = os.path.join(dir, filename)
                    self.index_file(fullname) # Los indexamos
        
        # Si se requiere realizamos los diccionarios adicionales
        if (self.stemming):
            self.make_stemming()
        if (self.permuterm):
            self.make_permuterm()
        

    def index_file(self, filename):
        """
        NECESARIO PARA TODAS LAS VERSIONES

        Indexa el contenido de un fichero.

        Para tokenizar la noticia se debe llamar a "self.tokenize"

        Dependiendo del valor de "self.multifield" y "self.positional" se debe ampliar el indexado.
        En estos casos, se recomienda crear nuevos metodos para hacer mas sencilla la implementacion

        input: "filename" es el nombre de un fichero en formato JSON Arrays (https://www.w3schools.com/js/js_json_arrays.asp).
                Una vez parseado con json.load tendremos una lista de diccionarios, cada diccionario se corresponde a una noticia

        """

        with open(filename) as fh:
            jlist = json.load(fh)
        #
        # "jlist" es una lista con tantos elementos como noticias hay en el fichero,
        # cada noticia es un diccionario con los campos:
        #      "title", "date", "keywords", "article", "summary"
        #
        # En la version basica solo se debe indexar el contenido "article"
        #
        #
        #
            # Asignamos al documento una id
            self.docs[len(self.docs)] = filename
            
            # Para cada noticia del documento
            for newpos, new in enumerate(jlist):
                # Asignamos a la noticia una id y la indexamos 
                # con una tupla (número de documento, posición en el documento)
                self.news[len(self.news)] = (len(self.docs) - 1, newpos)
                
                # Si multifield para cada campo indexamos
                if (self.multifield):
                    for field, tok in self.fields:
                        self.index_field_of_new(new, field, tok)
                else: # Sino solo 'article'
                    self.index_field_of_new(new, "article", True)

                
    def index_field_of_new(self, new, field, tok):
        """
        Función que indexa el campo de la noticia 
        pasado como argumento 

        Args:
            new (dict): noticia a indexar
            field (str): campo a indexar
        """
        newid = len(self.news) - 1 # Usamos la longitud como identificador único
        fieldIndex = self.index[field] # Guardamos la referencia al diccionario del campo
        fieldList = new[field] # Guardamos el contenido del campo de la noticia
        if tok: # Si hace falta lo tokenizamos
            fieldList = self.tokenize(fieldList)
        else: # Si no transformamos el string en elemento de lista
            fieldList = [fieldList]
        for index, word in enumerate(fieldList): # Para cada palabra del campo
            if (fieldIndex.get(word, 0) == 0): # Si la lista de la palabra no existe la crea
                fieldIndex[word] = []
            wordList = fieldIndex[word] # Guardamos la referencia a esta
            if (self.positional):
                # Si hemos consultado esta palabra en esta noticia, añadimos su posición
                if (len(wordList) > 0 and wordList[-1][0] == newid): 
                    wordList[-1][1].append(index)
                else: # Si no lo creamos
                    wordList.append([newid, [index]])
            else :
                # Si hemos consultado esta palabra en esta noticia, sumamos 1
                if (len(wordList) > 0 and wordList[-1][0] == newid): 
                    wordList[-1][1] += 1
                else: # Si no lo creamos
                    wordList.append([newid, 1])

    def tokenize(self, text):
        """
        NECESARIO PARA TODAS LAS VERSIONES

        Tokeniza la cadena "texto" eliminando simbolos no alfanumericos y dividientola por espacios.
        Puedes utilizar la expresion regular 'self.tokenizer'.

        params: 'text': texto a tokenizar

        return: lista de tokens

        """
        return self.tokenizer.sub(' ', text.lower()).split()



    def make_stemming(self):
        """
        NECESARIO PARA LA AMPLIACION DE STEMMING.

        Crea el indice de stemming (self.sindex) para los terminos de todos los indices.

        self.stemmer.stem(token) devuelve el stem del token

        """
        for field, tok in self.fields: # Para cada campo
            if self.multifield or field == 'article': # En caso multifield
                fieldDict = self.index[field]
                self.sindex[field] = {} # Creamos el diccionario de stems para el campo
                fieldSindex = self.sindex[field]
                for word in fieldDict.keys(): # Para cada palabra el indice del campo
                    stemedWord = self.stemmer.stem(word)
                    # Sino tiene valor para esta clave lo creamos
                    fieldSindex[stemedWord] = fieldSindex.get(stemedWord, [])
                    fieldSindex[stemedWord].append(word) # Añadimos la palabra asociada al stem

    def make_permuterm(self):
        """
        NECESARIO PARA LA AMPLIACION DE PERMUTERM

        Crea el indice permuterm (self.ptindex) para los terminos de todos los indices.

        """
        for field, tok in self.fields: # Para cada campo
            if self.multifield or field == 'article': # En caso multifield
                fieldDict = self.index[field]
                self.ptindex[field] = [] # Creamos el diccionario de permuterms para el campo
                fieldPtindex = self.ptindex[field]
                for word in fieldDict.keys(): # Para cada palabra el indice del campo
                    for i in range(len(word) + 1): # Para cada permuterm posible de la palabra
                        permWord = word[i:] + '$' + word[:i] # Generamos el permuterm
                        fieldPtindex.append((permWord, word)) # Lo añadimos como una tupla (permuterm de la palabra, palabra asociada)
                fieldPtindex.sort() # Ordenamos respecto a los permuterms

    def show_stats(self):
        """
        NECESARIO PARA TODAS LAS VERSIONES
        
        Muestra estadisticas de los indices
        
        """
        print("=" * 40)
        print("Number of indexed days:", len(self.docs))
        print("-" * 40)
        print("Number of indexed news:", len(self.news))
        print("-" * 40)
        print('TOKENS:')
        for field, tok in self.fields:
            if (self.multifield or field == "article"):
                print("\t# of tokens in '{}': {}".format(field, len(self.index[field])))
        if (self.permuterm):
            print("-" * 40)
            print('PERMUTERMS:')
            for field, tok in self.fields:
                if (self.multifield or field == "article"):
                    print("\t# of tokens in '{}': {}".format(field, len(self.ptindex[field])))
        if (self.stemming):
            print("-" * 40)
            print('STEMS:')
            for field, tok in self.fields:
                if (self.multifield or field == "article"):
                    print("\t# of tokens in '{}': {}".format(field, len(self.sindex[field])))
        print("-" * 40)
        if (self.positional):
            print('Positional queries are allowed.')
        else:    
            print('Positional queries are NOT allowed.')
        print("=" * 40)
        
    ###################################
    ###                             ###
    ###   PARTE 2.1: RECUPERACION   ###
    ###                             ###
    ###################################


    def solve_query(self, query, prev={}):
        """
        NECESARIO PARA TODAS LAS VERSIONES

        Resuelve una query.
        Debe realizar el parsing de consulta que sera mas o menos complicado en funcion de la ampliacion que se implementen


        param:  "query": cadena con la query
                "prev": incluido por si se quiere hacer una version recursiva. No es necesario utilizarlo.


        return: posting list con el resultado de la query

        """
        # Si no hay nada en la query, devolvemos lista vacia
        if query is None or len(query) == 0:
            return []

        # Preproceso de la query si es un string. La convertimos en una lista de elementos (incluidos operaciones, parentesis y posicionales)
        if isinstance(query, str): queryList = self.prepare_query_list(query)
        else: queryList = query
        
        # Caso base si solo hay un elemento para el que resolver la consulta
        if len(queryList) == 1:
            element = queryList[0]
            # Si el indice es multicampo, guardamos el campo donde se buscara. Si no lo es, buscamos en 'article'
            if self.multifield: field, element = self.get_field(element)
            else: field, element = 'article', query
            # Si esta entre parentesis, los quitamos y llamamos a solve_query de la consulta interior
            if element.startswith('(') and element.endswith(')'):
                element = element[1:len(element)-1] 
                return self.solve_query(element)
            return self.get_posting(element, field)
            
        # Caso general: Si hay más de un elemento en la búsqueda        
        if len(queryList) > 1:
            opIndex = len(queryList) - 2
            operation = queryList[opIndex]
            beforeOp = queryList[0:opIndex]
            afterOp = queryList[opIndex + 1]
            # Llamadas recursivas en función de la operación a realizar
            if operation == 'or':
                return self.or_posting(self.solve_query(beforeOp), self.solve_query(afterOp))
            elif operation == 'and':
                return self.and_posting(self.solve_query(beforeOp), self.solve_query(afterOp))
            elif operation == 'not':
                # Si la operación es not, consultamos si hay otra operación que la precede y resolvemos
                if opIndex > 0: opIndex -= 1; operation = queryList[opIndex] # Si not es el primer elemento de la lista, no decrementamos el puntero
                else: return self.reverse_posting(self.solve_query(afterOp)) # Si lo es, resolvemos el not

                beforeOp = queryList[0:opIndex]
                if operation == 'or':
                    return self.or_posting(self.solve_query(beforeOp), 
                        self.reverse_posting(self.solve_query(afterOp)))
                elif operation == 'and':
                    return self.and_posting(self.solve_query(beforeOp), 
                        self.reverse_posting(self.solve_query(afterOp)))


    def get_field(self, query):
        """
        Separar campo para la busqueda de query

        param:  "query": cadena con el fragmeto de la query

        return: campo de la busqueda, fragmento de la query

        """
        field = 'article'

        if query.startswith(('title:', 'date:', 'keywords:', 'article:', 'summary:')):
            field, query = query[:query.index(':')], query[query.index(':')+1:]

        return field, query

        
    def prepare_query_list(self, query):
        """
        Convierte una query en una lista de elementos, apartando los elementos entre parentesis y comillas
        Tambien añadimos and donde sea necesario
        Debe realizar el parsing de consulta que sera mas o menos complicado en funcion de la ampliacion que se implementen

        param:  "query": cadena con la query

        return: lista con los elemetos mas superficiales de la query

        """

        openPar = [m.start() for m in re.finditer(r'\(',query)]
        closePar = [m.start() for m in re.finditer(r'\)',query)]
        
        # Conteo de parentesis
        ini = []; fin = []; closed = 0;
        for index in sorted(openPar + closePar):
            if closed == 0: ini.append(index)
            if index in openPar:
                closed += 1
            else:
                closed -= 1
            if closed == 0: fin.append(index)

        # Separar por parentesis mas externos
        if len(ini) > 0:
            if query[:ini[0]] != '':
                parenList = [query[:ini[0]].strip()]
            else: parenList = []
            for index,element in enumerate(ini):
                parenList.append(query[ini[index]:fin[index] + 1].strip())
                if index + 1 < len(ini):
                    parenList.append(query[fin[index] + 1: ini[index + 1]].strip())
            if len(query) > fin[len(fin) - 1] + 1:
                parenList.append(query[fin[len(fin) - 1] + 1:].strip())
        else: parenList = [query]
        # Separar por comillas
        comList = []
        for element in parenList:
            if '\"' in element and '(' not in element:
                comi = [m.start() for m in re.finditer(r'\"',element)]
                if element[:comi[0]] != '': elementList = [element[:comi[0]].strip()]
                else: elementList = []
                for index, c in enumerate(comi):
                    if index % 2 == 0:
                        elementList.append(element[comi[index]:comi[index + 1] + 1])
                    elif index < len(comi) - 1:
                        elementList.append(element[comi[index] + 1:comi[index + 1]].strip())
                if len(element) > comi[len(comi) - 1] + 1:
                    elementList.append(element[comi[len(comi) - 1] + 1:].strip())
                
                for e in elementList: comList.append(e)
            else:
                comList.append(element)

        # Tokenizar aquellos elementos no dependientes de comillas ni parentesis
        spcList = []
        for element in comList:
            if '\"' not in element and '(' not in element:
                elementList = element.split(' ')
                for e in elementList: spcList.append(e.strip())
            else:
                spcList.append(element)

        # Insertar ands donde haga falta (y unificar en un elemento busqueda posicional y su field)
        queryFinal = []
        needAnd = False # Booleano para saber si hace falta un and
        for ind, word in enumerate(spcList):
            word = word.strip()
            if word in ['title:', 'date:', 'keywords:', 'article:', 'summary:'] and spcList[ind+1].startswith('"'):
                spcList[ind+1] = word + spcList[ind+1]
                if needAnd:
                    queryFinal.append('and')
                    needAnd = False
            elif not needAnd:
                queryFinal.append(word)
                needAnd = True
                if word == 'not':
                    needAnd = False
            elif needAnd:
                if word in ['or','and']:
                    queryFinal.append(word)
                    needAnd = False
                else:
                    queryFinal.append('and')
                    queryFinal.append(word)
                    if word == 'not':
                        needAnd = False

        return queryFinal


    def get_posting(self, term, field='article'):
        """
        NECESARIO PARA TODAS LAS VERSIONES

        Devuelve la posting list asociada a un termino. 
        Dependiendo de las ampliaciones implementadas "get_posting" puede llamar a:
            - self.get_positionals: para la ampliacion de posicionales
            - self.get_permuterm: para la ampliacion de permuterms
            - self.get_stemming: para la amplaicion de stemming


        param:  "term": termino del que se debe recuperar la posting list.
                "field": campo sobre el que se debe recuperar la posting list, solo necesario se se hace la ampliacion de multiples indices

        return: posting list

        """
        # Llamada al get que corresponde según los parámetros indicados
        solution = []
        if self.permuterm and ('*' in term or '?' in term):
            solution =  self.get_permuterm(term, field)
        elif self.positional:
            if '\"' in term:
                term = term.replace('\"','')
                solution = self.get_positionals(term.split(' '), field)
            elif self.stemming and self.use_stemming:
                solution =  self.get_stemming(term, field)
            else:
                solution = self.get_positionals([term], field)
        elif self.stemming and self.use_stemming:
            solution =  self.get_stemming(term, field)
        else:
            solution =  self.index[field][term]

        return solution

    def get_positionals(self, terms, field='article'):
        """
        NECESARIO PARA LA AMPLIACION DE POSICIONALES

        Devuelve la posting list asociada a una secuencia de terminos consecutivos.

        param:  "terms": lista con los terminos consecutivos para recuperar la posting list.
                "field": campo sobre el que se debe recuperar la posting list, solo necesario se se hace la ampliacion de multiples indices

        return: posting list

        """
        # Intersercción de posting lists
        fieldDict = self.index[field]
        resPosting = fieldDict.get(terms[0], []) # Posting list del primer termino de la busqueda posicional
        for term in terms[1:]: # Para cada termino de la busqueda posicional
            termPosting = fieldDict.get(term, []) # Guardamos la posting list asociada al siguiente termino
            result = [] # Creamos lista auxiliar
            rIndex = 0; tIndex = 0 # Punteros a las dos posting lists
            # Algoritmo de interseccion de dos posting lists
            while rIndex < len(resPosting) and tIndex < len(termPosting):
                rData = resPosting[rIndex]
                tData = termPosting[tIndex]
                # En caso de coincidir la noticia, añadir aquellas posiciones que son consecutivas
                if rData[0] == tData[0]:
                    aux = [tEle for tEle in tData[1] if tEle-1 in rData[1]]
                    if (len(aux) > 0):
                        result.append([rData[0], aux])
                    rIndex += 1; tIndex += 1
                elif rData[0] > tData[0]:
                    tIndex += 1
                else:
                    rIndex += 1
            resPosting = result
            if len(resPosting) == 0:
                break
        return [[rData[0], len(rData[1])] for rData in resPosting]

    def get_stemming(self, term, field='article'):
        """
        NECESARIO PARA LA AMPLIACION DE STEMMING

        Devuelve la posting list asociada al stem de un termino.

        param:  "term": termino para recuperar la posting list de su stem.
                "field": campo sobre el que se debe recuperar la posting list, solo necesario se se hace la ampliacion de multiples indices

        return: posting list

        """        
        # Sacar union de posting lists de las palabras asociadas al stem del termino
        stem = self.stemmer.stem(term)
        wordList = self.sindex[field].get(stem, [])
        if len(wordList) == 0: return wordList # Si no existe palabra en el indice asociada al stem, devolvemos una lista vacia
        fieldDict = self.index[field]
        resPosting = fieldDict.get(wordList[0], [])
        for word in wordList[1:]:
            wordPosting = fieldDict.get(word, [])
            resPosting = self.or_posting(resPosting, wordPosting)
        return resPosting


    def get_permuterm(self, term, field='article'):
        """
        NECESARIO PARA LA AMPLIACION DE PERMUTERM

        Devuelve la posting list asociada a un termino utilizando el indice permuterm.

        param:  "term": termino para recuperar la posting list, "term" incluye un comodin (* o ?).
                "field": campo sobre el que se debe recuperar la posting list, solo necesario se se hace la ampliacion de multiples indices

        return: posting list

        """
        strict = '?' in term # Booleano para diferenciar el tipo de comodin
        termPartition = term.replace('*', '?').rpartition('?')
        permuterm = termPartition[2] + '$' + termPartition[0]
        permuList = self.ptindex.get(field)
        listWord = self.dicotomica(permuterm, permuList, strict)
        if len(listWord) == 0: return []
        fieldDict = self.index.get(field)
        resPosting = fieldDict.get(listWord[0], [])
        for word in listWord[1:]:
            wordPosting = fieldDict[word]
            resPosting = self.or_posting(resPosting, wordPosting)
        return resPosting


    def dicotomica(self, permuterm, permuList, strict):
        """

        Devuelve lista de palabras asociadas al permuterm.

        param:  "term": termino para recuperar la posting list, "term" incluye un comodin (* o ?).
                "field": campo sobre el que se debe recuperar la posting list, solo necesario se se hace la ampliacion de multiples indices

        return: posting list

        """
        inf, sup = 0, len(permuList) - 1
        while inf < sup:
            center = int(((sup - inf)/2) + inf)
            if permuterm == permuList[center][0]:
                break
            elif permuList[center][0] < permuterm: # Mitad derecha
                inf = center + 1
            else:
                sup = center
                if permuList[center - 1][0] < permuterm:
                    break
                    
        listWord = []
        while permuList[center][0].startswith(permuterm):
            word = permuList[center][1]
            if word not in listWord:
                if not strict or len(permuList[center][0]) <= len(permuterm) + 1: # Diferencia el tipo de comodin
                    listWord.append(word)
            center += 1
        return listWord


    def reverse_posting(self, p):
        """
        NECESARIO PARA TODAS LAS VERSIONES

        Devuelve una posting list con todas las noticias excepto las contenidas en p.
        Util para resolver las queries con NOT.


        param:  "p": posting list


        return: posting list con todos los newid exceptos los contenidos en p

        """
        news = self.news.keys()
        p = [newId for newId, f in p]
        return [[newId,0] for newId in news if newId not in p]


    def and_posting(self, p1, p2):
        """
        NECESARIO PARA TODAS LAS VERSIONES

        Calcula el AND de dos posting list de forma EFICIENTE

        param:  "p1", "p2": posting lists sobre las que calcular


        return: posting list con los newid incluidos en p1 y p2

        """
        if p1 == [] or p2 == []: return []
        respost = []
        iP1 = 0; iP2 = 0
        while iP1 < len(p1) and iP2 < len(p2):
            dataP1 = p1[iP1]
            dataP2 = p2[iP2]
            if dataP1[0] == dataP2[0]:
                respost.append(dataP1)
                iP1 += 1; iP2 += 1
            elif dataP1[0] > dataP2[0]:
                iP2 += 1
            else:
                iP1 += 1
        return respost

    def or_posting(self, p1, p2):
        """
        NECESARIO PARA TODAS LAS VERSIONES

        Calcula el OR de dos posting list de forma EFICIENTE

        param:  "p1", "p2": posting lists sobre las que calcular


        return: posting list con los newid incluidos de p1 o p2

        """

        respost = []
        iP1 = 0; iP2 = 0
        while iP1 < len(p1) and iP2 < len(p2):
            dataP1 = p1[iP1]
            dataP2 = p2[iP2]
            if dataP1[0] == dataP2[0]:
                respost.append(dataP1)
                iP1 += 1; iP2 += 1
            elif dataP1[0] > dataP2[0]:
                respost.append(dataP2)
                iP2 += 1
            else:
                respost.append(dataP1)
                iP1 += 1

        while iP1 < len(p1):
            respost.append(p1[iP1])
            iP1 += 1
        while iP2 < len(p2):
            respost.append(p2[iP2])
            iP2 += 1

        return respost

    def minus_posting(self, p1, p2):
        """
        OPCIONAL PARA TODAS LAS VERSIONES

        Calcula el except de dos posting list de forma EFICIENTE.
        Esta funcion se propone por si os es util, no es necesario utilizarla.

        param:  "p1", "p2": posting lists sobre las que calcular


        return: posting list con los newid incluidos de p1 y no en p2

        """
        iP1 = 0; iP2 = 0
        while iP1 < len(p1) and iP2 < len(p2):
            dataP1 = p1[iP1]
            dataP2 = p2[iP2]
            if dataP1[0] == dataP2[0]:
                p1.pop(iP1)
                iP2 += 1
            elif dataP1[0] > dataP2[0]:
                iP1 += 1
            else:
                iP2 += 1
        return p1

    #####################################
    ###                               ###
    ### PARTE 2.2: MOSTRAR RESULTADOS ###
    ###                               ###
    #####################################


    def solve_and_count(self, query):
        """
        NECESARIO PARA TODAS LAS VERSIONES

        Resuelve una consulta y la muestra junto al numero de resultados 

        param:  "query": query que se debe resolver.

        return: el numero de noticias recuperadas, para la opcion -T

        """
        result = self.solve_query(query.lower())
        print("%s\t%d" % (query, len(result)))
        return len(result)  # para verificar los resultados (op: -T)



    def solve_and_show(self, query):
        """
        NECESARIO PARA TODAS LAS VERSIONES

        Resuelve una consulta y la muestra informacion de las noticias recuperadas.
        Consideraciones:

        - En funcion del valor de "self.show_snippet" se mostrara una informacion u otra.
        - Si se implementa la opcion de ranking y en funcion del valor de self.use_ranking debera llamar a self.rank_result

        param:  "query": query que se debe resolver.

        return: el numero de noticias recuperadas, para la opcion -T
        
        """
        
        result = self.solve_query(query.lower())
        if self.use_ranking:
            result = self.rank_result(result, query)   

        print("========================")
        print("Query: '%s'" % query)
        print("Number of results: %d" % len(result))
        
        i = 1
        for posting in result:
            (doc,position) = self.news[posting[0]]
            filename = self.docs[doc]
            with open(filename) as fh:
                jlist = json.load(fh)
                jlist = jlist[position]
                fecha = jlist['date']
                title = jlist['title']
                keywords = jlist['keywords']
                article = jlist['article']


            if self.use_ranking is True and len(result)>0:
                print("#%d\t (%d) (%d) (%s) %s (%s) " % (i, doc, self.weight[id], fecha, title, keywords))
            else:
                print("#%d\t (%d) (0) (%s) %s (%s) " % (i, doc, fecha, title, keywords))

            
            if self.show_snippet is True:
                snippets = self.make_snippets(query, article)
                print("\t\t %s" % snippets)

            i += 1
            if i > self.SHOW_MAX and self.show_all == False:
                break

        print("========================")
        return len(result)



    def make_snippets(self, query, article):
        """
        Crea el snippet para una consulta en una noticia concreta.

        param:  "query": consulta 
                "article": articulo de la noticia donde sacar el snippet


        return: el string con el snippet

        """
        body = self.tokenize(article)
        query = query.replace('(', ' ')
        query = query.replace(')', ' ')
        query = query.replace('"', ' ')
        query = query.split(' ')
        listaindices = []
        for element in query:
            if ':' in element:
                element = element[element.find(':') + 1:]
            element = element.strip()
            if element not in ('', 'and','not','or','(',')') and '?' not in element and '*' not in element:
                for i in range(len(body)):
                    if self.stemming and self.use_stemming:
                        stem = self.stemmer.stem(element)
                        if stem == body[i].strip()[:len(stem)]:
                            listaindices.append(i)
                            break
                    else: 
                        if element == body[i].strip():
                            listaindices.append(i)
                            break
        listaindices.sort()
        stringRes = '[...] '
        if len(listaindices) > 0:
            for i in listaindices[:len(listaindices)]:
                izq = 3
                dch = 3
                if i < izq:
                    izq = i
                if i >= len(body) - dch:
                    dch = len(body) - i -1
                stringRes += ' '.join(body[i-izq:i+dch+1]) + ' [...] '
        return stringRes



    def rank_result(self, result, query):
        """
        NECESARIO PARA LA AMPLIACION DE RANKING

        Ordena los resultados de una query.

        param:  "result": lista de resultados sin ordenar
                "query": query, puede ser la query original, la query procesada o una lista de terminos


        return: la lista de resultados ordenada

        """

        pass
