from distancias import *

test = [
    ("camarero","caramelos"),
    ("ejemplo","campos"),
    ("algoritmo","algortimo"),
    ("algoritmo","algortximo"),
    ("algoritmo","lagortimo"),
    ("algoritmo","agaloritom"),
    ("algoritmo","algormio"),
    ("acb","ba")]

lon_primera = max(len(x) for x,y in test)
lon_segunda = max(len(y) for x,y in test)

lontotal = lon_primera+1+lon_segunda+sum(1+len(name) for name in opcionesSpell.keys())

for cota in [100,3,2,1]:

    print("-"*lontotal)
    cadenacota = f"(Cota {cota})"
    
    print(f"{cadenacota:{2+lon_primera+lon_segunda}}",end="")
    for name in opcionesSpell.keys():
        print(name,end=" ")
    print()

    for x,y in test:
        print(f"{x:{lon_primera}} {y:{lon_segunda}}",end="")
        for name,function in opcionesSpell.items():
            print(f" {function(x,y,cota):{len(name)}}",end="")
        print()
                 
"""
Salida del programa:

--------------------------------------------------------------------------------------------------------------------
(Cota 100)           levenshtein_m levenshtein_r levenshtein levenshtein_o damerau_rm damerau_r damerau_im damerau_i 
camarero  caramelos              4             4           4             4          4         4          4         4
ejemplo   campos                 5             5           5             5          5         5          5         5
algoritmo algortimo              2             2           2             2          1         1          1         1
algoritmo algortximo             3             3           3             3          3         3          2         2
algoritmo lagortimo              4             4           4             4          2         2          2         2
algoritmo agaloritom             5             5           5             5          4         4          3         3
algoritmo algormio               3             3           3             3          3         3          2         2
acb       ba                     3             3           3             3          3         3          2         2
--------------------------------------------------------------------------------------------------------------------
(Cota 3)             levenshtein_m levenshtein_r levenshtein levenshtein_o damerau_rm damerau_r damerau_im damerau_i 
camarero  caramelos              4             4           4             4          4         4          4         4
ejemplo   campos                 5             5           4             4          5         4          5         4
algoritmo algortimo              2             2           2             2          1         1          1         1
algoritmo algortximo             3             3           3             3          3         3          2         2
algoritmo lagortimo              4             4           4             4          2         2          2         2
algoritmo agaloritom             5             5           4             4          4         4          3         3
algoritmo algormio               3             3           3             3          3         3          2         2
acb       ba                     3             3           3             3          3         3          2         2
--------------------------------------------------------------------------------------------------------------------
(Cota 2)             levenshtein_m levenshtein_r levenshtein levenshtein_o damerau_rm damerau_r damerau_im damerau_i 
camarero  caramelos              4             4           3             3          4         3          4         3
ejemplo   campos                 5             5           3             3          5         3          5         3
algoritmo algortimo              2             2           2             2          1         1          1         1
algoritmo algortximo             3             3           3             3          3         3          2         2
algoritmo lagortimo              4             4           3             3          2         2          2         2
algoritmo agaloritom             5             5           3             3          4         3          3         3
algoritmo algormio               3             3           3             3          3         3          2         2
acb       ba                     3             3           3             3          3         3          2         2
--------------------------------------------------------------------------------------------------------------------
(Cota 1)             levenshtein_m levenshtein_r levenshtein levenshtein_o damerau_rm damerau_r damerau_im damerau_i 
camarero  caramelos              4             4           2             2          4         2          4         2
ejemplo   campos                 5             5           2             2          5         2          5         2
algoritmo algortimo              2             2           2             2          1         1          1         1
algoritmo algortximo             3             3           2             2          3         2          2         2
algoritmo lagortimo              4             4           2             2          2         2          2         2
algoritmo agaloritom             5             5           2             2          4         2          3         2
algoritmo algormio               3             3           2             2          3         2          2         2
acb       ba                     3             3           2             2          3         2          2         2

"""         
