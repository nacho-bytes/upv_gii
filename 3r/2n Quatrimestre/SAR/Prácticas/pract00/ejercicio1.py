import string 

def es_pangrama (s:str) :
    pangrama = set(s.lower().replace(" ", "")) #Habria que quitar las comas y eso 
    alphabet = set(string.ascii_lowercase)
    return pangrama.intersection(alphabet) == alphabet

print(es_pangrama("The quick brown fox jumps over the lazy dog"))
print(es_pangrama("Hello this is me"))
print(es_pangrama("Pack my box with five dozen liquor jugs"))