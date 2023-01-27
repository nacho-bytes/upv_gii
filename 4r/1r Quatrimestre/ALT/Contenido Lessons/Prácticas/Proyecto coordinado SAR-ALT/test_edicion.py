from distancias import *

def aplicar_edicion( original, edicion, traza=False ):
    # tipos de operaciones de edicion:
    # ('','a') insercion coste 1
    # ('a','b') acierto o sustitución coste 0/1
    # ('ab','ba') transposición coste 1
    # ('acb','ba') de coste 2
    # ('ab','bca') de coste 2
    validos = {(0,1),(1,0),(1,1),(2,2),(3,2),(2,3)}
    cadena, errores, poscadena = list(original), 0, 0
    for orig,nueva in edicion:
        if (len(orig),len(nueva)) not in validos:
            raise Exception("Operación de edición no soportada:",(orig,nueva))
        if poscadena+len(orig)>len(cadena) or orig != "".join(cadena[poscadena:poscadena+len(orig)]):
            return False,0,0
        if traza:
            print(f" - {str(orig):3} {str(nueva):3} se aplica en ",
                  "".join(cadena[:poscadena]), "|", "".join(cadena[poscadena:]),sep="",end="")
        cadena[poscadena:poscadena+len(orig)] = list(nueva)
        poscadena += len(nueva)
        coste = 0 if orig == nueva else (1 + (max(len(orig),len(nueva))>2))
        errores += coste
        if traza:
            print(" para dar ","".join(cadena[:poscadena]), "|", "".join(cadena[poscadena:]),' coste ',coste,sep="")
    return True,errores,''.join(cadena)

def comprobar_edicion():
    bateria_test = [("ejemplo","campos"),
                    ("algortimac","algoritmica"),
                    ("zapato","patos"),
                    ("camarero","camionero"),
                    ("algoritmo","algortimo"),
                    ("algoritmo","algortximo"),
                    ("algoritmo","lagortimo"),
                    ("algoritmo","agaloritom"),
                    ("algoritmo","algormio"),
                    ("acb","ba")]

    for nombre,funcion in opcionesEdicion.items():
        print("Probando funcion",nombre)
        print("-"*70)
        for original, nueva in bateria_test:
            distancia, secuencia = funcion(original, nueva)
            print(f"\nComprobando si {nombre}({original},{nueva}) == {distancia}\noperaciones: {secuencia}")
            ok, dprima, reconstruida = aplicar_edicion(original, secuencia,True)
            if distancia == dprima and nueva == reconstruida:
                print(f"CORRECTO!")
            else:
                print(f"INCORRECTO!")
        print()
                
if __name__ == "__main__":
    comprobar_edicion()

