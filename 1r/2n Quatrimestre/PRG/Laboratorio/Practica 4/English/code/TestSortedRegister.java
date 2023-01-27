package pract4;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.time.Year;
import java.util.InputMismatchException;
import java.util.Scanner;
import pract4.utilPRG.CorrectReading;
/**
 * TestSortedRegister class. Test for the class SortedRegister.
 * 
 * @author (PRG. ETSINF - UPV)
 * @version (2019/20)
 */
public class TestSortedRegister {
    /** No objects for this class . */ 
    private TestSortedRegister() { }

    public static void main(String[] args) throws FileNotFoundException {
        Scanner keyB = new Scanner(System.in);
        int currentY = 2020;
        String msg = "Input a number of year (no more than ten years ago): ";
        int year = CorrectReading.nextInt(keyB, msg, currentY - 10, currentY);   
        System.out.print("Name of the file to classify: "); 
        String nameIn = keyB.next();
        Scanner in = null; PrintWriter out = null, err = null;
        File f = new File("pract4/data/" + nameIn);;
        in = new Scanner(f);
        f = new File("pract4/data/" + "result.out");
        out = new PrintWriter(f);
        f = new File("pract4/data/" + "result.log");
        err = new PrintWriter(f);   
        msg = "Classification options: \n" 
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

  
    /** Method that tests add(Scanner) and save(PrintWriter)
     *  from SortedRegister. It processes data items read from in.
     *  Processed data items are saved on out.
     *  When any error is found on input data
     *  process terminates and out remains empty.
     *  @param year year for data.
     *  @param sc Scanner data source.
     *  @param out PrintWriter processed data destination.
     */
    public static void test1(int year, Scanner in, PrintWriter out) {
        SortedRegister c = new SortedRegister(year);
        int n = c.add(in);  
        if (n > 0) { 
           c.save(out); 
           System.out.println( n + " lines processed.");
        } else { System.out.println("Result file is empty."); }
        System.out.println("----------------------------------------------------");
        System.out.println("test1 finished.");
        System.out.println("----------------------------------------------------");
    }
    
    /** Method that tests add(Scanner) and save(PrintWriter)
     *  from SortedRegister. It processes data items read from in.
     *  Processed data items are saved on out.
     *  When any error is found on input data, it is ignored:
     *  its data is not processed and err records the number of line
     *  and the error found.
     *  @param year year for data.
     *  @param sc Scanner data source.
     *  @param out PrintWriter processed data destination.
     *  @param err PrintWriter error report destination.
     */
    public static void test2(int year, Scanner in, PrintWriter out,
        PrintWriter err) {
        // TO COMPLETE
        System.out.println("----------------------------------------------------");
        System.out.println("test2 finished.");
        System.out.println("----------------------------------------------------");
    }
}
