import json
import os
import re

##################################################
##                                              ##
##    LIBRERIA DE INDEXACION DE NOTICIAS        ##
##                                              ##
##              NO OPTIMIZADO !!                ##
## NO se puede utilizar PARA el proyecto de SAR ##
##                                              ##
##################################################

class SAR_Project:
    """
    Prototipo MINIMO del proyecto de SAR para ser utilizado en ALT
    """

    # numero maximo de documento a mostrar cuando self.show_all es False
    SHOW_MAX = 10


    def __init__(self, **args):
        """
        Constructor de la classe SAR_Indexer.

        Incluye todas las variables necesaria para todas las ampliaciones.
        Puedes añadir más variables si las necesitas 

        arfs permite acceder a los argumento de SAR_Indexer

        args['distance']
        args['threshold']

        """
        self.index = {} # hash para el indice invertido de terminos --> clave: termino, valor: posting list.
        self.docs = {} # diccionario de terminos --> clave: entero(docid),  valor: ruta del fichero.
        self.news = {} # hash de noticias --> clave entero (newid), valor: la info necesaria para diferencia la noticia dentro de su fichero
        self.tokenizer = re.compile("\W+") # expresion regular para hacer la tokenizacion
        self.show_all = False # valor por defecto, se cambia con self.set_showall
        self.show_snippet = False # valor por defecto, se cambia con self.set_snippet


    ###############################
    ###                         ###
    ###      CONFIGURACION      ###
    ###                         ###
    ###############################


    def set_showall(self, v):
        """

        Cambia el modo de mostrar los resultados.
        
        input: "v" booleano.

        si self.show_all es True se mostraran todos los resultados el lugar de un maximo de self.SHOW_MAX, no aplicable a la opcion -C

        """
        self.show_all = v


    def set_snippet(self, v):
        """

        Cambia el modo de mostrar snippet.
        
        input: "v" booleano.

        si self.show_snippet es True se mostrara un snippet de cada noticia, no aplicable a la opcion -C

        """
        self.show_snippet = v


    def set_stemming(self, v):
        """
        Sirve para activar una funcionalidad que no hay que implementar.

        Este método no hace nada, ignora los parámetros.
        """
        pass
    
    def set_ranking(self, v):
        """
        Sirve para activar una funcionalidad que no hay que implementar.

        Este método no hace nada, ignora los parámetros.
        """
        pass

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

        for dir, subdirs, files in os.walk(root):
            for filename in files:
                if filename.endswith('.json'):
                    fullname = os.path.join(dir, filename)
                    self.index_file(fullname)

        

    def index_file(self, filename):
        """
        NECESARIO PARA TODAS LAS VERSIONES

        Indexa el contenido de un fichero.

        Para tokenizar la noticia se debe llamar a "self.tokenize"

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
        # En la version basica solo se indexa el contenido "article"

        docid = len(self.docs)
        self.docs[docid] = filename
        for i, j in enumerate(jlist):
            newid = len(self.news)
            self.news[newid] = (docid, i)
            tks = self.tokenize(j['article'])
            self.add_news_tokens(self.index, tks, newid)


    def add_news_tokens(self, index, token_list, newid):
        for token in set(token_list):
            if token not in index:
                index[token] = [newid]
            elif index[token][-1] != newid:
                index[token].append(newid)


    def tokenize(self, text):
        """
        Tokeniza la cadena "texto" eliminando simbolos no alfanumericos y dividientola por espacios.
        Puedes utilizar la expresion regular 'self.tokenizer'.

        params: 'text': texto a tokenizar

        return: lista de tokens

        """
        return self.tokenizer.sub(' ', text.lower()).split()




    def show_stats(self):
        """
        Muestra estadisticas de los indices
        
        """
        print("=" * 40)
        print("Number of indexed days:", len(self.docs))
        print("-" * 40)
        print("Number of indexed news:", len(self.news))
        print("-" * 40)
        print('TOKENS:')
        print("\t# of tokens in 'article': %d" % (len(self.index)))
        print("=" * 40)



    ###################################
    ###                             ###
    ###   PARTE 2.1: RECUPERACION   ###
    ###                             ###
    ###################################


    def solve_query(self, query, prev={}):
        """
        Resuelve una query.
        Debe realizar el parsing de consulta que sera mas o menos complicado en funcion de la ampliacion que se implementen

        param:  "query": cadena con la query
                "prev": incluido por si se quiere hacer una version recursiva. No es necesario utilizarlo.

        return: posting list con el resultado de la query

        """
        if query is None or len(query) == 0:
            return []
        spt = query.split()
        i = 0
        if spt[i].lower() == 'not':
            neg = True
            i += 1
        else:
            neg = False
        # posting list 1
        term = spt[i]
        posting = self.get_posting(term)
        l1 = (neg, posting)
        i += 1
        while i < len(spt):
            conn = spt[i].lower()
            i += 1
            neg = False
            if spt[i].lower() == 'not':
                neg = True
                i += 1
            term = spt[i]
            posting = self.get_posting(term)
            l2 = (neg, posting)
            l1 = self.solve_conn(conn, l1, l2)
            i += 1
        if l1[0] is False:
            post = l1[1]
        else:
            post = self.reverse_posting(l1[1])
        return post

    def get_posting(self, term):
        """
        Devuelve la posting list asociada a un termino. 

        param:  "term": termino del que se debe recuperar la posting list.

        return: posting list

        """
        term = term.lower()
        r1 = self.index.get(term, [])
        return r1

    def solve_conn(self, conn, l1, l2):
        """

        """
        
        pl1 = l1[1] if l1[0] is False else self.reverse_posting(l1[1])
        pl2 = l2[1] if l2[0] is False else self.reverse_posting(l2[1])

        if conn == 'and':
            # AND
            r = self.and_posting(pl1, pl2)
        elif conn == 'or':
            # OR
            r = self.or_posting(pl1, pl2)
        return False, r

    def reverse_posting(self, p):
        """
        Devuelve una posting list con todas las noticias excepto las contenidas en p.
        Util para resolver las queries con NOT.


        param:  "p": posting list


        return: posting list con todos los newid exceptos los contenidos en p

        """

        return [nid for nid in range(0, len(self.news)) if nid not in p]

    def and_posting(self, p1, p2):
        """
        Calcula el AND de dos posting list de forma NO EFICIENTE

        param:  "p1", "p2": posting lists sobre las que calcular

        return: posting list con los newid incluidos en p1 y p2

        """
        
        return sorted(set(p1).intersection(p2))

    def or_posting(self, p1, p2):
        """
        Calcula el OR de dos posting list de forma NO EFICIENTE

        param:  "p1", "p2": posting lists sobre las que calcular

        return: posting list con los newid incluidos de p1 o p2

        """

        return sorted(set(p1).union(p2))



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
        result = self.solve_query(query)
        print("%s\t%d" % (query, len(result)))
        return len(result)  # para verificar los resultados (op: -T)

    def solve_and_show(self, query):
        """
        NECESARIO PARA TODAS LAS VERSIONES

        Resuelve una consulta y la muestra informacion de las noticias recuperadas.
        Consideraciones:

        - En funcion del valor de "self.show_snippet" se mostrara una informacion u otra.

        param:  "query": query que se debe resolver.

        return: el numero de noticias recuperadas, para la opcion -T
        
        """
        result = self.solve_query(query)
        #self.show_result(result, query)
        print('=' * 40)
        print("Query: '%s'" % query)
        print('Number of results:', len(result))
        max = len(result) if self.show_all else self.SHOW_MAX
        for i, newid in enumerate(result[:max]):
            score = 0
            docid, newpos = self.news[newid]
            path = self.docs[docid]
            with open(path) as fh:
                obj = json.load(fh)[newpos]
            if self.show_snippet:
                if i > 0:
                    print('-'*20)
                print("#%d" % (i+1))
                print("Score:", score)
                print(newid)
                print("Date:", obj['date'])
                print("Title:", obj['title'])
                print("Keywords:", obj['keywords'])
                print(self.snippet(obj['article'], query))
            else:
                print("#%d\t(%s) (%d) (%s) %s\t(%s)" %
                      ((i+1), str(score), newid, obj['date'], obj['title'], obj['keywords']))
        print('=' * 40)

    def get_terms(self, query):
        # una forma muy cutre de obtener los terminos de una consulta
        if query is None or len(query) == 0:
            return {}
        d = {}
        not_valid = ['and', 'or', 'not'] + list(self.index.keys())
        query = query.lower().replace('(', ' ').replace(')',' ').replace(':', ' ').replace('"', ' ').split()
        for term in query:
            if term not in not_valid:
                d[term] = d.get(term, 0) + 1
        return d


    def snippet(self, raw, query=None):
        terms = sorted(self.get_terms(query).keys())
        if terms is None:
            return raw[:100] + '...'
        text = self.tokenize(raw)
        ids = [i for i, t in enumerate(text) if t in terms]
        if len(ids) == 0:
            return raw[:100] + '...'
        if len(ids) == 1:
            return '... ' + ' '.join(text[max(0, ids[0] - 10):min(len(text) - 1, ids[0] + 10)]) + ' ...'
        id1 = max(0, ids[0] - 3)
        id2 = min(len(text) - 1, ids[-1] + 3)
        return ' '.join(text[id1:id1 + 10] + ['...'] + text[id2 - 10:id2] + ['...'])

