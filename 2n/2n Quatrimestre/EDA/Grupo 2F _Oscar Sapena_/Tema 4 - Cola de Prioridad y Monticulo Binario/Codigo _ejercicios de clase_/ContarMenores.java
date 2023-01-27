// Programa de prueba para el metodo contarMenores de la clase MonticuloBinario
public class ContarMenores
{
    public static void main() {
        Integer v[] = {5, 8, 2, 10, 9, 6, 12, 15, 19, 11, 1, 3};
        MonticuloBinario<Integer> heap = new MonticuloBinario<Integer>();
        for (Integer n: v) heap.insertar(n);
        System.out.println("Menores que 10: " + heap.contarMenores(10));
    }
}
