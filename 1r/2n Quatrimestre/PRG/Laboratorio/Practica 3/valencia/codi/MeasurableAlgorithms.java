package pract3;

/** Classe MeasurableAlgorithms: classe d'utilitats amb els metodes a analitzar.
 *  @author PRG - ETSInf
 *  @version Curs 2019-2020
 */
public class MeasurableAlgorithms {
    /** No hi ha objectes d'aquesta classe. */
    private MeasurableAlgorithms() { }

    /** Cerca lineal
     *  @param a int[], array d'enters
     *  @param e int, element a buscar
     *  @return int, posicio d'e en a o -1 si e no esta en a
     */
    public static int linearSearch(int[] a, int e) {
        int i = 0;
        while (i < a.length && (a[i] != e)) { i++; }
        if (i < a.length) { return i; }
        else { return -1; }
    }
  
    /** Metode d'ordenacio per seleccio directa
     *  @param a int[], array d'enters
     */
    public static void selectionSort(int[] a) {
        int posMin, temp;
        for (int i = 0; i < a.length - 1; i++) {
            posMin = i;
            for (int j = i + 1; j < a.length; j++) {
                if (a[j] < a[posMin]) { posMin = j; }
            }
            temp = a[posMin];
            a[posMin] = a[i];
            a[i] = temp;
        }
    }
  
    /** Metode d'ordenacio per insercio directa
     *  @param a int[], array d'enters
     */
    public static void insertionSort(int[] a) {
        int temp;
        for (int i = 1; i < a.length; i++) {
            int j = i - 1;
            temp = a[i];
            while (j >= 0 && a[j] > temp) {
                a[j + 1] = a[j];
                j--;
            }
            a[j + 1] = temp;
        }
    } 
  
    /** Metode d'ordenacio per mescla o mergesort
     *  @param a int[], array d'enters
     *  @param left int, posicio inicial del subarray a ordenar
     *  @param right int, posicio final del subarray a ordenar
     */ 
    public static void mergeSort(int[] a, int left, int right) {
        int half;
        if (left < right) {
            half = (left + right) / 2;
            mergeSort(a, left, half);
            mergeSort(a, half + 1, right);
            naturalMerge(a, left, half, right);
        }
    }

    /** Mescla natural per a mergesort
     *  @param a int[], array d'enters
     *  @param left int, posicio inicial del subarray a ordenar
     *  @param right int, posicio final del subarray a ordenar
     *  @param half int, posicio central del subarray a ordenar
     */ 
    private static void naturalMerge(int[] a, int left, int half, int right) {
        int[] temp = new int[right - left + 1];
        int i = left, j = half + 1, k = 0;
        while (i <= half && j <= right) {            
            if (a[i] < a[j]) { temp[k++] = a[i++]; } 
            else { temp[k++] = a[j++]; }
        }

        while (i <= half) { temp[k++] = a[i++]; }
        while (j <= right) { temp[k++] = a[j++]; }

        for (i = left, k = 0; i <= right; i++) {
            a[i] = temp[k++];
        }
    }
}
