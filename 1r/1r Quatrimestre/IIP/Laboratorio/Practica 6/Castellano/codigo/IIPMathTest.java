package pract6;

import java.util.Locale;
import java.util.Scanner;
/**
 * Clase IIPMathTest: clase programa que permite que el usuario compare el valor 
 * devuelto por sus funciones sqrt(x) (raiz cuadrada de x) y log(x) (logaritmo 
 * natural de x) con los proporcionados por Java en su libreria Math.
 * 
 * @author IIP
 * @version Curso 2019-2020
 */
public class IIPMathTest {    
    /** No se pueden crear objetos de esta clase. */
    private IIPMathTest() { }    
    
    public static void main(String[] args) {        
        Scanner kbd = new Scanner(System.in).useLocale(Locale.US);
        
        System.out.println("Comparación de sqrt y log (IIPMath y Math).");
        System.out.println("Para acabar introduce un valor 0 o negativo.\n");
        
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
