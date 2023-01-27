// Ejercicio: diseñar un metodo que devuelva el sucesor de un elemento x dado
// en una Cola de Prioridad (o null si x no tiene sucesor, es decir, x es el 
// elemento máximo de la Cola de Prioridad)
public class Sucesor
{
	// Programa de prueba
    public static void main() {
        ColaPrioridad<Integer> cp = new MonticuloBinario<Integer>();
        Integer v[] = {5, 8, 2, 10, 9, 6, 12, 15, 19, 11, 1, 3};
        for (Integer n: v) cp.insertar(n);
        System.out.println(sucesor(cp, 8));
    }
    
	// Método para el calculo del sucesor en una Cola de Prioridad
    public static <E extends Comparable<E>> E sucesor(ColaPrioridad<E> cp, E x) {
        if (cp.esVacia()) return null;
        E aux = cp.recuperarMin();
        if (aux.compareTo(x) > 0) { // aux es el sucesor
            return aux;
        } else { // aux es menor o igual que x (no es el sucesor)
            cp.eliminarMin();
            E suc = sucesor(cp, x);
            cp.insertar(aux);
            return suc;
        }
    }
}
