package pract3;

import java.util.Locale;
/** Classe MeasuringLinearSearch: analisi empirica de 
 *  l'algorisme de cerca lineal.
 *  @author PRG ETSInf
 *  @version Curs 2019-2020
 */
public class MeasuringLinearSearch {
    // Constants que defineixen els parametres de mesura
    public static final int MAXTALLA = 100000, INITALLA = 10000; 
    public static final int INCRTALLA = 10000; 
    public static final int REPETICIONS = 100000, REP_CASMILLOR = 2000000;
    public static final double NMS = 1e3;  // relacio micro - nanosegons

    /** No hi ha objectes d'aquesta classe. */
    private MeasuringLinearSearch() { }
    
    /** Crea un array d'int de talla size, 
     *  amb valors creixents des de 0 fins size-1.
     *  @param size int, la talla.
     *  @result int[], l'array.
     */
    private static int[] createArray(int size) {
        int[] a = new int[size];
        for (int i = 0; i < size; i++) { a[i] = i; }
        return a;
    } 

    public static void measuringLinearSearch() {   
        long ti = 0, tf = 0, tt = 0; // Temps inicial, final i total        
        // Imprimir capçalera de resultats
        System.out.println("# Cerca lineal. Temps en microsegons");
        System.out.print("# Talla      Millor     Pitjor    Promedi\n");
        System.out.print("#----------------------------------------\n");

        // Aquest bucle repeteix el proces per a distintes talles
        for (int t = INITALLA; t <= MAXTALLA; t += INCRTALLA) {
            // Crear l'array
            int[] a = createArray(t);
      
            // Estudi del cas millor: cercar a[0]
            // OJO: Com es molt rapid, 
            // el numero de repeticions es major
            tt = 0;                          // Temps acumulat inicial a 0
            for (int r = 0; r < REP_CASMILLOR; r++) {
                ti = System.nanoTime();      // Temps inicial
                MeasurableAlgorithms.linearSearch(a, a[0]);
                tf = System.nanoTime();      // Temps final
                tt += (tf - ti);             // Actualitzar temps acumulat
            }
            double tMillor = (double) tt / REP_CASMILLOR; // Temps promedi 
                                                          // del cas millor
                                                          
            // Estudi del cas pitjor: cercar un que no estiga, per exemple -1
            tt = 0;                          // Temps acumulat inicial a 0
            for (int r = 0; r < REPETICIONS; r++) {
                ti = System.nanoTime();      // Temps inicial
                MeasurableAlgorithms.linearSearch(a, -1);
                tf = System.nanoTime();      // Temps final
                tt += (tf - ti);             // Actualitzar temps acumulat
            }
            double tPitjor = (double) tt / REPETICIONS;  // Temps promedi 
                                                         // del cas pitjor
      
            // Estudi del cas promedi: cercar un numero aleatori entre 0 i t-1
            tt = 0;                        // Temps acumulat inicial a 0
            for (int r = 0; r < REPETICIONS; r++) {
                int aux = (int) Math.floor(Math.random() * t); // valor a cercar
                ti = System.nanoTime();  // Temps inicial
                MeasurableAlgorithms.linearSearch(a, aux);
                tf = System.nanoTime();  // Temps final
                tt += (tf - ti);         // Actualitzar temps acumulat
            }
            double tPromed = (double) tt / REPETICIONS; // Temps promedi 
                                                        // del cas promedi

            // Imprimir resultats
            System.out.printf(Locale.US, "%8d %10.3f %10.3f %10.3f\n", 
                              t, tMillor / NMS, tPitjor / NMS, tPromed / NMS);
        }
    }

    public static void main(String[] args) {
        measuringLinearSearch();
    }
}
