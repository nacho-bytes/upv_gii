/**
 * Classe AutoAvaluacioT1: mètodes recursius numèrics, 
 * amb arrays i amb Strings.
 * 
 * @author (ESCRIU ACI Cognoms i nom del/s autor/s) 
 * @version Tema 1 - Sessio 6
 */
public class AutoAvaluacioT1 {
    private AutoAvaluacioT1() { }
    
    /** Torna una String amb la seqüència 1 2 ... m-1 m , 
     *  acabada per un caràcter de canvi de línia.
     *  Precondició: m > 0.
     */
    public static String sequencia(int m) {
        String res = "1 "; 
        for (int i = 2; i <= m; i++) { res += i + " "; }
        return res + "\n"; 
    }    
    
    /** Torna una String de n línies amb seqüències decreixents,
     *  formant un triangle.
     *  Precondicio: -- COMPLETAR --
     */
    public static String trgSuperior(int n) {
        /* COMPLETAR */
        return "";
    }
    
    /** Torna una String de n línies amb seqüències creixents,
     *  formant un triangle.
     *  Precondició: -- COMPLETAR --
     */
    public static String trgInferior(int n) {
        /* COMPLETAR */
        return "";
    }
    
    /** Calcula a[0] + a[1]*x + ... + a[i]*x^i.
     *  Precondició: -- COMPLETAR --  
     */
    /* COMPLETAR - metode privat recursiu */
    
    /** Calcula a[0] + a[1]*x + ... + a[a.length-1]*x^(a.length-1).
     *  Precondició: -- COMPLETAR --
     */
    /* COMPLETAR - metode public guia que crida a l'anterior */
    
    /** Determina si a i b són simètriques.
     *  Precondició: -- COMPLETAR --
     */
    public static boolean simetriques(String a, String b) {
        /* COMPLETAR */
        return true;
    }    
}