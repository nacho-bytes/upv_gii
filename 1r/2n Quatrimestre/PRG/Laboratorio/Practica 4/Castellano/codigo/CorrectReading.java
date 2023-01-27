package pract4.utilPRG;

import java.util.InputMismatchException;
import java.util.Locale;
import java.util.Scanner;
/**
 * Clase CorrectReading: clase de utilidades que permite realizar la lectura 
 * validada de datos de tipos primitivos desde la entrada estandar.
 * 
 * @author (PRG. ETSINF - UPV)
 * @version  (2019/20)
 */
public class CorrectReading {
    
    /** No hay objetos de esta clase. */ 
    private CorrectReading() { }
    
    // ACTIVIDAD 2:
    /**
     * Lee un valor desde un objeto de tipo Scanner y devuelve el primer entero leido.
     * <br><br> 
     * Si el valor leido no es un entero, muestra en pantalla el mensaje: 
     * "Por favor, introduzca un numero entero correcto! ... " 
     * <br><br>    
     * La lectura se repite hasta que el token leido sea correcto y devuelve el 
     * primero que sea entero.
     *
     * @param sc Scanner desde el que se lee.
     * @param msg String con la pregunta que se muestra al usuario.
     * @return int, valor entero.
     */
    public static int nextInt(Scanner sc, String msg) {
        int value = 0;
        boolean someError = true; 
        do {
            try {
                System.out.print(msg);
                value = sc.nextInt();
                someError = false;
            } catch (InputMismatchException e) {
                System.out.println("Por favor, introduzca un numero entero correcto! ... ");
            } finally {
                sc.nextLine();
            }
        } while (someError);
        return value;
    }	
    
    /**
     * Lee un valor desde un objeto de tipo Scanner y devuelve el primer real leido.
     * <br><br> 
     * Si el valor leido no es un real, muestra en pantalla el mensaje: 
     * "Por favor, introduzca un numero real correcto! ... " 
     * <br><br>    
     * La lectura se repite hasta que el token leido sea correcto y devuelve el 
     * primero que sea real.
     *
     * @param sc Scanner desde el que se lee.
     * @param msg String con la pregunta que se muestra al usuario.
     * @return double, valor real.
     */
    public static double nextDouble(Scanner sc, String msg) {
        double value = 0;
        boolean someError = true; 
        do {
            try {
                System.out.print(msg);
                value = sc.nextDouble();
                someError = false;
            } catch (InputMismatchException e) {
                System.out.println("Por favor, introduzca un numero real correcto! ... ");
            } finally {
                sc.nextLine();
            }
        } while (someError);
        return value;
    }	
	
    // ACTIVIDAD 3:
    /**
     * Lee un valor desde un objeto de tipo Scanner y devuelve el primer numero real 
     * no negativo leido.
     * <br><br>
     * Si el valor leido es un número real negativo, muestra en pantalla el mensaje: 
     * "Por favor, introduzca un valor correcto! ... " 
     * <br><br>   
     * Si el valor no es un real, muestra en pantalla el mensaje: 
     * "Por favor, introduzca un numero real correcto! ... " 
     * <br><br> 
     * La lectura se repite hasta hasta que sea correcto, devolviendo el primero 
     * que sea >= 0.0.
     * 	 
     * @param sc Scanner desde el que se lee.
     * @param msg String con la pregunta que se muestra al usuario.
     * @return double, valor double no negativo.
     */ 
    public static double nextDoublePositive(Scanner sc, String msg) {
        double value = 0.0;
        boolean someError = true; 
        do {
	    // COMPLETAR
            System.out.print(msg);
            value = sc.nextDouble();    
	    if (value < 0.0) {
		System.out.println("Por favor, introduzca un valor correcto! ... ");
            } 
            else { someError = false; }
	    // COMPLETAR
	    sc.nextLine();			
	    // COMPLETAR
        } while (someError);		
        return value;
    }
    
    // ACTIVIDAD 4:
    /**
     * Lee un valor desde un objeto de tipo Scanner y devuelve el primero que sea de tipo entero
     * y en el rango delimitado por <code>[lowerBound .. upperBound]</code> donde 
     * <code>Integer.MIN_VALUE <= lowerBound</code> y <code>upperBound <= Integer.MAX_VALUE</code>.
     * <br><br>
     * - Si el entero leido esta fuera de rango, lanza una excepcion de tipo 
     *  <code>IllegalArgumentException</code> con el mensaje: 
     *  "v no está en el rango [lowerBound .. upperBound]" 
     * donde v es el valor leido, y lowerBoud, upperBound son los parametros.
     * <br><br>
     *  
     * A continuacion, captura dicha excepcion y muestra por pantalla el mensaje de la excepcion
     * junto con el texto: 
     * ". Por favor, introduzca un valor correcto! ... " 
     * <br><br>
     * 
     * - Si el valor no fuera un entero, muestra por pantalla el mensaje: 
     *  "Por favor, introduzca un numero entero correcto! ... " 
     * <br><br> 
     * La lectura se repite hasta que el token leido sea correcto y devuelve el primero 
     * que sea un entero valido.
     *	 
     * @param sc Scanner desde el que se lee.
     * @param msg String con la pregunta que se muestra al usuario.
     * @param lowerBound int, límite inferior.
     * @param upperBound int, límite superior.
     * @return int, valor entero dentro de los límites.
     */   
    public static int nextInt(Scanner sc, String msg, int lowerBound, int upperBound) {
        int value = 0;  
	// COMPLETAR
        System.out.print(msg);
        value = sc.nextInt(); 
	// COMPLETAR
        sc.nextLine();
	// COMPLETAR
        return value;
    }  
}
