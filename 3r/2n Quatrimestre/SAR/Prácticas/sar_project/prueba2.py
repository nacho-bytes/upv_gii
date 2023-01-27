import sys
import re
#query = '(title:pollo and (blanco pie) or not queso) article:alpargata not blanca not (coche and ("oh yes" or casa)) and casa or rojo blanco article:"al caso" or date:"caso a"'
#query = 'guerra AND keywords:EEUU'.lower()
query = '(title:pollo and (title:blanco pie) or not queso)'
query = '"fin de semana" AND "el país"'
if not isinstance(query, str): print(query); sys.exit(-1)


openPar = [m.start() for m in re.finditer(r'\(',query)]
closePar = [m.start() for m in re.finditer(r'\)',query)]

#
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
print(parenList)
comList = []
for element in parenList:
    if '\"' in element and '(' not in element:
        comi = [m.start() for m in re.finditer(r'\"',element)]
        print(comi)
        if element[:comi[0]] != '': elementList = [element[:comi[0]].strip()]
        else: elementList = []
        for index, c in enumerate(comi):
            if index % 2 == 0:
                elementList.append(element[comi[index]:comi[index + 1] + 1])
            elif index < len(comi) - 1:
                elementList.append(element[comi[index] + 1:comi[index + 1]].strip())

        if len(element) > comi[len(comi) - 1] + 1:
            elementList.append(element[comi[len(comi) - 1] + 1:].strip())
        
        for e in elementList: print(e); comList.append(e)
    else:
        comList.append(element)
# Separar aquellos elementos no dependientes de comillas ni parentesis
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
            queryFinal.append('AND')
            needAnd = False
    elif not needAnd:
        queryFinal.append(word)
        needAnd = True
        if word == 'NOT':
            needAnd = False
    elif needAnd:
        if word in ['OR','AND']:
            queryFinal.append(word)
            needAnd = False
        else:
            queryFinal.append('AND')
            queryFinal.append(word)
            if word == 'NOT':
                needAnd = False

print(queryFinal)
