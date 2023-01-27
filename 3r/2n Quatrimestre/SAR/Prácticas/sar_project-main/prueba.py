import regex
# query = 'alpargata blanca (coche and ("oh yes" or casa)) and casa or rojo blanco "al caso" or "caso a"'
query = '(title:pollo and (blanco pie) or not queso) article:alpargata not blanca not (coche and ("oh yes" or casa)) and casa or rojo blanco article:"al caso" or date:"caso a"'
parentesis = r'''(?<rec>\((?:[^()]++|(?&rec))*\))'''
comillas = r'''(?<rec>"(?:[^""]++)*")'''
queryPar = regex.split(parentesis,query,flags=regex.VERBOSE) # Separar elementos con parentesis
querySep = [] # Lista donde guardaremos las palabras entre comillas como un solo item
for item in queryPar:
    if '(' in item: # si hay parentesis en el elemto, lo guardamos igual
        querySep.append(item)
    elif '\"' in item: # si hay comillas, 
        aux = regex.split(comillas,item,flags=regex.VERBOSE)
        for element in aux:
            if '\"' in element:
                querySep.append(element)
            else:
                querySep += element.split()
    else:
        querySep += item.split()

if '' in querySep: querySep.remove('')

queryFinal = []
needAnd = False # Booleano para saber si hace falta un and
for ind, word in enumerate(querySep):
    word = word.strip()
    if word in ['title:', 'date:', 'keywords:', 'article:', 'summary:'] and querySep[ind+1].startswith('\"'):
        querySep[ind+1] = word + querySep[ind+1]
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

print(queryFinal)