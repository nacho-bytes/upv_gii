package pract6;

/**
 * Classe IIPMath: classe d'utilitats que implementa algunes operacions 
 * matematiques: IIPMath.sqrt(double) i IIPMath.log(double).
 *
 * @author IIP
 * @version Curs 2019-2020
 */
public class IIPMath {
    /** Valor aproximat de log(2). */
    /* COMPLETAR */
    
    /** No es poden crear objectes d'aquesta classe. */
    private IIPMath() { }    
    
    /**
     * Torna l'arrel quadrada de x >= 0, amb error epsilon > 0. 
     * // COMPLETAR COMENTARIS 
     */
    public static double sqrt(double x, double epsilon) {
        /* COMPLETAR */
    }            

    /**
     * Torna l'arrel quadrada de x >= 0, amb error 1e-15. 
     * // COMPLETAR COMENTARIS 
     */
    public static double sqrt(double x) {    
        /* COMPLETAR */
    }  
                    
    /**
     * Torna log(z), 1/2 <= z < 1, amb error epsilon > 0.
     * // COMPLETAR COMENTARIS
     */
    public static double logBase(double z, double epsilon) {
        /* COMPLETAR */
    }
            
    /**
     * Torna log(x), x > 0, amb error epsilon > 0.
     * // COMPLETAR COMENTARIS
     */
    public static double log(double x, double epsilon) {      
        /* COMPLETAR */
    }

    /**
     * Torna log(x), x > 0, amb error 1e-15.
     * // COMPLETAR COMENTARIS
     */
    public static double log(double x) {    
        /* COMPLETAR */
    }
                     
}
