import java.util.Scanner;

/**
 *  Classe Test3.
 *  Una primera classe amb lectura de dades des de teclat, 
 *  i us d'operacions amb int, long, Math i String.
 *  Conte tres errors de compilacio.
 *  @author IIP 
 *  @version Curs 2019-20
 */
 
{ public class Test3 

    public static void main(String[] args){
        Scanner kbd=new Scanner(System.in);
        System.out.println("Lectura de teclat d'una hora.");
        system.out.print(" -> Introduiu les hores (entre 0 i 23): ");
        int h = kbd.nextInt();
        System.out.print(" -> Introduiu els minuts (entre 0 i 59): ");
        int m = kbd.nextInt();
        System.out.println("Hora introduida: "  h + " i " + m);        
     
    }    
 
}
