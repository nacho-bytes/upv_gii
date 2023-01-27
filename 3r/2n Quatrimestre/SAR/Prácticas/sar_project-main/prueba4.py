query = '(title:pollo and (title:blanco or "el pie") or not queso)'

def query_words(query):
    """
    Extrae los terminos de la query en una lista y la devuelve

    param:  "query": consulta original

    return: la lista de terminos de la consulta

    """
    query = query.lower()
    body = self.tokenize(body)
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
                if element == body[i]
                    listaindices.append(i)
                    break
    listaindices.sort()
    stringRes = ''
    for i in listaindices[:len(listaindices)-1]:
        izq = 3
        dch = 3
        if i < izq:
            izq = i
        if i >= len(body) - dch:
            dch = len(body) - i -1
        stringRes += str(body[i-izq:i+dch+1]) + ' [...] '
    
    izq = 3
    dch = 3
    if i < izq:
        izq = i
    if i >= len(body) - dch:
        dch = len(body) - i -1
    stringRes += str(body[i-izq:i+dch+1])

    
query_words(query)