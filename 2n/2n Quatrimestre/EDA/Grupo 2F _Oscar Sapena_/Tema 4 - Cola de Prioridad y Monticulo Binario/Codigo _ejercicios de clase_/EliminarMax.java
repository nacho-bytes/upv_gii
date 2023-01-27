// Programa de prueba para el metodo eliminarMax de la clase MonticuloBinario
public class EliminarMax
{
    public static void main() {
        Integer v[] = {5, 8, 2, 10, 9, 6, 12, 15, 19, 11, 1, 3};
        MonticuloBinario<Integer> heap = new MonticuloBinario<Integer>();
        for (Integer n: v) heap.insertar(n);
        System.out.println("Maximo: " + heap.eliminarMax());
        while (!heap.esVacia()) System.out.println(heap.eliminarMin());
    }
}
