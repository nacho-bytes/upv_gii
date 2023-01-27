package pract4;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.time.Year;
import java.util.InputMismatchException;
import java.util.Scanner;
import pract4.utilPRG.CorrectReading;
/**
 * Clase TestSortedRegister. Test de la clase SortedRegister.
 * 
 * @author (PRG. ETSINF - UPV)
 * @version (2019/20)
 */
public class TestSortedRegister {
    /** No hay objetos de esta clase. */ 
    private TestSortedRegister() { }

    public static void main(String[] args) throws FileNotFoundException {
        Scanner keyB = new Scanner(System.in);
        int currentY = 2020;
        String msg = "Introduzca un número de año (hasta diez años atrás): ";
        int year = CorrectReading.nextInt(keyB, msg, currentY - 10, currentY);   
        System.out.print("Nombre del fichero a clasificar: "); 
        String nameIn = keyB.next();
        Scanner in = null; PrintWriter out = null, err = null;
        File f = new File("pract4/data/" + nameIn);;
        in = new Scanner(f);
        f = new File("pract4/data/" + "result.out");
        out = new PrintWriter(f);
        f = new File("pract4/data/" + "result.log");
        err = new PrintWriter(f);   
        msg = "Opciones de clasificación: \n" 
            + "  1.- test1.\n"
            + "  2.- test2.\n"
            + "  ? ";
        int option = CorrectReading.nextInt(keyB, msg, 1, 2);
        switch (option) {
            case 1:  
                test1(year, in, out);
                break;
            case 2: 
                test2(year, in, out, err); 
                break;
            default: 
        }
        in.close(); 
        out.close(); 
        err.close(); 
    }

  
    /** Metodo de prueba de add(Scanner) y save(PrintWriter)
     *  de SortedRegister. Procesa los datos que se leen de in.
     *  Los datos procesados se guardan en out.
     *  Si se encuentra algun error en los datos de entrada,
     *  el proceso termina y out queda vacio.
     *  @param year año de los datos.
     *  @param sc Scanner fuente de los datos.
     *  @param out PrintWriter destino de los datos procesados.
     */
    public static void test1(int year, Scanner in, PrintWriter out) {
        SortedRegister c = new SortedRegister(year);
        int n = c.add(in);  
        if (n > 0) { 
           c.save(out); 
           System.out.println("Se han procesado " + n + " líneas.");
        } else { System.out.println("El fichero de resultados ha quedado vacío."); }
        System.out.println("----------------------------------------------------");
        System.out.println("test1 finalizado.");
        System.out.println("----------------------------------------------------");
    }
    
    /** Método de prueba de add(Scanner, PrintWriter) y save(PrintWriter)
     *  de SortedRegister. Procesa los datos que se leen de in.
     *  Los datos procesados se guardan en out.
     *  Si se encuentra algun dato erroneo, se ignora: 
     *  sus datos no se procesan y en err se registra el numero de linea
     *  y el error encontrado.
     *  @param year año de los datos.
     *  @param sc Scanner fuente de los datos.
     *  @param out PrintWriter destino de los datos procesados.
     *  @param err PrintWriter destino del informe de errores.
     */
    public static void test2(int year, Scanner in, PrintWriter out,
        PrintWriter err) {
        // COMPLETAR
        System.out.println("----------------------------------------------------");
        System.out.println("test2 finalizado.");
        System.out.println("----------------------------------------------------");
    }
}