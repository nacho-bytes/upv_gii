package pract3;

import java.util.Locale;
/** Classe MeasuringSortingAlgorithms: Estudi empiric de costs 
 *  dels metodes d'ordenacio.
 *  @author PRG - ETSInf
 *  @version Curs 2019-2020
 */
public class MeasuringSortingAlgorithms {
    // Constants que defineixen els parametres de mesura
    public static final int MAXTALLA = 10000, INITALLA = 1000; 
    public static final int INCRTALLA = 1000;
    public static final int REPETICIONSQ = 200, REPETICIONSL = 20000;
    public static final double NMS = 1e3;  // relacio micro - nanosegons   
    
    /** No hi ha objectes d'aquesta classe. */
    private MeasuringSortingAlgorithms() { }
    
    /** Crea un array d'int de talla t amb valors a 0.
     *  @param t int, la talla.
     *  @result int[], l'array generat.
     */
    private static int[] createArray(int t) { 
        int[] a = new int[t];
        return a;
    }
  
    /** Omple els elements d'un array a d'int amb
     *  valors aleatoris entre 0 i a.length-1.
     *  @param a int[], l'array.
     */
    private static void fillArrayRandom(int[] a) {
        // COMPLETAR
    }
    
    /** Omple els elements d'un array a de forma creixent,
     *  amb valors des de 0 fins a.length-1.
     *  @param a int[], l'array.
     */
    private static void fillArraySortedInAscendingOrder(int[] a) { 
        // COMPLETAR
    }

    /** Omple els elements d'un array a de forma decreixent,
     *  amb valors des de a.length-1 fins 0.
     *  @param a int[], l'array.
     */
    private static void fillArraySortedInDescendingOrder(int[] a) { 
        // COMPLETAR
    }

    public static void measuringSelectionSort() { 
        long ti = 0, tf = 0, tt = 0; // Temps inicial, final i total 
        // Imprimir capçalera de resultats
        System.out.println("# Seleccio. Temps en microsegons");
        System.out.print("# Talla    Promedi \n");
        System.out.print("#------------------\n");
        
        // COMPLETAR
    }

    public static void measuringInsertionSort() { 
        long ti = 0, tf = 0, tt = 0; // Temps inicial, final i total        
        // Imprimir capçalera de resultats
        System.out.println("# Insercio. Temps en microsegons");
        System.out.print("# Talla   Millor     Pitjor     Promedi \n");
        System.out.print("#---------------------------------------\n");
        
        // COMPLETAR
    }
  
    public static void measuringMergeSort() {        
        long ti = 0, tf = 0, tt = 0; // Temps inicial, final i total        
        // Imprimir capçalera de resultats
        System.out.println("# Mergesort. Temps en microsegons");
        System.out.print("# Talla     Promedi \n");
        System.out.print("#-------------------\n");
        
        // COMPLETAR
    }

    public static void help() {
        String msg = "Us: java MeasurigSortingAlgorithms num_algorisme";
        System.out.println(msg);
        System.out.println("   on num_algorisme es:");
        System.out.println("   1 -> Insercio");
        System.out.println("   2 -> Seleccio");
        System.out.println("   3 -> MergeSort");
    }

    public static void main(String[] args) {        
        if (args.length != 1) { help(); }
        else {
            try {
                int a = Integer.parseInt(args[0]);
                switch (a) {
                    case 1: 
                        measuringInsertionSort();
                        break;
                    case 2: 
                        measuringSelectionSort();
                        break;
                    case 3: 
                        measuringMergeSort();
                        break;
                    default: 
                        help();
                }
            } catch (Exception e) {
                help(); 
            }
        }
    }
}
