from ejercicio5 import char_freq

def es_anagrama(s1:str, s2:str):
    return char_freq(s1) == char_freq(s2)

print(es_anagrama("Life on mars", "alien forms"))
print(es_anagrama("hola", "oalh"))
print(es_anagrama("hola", "awsh"))