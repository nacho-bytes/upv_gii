package pract6;

/**
 * Clase IIPMath: clase de utilidades que implementa algunas operaciones 
 * matematicas: IIPMath.sqrt(double) y IIPMath.log(double).
 *
 * @author IIP
 * @version Curso 2019-2019
 */
public class IIPMath {
    /** Valor aproximado de log(2). */
    /* COMPLETAR */
    
    /** No se pueden crear objetos de esta clase. */
    private IIPMath() { }    
    
    /**
     * Devuelve la raíz cuadrada de x >= 0, con error epsilon > 0. 
     * // COMPLETAR COMENTARIOS 
     */
    public static double sqrt(double x, double epsilon) {
        /* COMPLETAR */
    }            

    /**
     * Devuelve la raíz cuadrada de x >= 0, con error 1e-15. 
     * // COMPLETAR COMENTARIOS 
     */
    public static double sqrt(double x) {    
        /* COMPLETAR */
    }               
                   
    /**
     * Devuelve log(z), 1/2 <= z < 1, con error epsilon > 0.
     * // COMPLETAR COMENTARIOS
     */
    public static double logBase(double z, double epsilon) {
        /* COMPLETAR */
    }
            
    /**
     * Devuelve log(x), x > 0, con error epsilon > 0.
     * // COMPLETAR COMENTARIOS
     */
    public static double log(double x, double epsilon) {      
        /* COMPLETAR */
    }

    /**
     * Devuelve log(x), x > 0, con error 1e-15.
     * // COMPLETAR COMENTARIOS
     */
    public static double log(double x) {    
        /* COMPLETAR */
    }
}
