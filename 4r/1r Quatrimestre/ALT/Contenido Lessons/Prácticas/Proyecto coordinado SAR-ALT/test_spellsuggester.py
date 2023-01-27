from distancias import *
from spellsuggester import SpellSuggester
import os

carpeta = 'resultados'

def testear_suggester():
    bateria_test = [
        "casa",
        "ancho",
        "ecrvantse",
        "uqijoext",
    ]
    spellsuggester = SpellSuggester(
        dist_functions = opcionesSpell,
        vocab = "./corpora/miniquijote.txt")
    for dstname in opcionesSpell.keys():
        print(dstname)
        with open(f'{carpeta}/test_suggester_{dstname}.txt','w',
                  encoding='utf-8') as f:
            for palabra in bateria_test:
                resul = []
                for threshold in range(1, 4+1):
                    newresul = spellsuggester.suggest(palabra, distance=dstname,
                                                   threshold=threshold, flatten=False)
                    assert(all(x == y for x,y in zip(resul,newresul)))
                    resul = newresul
                longitudes = [len(x) for x in resul]
                print(" -",palabra,longitudes,sum(longitudes))
                f.write(f'{palabra} {threshold} {longitudes}\n{resul}\n')
                
if __name__ == "__main__":
    if not os.path.exists(carpeta):
        os.mkdir(carpeta)
    testear_suggester()
