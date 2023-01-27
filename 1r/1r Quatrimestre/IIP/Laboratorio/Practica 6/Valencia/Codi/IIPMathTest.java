package pract6;

import java.util.Locale;
import java.util.Scanner;
/**
 * Classe IIPMathTest: classe programa que permet que l'usuari compare el valor 
 * tornat per les seues funcions sqrt(x) (arrel quadrada de x) i log(x) (logaritme 
 * natural de x) amb els proporcionats per Java en la seua llibreria Math.
 * 
 * @author IIP
 * @version Curs 2019-2020
 */
public class IIPMathTest {    
    /** No es poden crear objectes d'aquesta classe. */
    private IIPMathTest() { }    
    
    public static void main(String[] args) {        
        Scanner kbd = new Scanner(System.in).useLocale(Locale.US);
        
        System.out.println("Comparació de sqrt i log (IIPMath i Math).");
        System.out.println("Per acabar introdueix un valor 0 o negatiu.\n");
        
        System.out.print("Valor: ");
        double val = kbd.nextDouble();        
        
        while (val > 0) {
            double xr1 = IIPMath.sqrt(val);
            double xr2 = Math.sqrt(val); 
            System.out.printf(Locale.US, 
                "%14s %+1.16e \n %14s %+1.16e %8s %1.3g%n",
                "SQRT-- IIPMath:", xr1, "Math:", xr2, "|Diff|:",
                Math.abs(xr1 - xr2));
            
            double xl1 = IIPMath.log(val);
            double xl2 = Math.log(val);  
          
            System.out.printf(Locale.US,
                "%14s %+1.16e \n %14s %+1.16e %8s %1.3g%n",
                "LOG -- IIPMath:", xl1, "Math:", xl2, "|Diff|:",
                Math.abs(xl1 - xl2));
                
            System.out.printf("%1$6s %2$20s %3$18s%n", "------", 
                "--------------------------------",
                "-----------------");
            
            System.out.print("Valor: ");
            val = kbd.nextDouble();
        }
    }       
}
