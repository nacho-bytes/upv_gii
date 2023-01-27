package pract4.utilPRG;

import java.util.InputMismatchException;
import java.util.Locale;
import java.util.Scanner;
/**
 * Classe CorrectReading: classe d'utilitats que permet realitzar la lectura 
 * validada de dades de tipus primitius des de l'entrada estandard.
 * 
 * @author (PRG. ETSINF - UPV)
 * @version  (2019/20)
 */
public class CorrectReading {
    
    /** No hi ha objectes d'aquesta classe. */ 
    private CorrectReading() { }
    
    // ACTIVITAT 2:
    /**
     * Llig un valor des d'un Scanner i retorna el primer valor de 
     * tipus int llegit.
     * <br><br>
     * Si el valor llegit no es un numero enter, mostra per pantalla
     * el missatge: "Per favor, introdueix un numero enter correcte! ..."
     * <br><br> 
     * La lectura es repeteix fins que el token llegit siga correcte, 
     * tornant el primer que siga enter.
     * 
     * @param sc Scanner des d'on es fa la lectura.
     * @param msg String per preguntar a l'usuari sobre el valor.
     * @return int, valor enter.
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
                System.out.println("Per favor, introdueix un numero enter correcte! ...");
            } finally {
                sc.nextLine();
            }
        } while (someError);
        return value;
    }
    
    /**
     * Llig un valor des d'un Scanner i retorna el primer valor de 
     * tipus double llegit.
     * <br><br>
     * Si el valor llegit no es un numero real, mostra per pantalla
     * el missatge: "Per favor, introdueix un numero real correcte! ..."
     * <br><br> 
     * La lectura es repeteix fins que el token llegit siga correcte, 
     * tornant el primer que siga real.
     * 
     * @param sc Scanner des d'on es fa la lectura.
     * @param msg String per preguntar a l'usuari sobre el valor.
     * @return int, valor double.
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
                System.out.println("Per favor, introdueix un numero resl correcte! ...");
            } finally {
                sc.nextLine();
            }
        } while (someError);
        return value;
    }
    
    // ACTIVITAT 3:
    /**
     * Llig un valor des d'un Scanner i retorna el primer valor de 
     * tipus double no negatiu llegit.
     * <br><br>
     * Si el valor llegit es un numero real negatiu, mostra per pantalla
     * el missatge: "Per favor, introdueix un valor correcte! ..."
     * <br><br>
     * Si el valor llegit no es un double, mostra per pantalla: 
     * "Per favor, introdueix un numero real correcte! ..."
     * <br><br>
     * La lectura es repeteix fins que siga correcte, tornant el primer 
     * que siga >= 0.0.
     * 
     * @param sc Scanner des d'on es fa la lectura.
     * @param msg String per preguntar a l'usuari sobre el valor.
     * @return double, valor double no negatiu.
     */    
    public static double nextDoublePositive(Scanner sc, String msg) {
        double value = 0.0;
        boolean someError = true; 
        do {
            // COMPLETAR
            System.out.print(msg);
            value = sc.nextDouble();
            if (value < 0.0) {                
                System.out.println("Per favor, introdueix un valor correcte! ...");
            }
            else { someError = false; }
            // COMPLETAR
            sc.nextLine();
            // COMPLETAR
        } while (someError);        
        return value;
    }

    // ACTIVITAT 4:
    /**
     * Llig un valor des d'un Scanner i retorna el primer valor de 
     * tipus int llegit en el rang <code>[lowerBound .. upperBound]</code>
     * on <code>Integer.MIN_VALUE <= lowerBound</code> i 
     * <code>upperBound <= Integer.MAX_VALUE</code>.
     * <br><br> 
     * - Si l'enter llegit esta fora del rang, llança una excepcio de tipus
     *  <code>IllegalArgumentException</code> amb el missatge:
     *  "v no esta en el rang [lowerBound .. upperBound]"
     *  on v es el valor llegit i lowerBound, upperBound son els 
     *  parametres.
     * <br><br> 
     *  
     * A continuacio, captura aquesta excepcio i mostra per pantalla el 
     * missatge de l'excepcio junt amb el text:
     * ". Per favor, introdueix un valor correcte! ..."
     * <br><br>
     * 
     * - Si el valor no es un enter, mostra per pantalla el missatge: 
     * "Per favor, introdueix un numero enter correcte! ..."
     * <br><br> 
     * La lectura es repeteix fins que el token llegit siga correcte, 
     * tornant el primer que siga un enter valid.
     * 
     * @param sc Scanner des d'on es fa la lectura.
     * @param msg String per preguntar a l'usuari sobre el valor.
     * @param lowerBound int limit inferior.
     * @param upperBound int limit superior.
     * @return int, valor enter dins dels limits.
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
