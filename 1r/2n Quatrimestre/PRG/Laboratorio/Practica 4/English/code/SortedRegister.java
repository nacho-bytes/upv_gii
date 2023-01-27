package pract4;

import java.io.PrintWriter; 
import java.util.Scanner;
/**
 * SortedRegister class: A SortedRegister keeps a bidimensional array m in which rows
 * are months and columns are days of the month, in such a way that m[r][c] correspong to the
 * accumulated amount of accidents for day c of month r.
 * This class contains the needed methods to fill the matrix with 
 * data read from a Scanner, and to save data in the matrix on a
 * PrintWriter.
 * @author (PRG. ETSINF - UPV) 
 * @version (2019/20)  
 */
public class SortedRegister {
    private static int[] DAYS = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};  
    private int year;
    private int[][] m;

    /** Create a SortedRegister for year dataYear.
     *  @param dataYear int.
     */
    public SortedRegister(int dataYear) {
        this.year = dataYear;
        boolean leap = isLeap(this.year);
        this.m = new int[13][]; 
        for (int month = 1; month <= 12; month++) {
            int numD = DAYS[month];
            if (month == 2 && leap) { numD++; }
            this.m[month] = new int[numD + 1];
        }    
    }    
    
    /** Classify and sort data read from Scanner s, line by line
     *  Precondition: Each line has data organised as
     *        day month amount
     *  where day and month must be integers corresponding to a
     *  correct date for the year of this, and amount must be an integer > 0.
     *  The read amount is accumulated onto the register that is kept
     *  for the day of the month.
     *  
     *  Returns the amount of processed lines
     *  
     *  @throws NumberFormatException when a non-integer data item is read.
     *  @throws IllegalArgumentException when line has no three data items
     *  or they do not fit the format (date and correct amount).
     *  
     *  @param sc Scanner data source.
     *  @return int
     *  
     */
    public int add(Scanner sc) {
        // TO COMPLETE WITH EXCEPTION CATCHING 
        int count = 0;
            while (sc.hasNext()) {    
                count++;
                this.handleLine(sc.nextLine());
            }
        return count;
    } 
    
    /** Help method for add method: process data from line, String
     *  that corresponds to a line read from the Scanner object.
     *  Format for "line" must be
     *        day month amount
     *  where day and month must be integers corresponding to a
     *  correct date, and amount must be an integer > 0.
     *  - If data in the line is correct, the read amount is accumulated
     *    onto the record of the day of the month.
     *  - If data is incorrect, the method terminates by throwing an exception.
     *
     *  @param line String data source.
     *  @throws NumberFormatExceptionException when a non-integer data item is read.
     *  @throws IllegalArgumentException when line has no three data items
     *  or they do not fit the format (date and correct amount).
     */    
    private void handleLine(String line) {
        String[] data = line.trim().split("[ ]+"); 
        // data is an array with as many components as tokens has line
        if (data.length != 3) { 
            throw new IllegalArgumentException("Line does not contain three data items.");
        }
        int day = Integer.parseInt(data[0]); // May raise NumberFormatException
        int month = Integer.parseInt(data[1]); // May raise NumberFormatException
        int amount = Integer.parseInt(data[2]); // May raise NumberFormatException
        if (month <= 0 || month >= this.m.length || day <= 0 || day >= this.m[month].length) {
            throw new IllegalArgumentException("Incorrect date.");
        }
        // TO COMPLETE
        this.m[month][day] += amount; // Previous check avoids raising
                                      // ArrayIndexOutOfBoundsException
    }
    
    /** Recorded data items > 0 are written into p, line by line
     *  with format
     *        day  month  amount
     *  chronologically sorted.
     *  @param pw Printwriter sorted data destination.
     */
    public void save(PrintWriter pw) {
        for (int month = 1; month <= 12; month++) {
            for (int day = 1; day < this.m[month].length; day++) {
                int totalAmount = this.m[month][day];
                if (totalAmount > 0) {
                    pw.printf("%5d %5d %5d \n", day, month, totalAmount);
                }
            }
        }
    }

    /** Sort data read from Scanners. Data with wrong format are filtered,
     *  and an error report is generated.
     *  Precondition: Line format must be
     *        day month amount
     *  where day and month must be integers corresponding to a
     *  correct date, and amount must be an integer > 0.
     *  The read amount gets accumulated onto the record corresponding
     *  to the day of the month.
     *  Wrong lines are written onto err, indicating line number.
     *  @param sc Scanner data source.
     *  @param err PrintWriter error report destination.
     *  @return int, amount of processed lines.
     */
    public int add(Scanner sc, PrintWriter err) {
        int count = 0;
        
        // TO COMPLETE
        
        return count;
    }
    
    /** Check whether year is leap or not.
     *  @param year int
     *  @return true if it is leap.
     */
    private static boolean isLeap(int year) {
        return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
    }
}
