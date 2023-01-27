# AUTORES:
# (poner aquí el nombre o 2 nombres del equipo de prácticas

def exact_cover(listaConjuntos):
    U = set().union(*listaConjuntos) # para saber qué universo tenemos
    N = len(listaConjuntos)
    solucion = []
    def backtracking(longSol, cjtAcumulado):
        # COMPLETAR
        # consulta los métodos isdisjoint y union de la clase set,
        # podrías necesitarlos
    yield from backtracking(0, set())

if __name__ == "__main__":
    cjtdcjts = [{"casa","coche","gato"},
                {"casa","bici"},
                {"bici","perro"},
                {"boli","gato"},
                {"coche","gato","bici"},
                {"casa", "moto"},
                {"perro", "boli"},
                {"coche","moto"},
                {"casa"}]
    for solucion in exact_cover(cjtdcjts):
        print(solucion)
