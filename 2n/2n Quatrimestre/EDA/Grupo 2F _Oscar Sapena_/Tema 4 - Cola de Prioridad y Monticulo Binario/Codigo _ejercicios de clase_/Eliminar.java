// Programa de prueba para el metodo eliminar de la clase MonticuloBinario
public class Eliminar
{
    public static void main() {
        Integer v[] = {5, 8, 2, 10, 9, 6, 12, 15, 19, 11, 1, 3};
        MonticuloBinario<Integer> heap = new MonticuloBinario<Integer>();
        for (Integer n: v) heap.insertar(n);
        boolean eliminado = heap.eliminar(15);
        if (eliminado) {
            System.out.println("Eliminado con exito");
            while (!heap.esVacia()) System.out.println(heap.eliminarMin());
        } else System.out.println("No encontrado");
    }
}
