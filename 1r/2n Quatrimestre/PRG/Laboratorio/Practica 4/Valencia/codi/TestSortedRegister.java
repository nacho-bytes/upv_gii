package pract4;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.time.Year;
import java.util.InputMismatchException;
import java.util.Scanner;
import pract4.utilPRG.CorrectReading;
/**
 * Classe TestSortedRegister. Test de la classe SortedRegister.
 * 
 * @author (PRG. ETSINF - UPV)
 * @version (2019/20)
 */
public class TestSortedRegister {
    /** No hi ha objectes d'aquesta classe. */  
    private TestSortedRegister() { }

    public static void main(String[] args) throws FileNotFoundException {
        Scanner keyB = new Scanner(System.in);
        int currentY = 2020;
        String msg = "Any de les dades (fins 10 anys endarrere): ";
        int year = CorrectReading.nextInt(keyB, msg, currentY - 10, currentY);   
        System.out.print("Nom del fitxer a classificar: "); 
        String nameIn = keyB.next();
        Scanner in = null; PrintWriter out = null, err = null;
        File f = new File("pract4/data/" + nameIn);
        in = new Scanner(f);
        f = new File("pract4/data/" + "result.out");
        out = new PrintWriter(f);
        f = new File("pract4/data/" + "result.log");
        err = new PrintWriter(f);   
        msg = "Opcions de classificacio: \n" 
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
  
    /** Metode de prova d'add(Scanner) i save(PrintWriter)
     *  de SortedRegister. Processa les dades llegides d'in.
     *  Les dades processades es guarden en out.
     *  Si es troba algun error en les dades d'entrada,
     *  el proces acaba i out queda buit.
     *  @param year any de les dades.
     *  @param sc Scanner font de les dades.
     *  @param out PrintWriter desti de les dades processades.
     */
    public static void test1(int year, Scanner in, PrintWriter out) {
        SortedRegister c = new SortedRegister(year);
        int n = c.add(in);  
        if (n > 0) { 
            c.save(out); 
            System.out.println("S'han processat " + n + " linies.");
        } else { System.out.println("El fitxer de resultats ha quedat buit."); }
        System.out.println("----------------------------------------------------");
        System.out.println("test1 finalitzat.");
        System.out.println("----------------------------------------------------");
    }
    
    /** Metode de prova d'add(Scanner) i save(PrintWriter)
     *  de SortedRegister. Processa les dades llegides d'in.
     *  Les dades processades es guarden en out.
     *  Si es troba alguna linia erronia, s'ignora: 
     *  les seues dades no es processen i en err es registra el 
     *  nombre de linia i l'error trobat.
     *  @param year any de les dades.
     *  @param sc Scanner font de les dades.
     *  @param out PrintWriter desti de les dades processades.
     *  @param err PrintWriter desti de l'informe d'errors.
     */
    public static void test2(int year, Scanner in, PrintWriter out,
        PrintWriter err) {
        // COMPLETAR
        System.out.println("----------------------------------------------------");
        System.out.println("test2 finalitzat.");
        System.out.println("----------------------------------------------------");
    }
}