import string

def es_pangrama_perfecto (s:str) :
    s = s.lower().replace(" ", "")
    pangrama = set(s)
    alphabet = set(string.ascii_lowercase)
    return pangrama.intersection(alphabet) == alphabet and len(s) == len(alphabet)

print(es_pangrama_perfecto("The quick brown fox jumps over the lazy dog"))
print(es_pangrama_perfecto("Hello this is me"))
print(es_pangrama_perfecto("Pack my box with five dozen liquor jugs"))
print(es_pangrama_perfecto("Jock nymphs waqf drug vex blitz"))
print(es_pangrama_perfecto("abcdefghijklmnopqrstuvwxyz"))
print(es_pangrama_perfecto("T quick bown fx jmps ver the lazy dg"))