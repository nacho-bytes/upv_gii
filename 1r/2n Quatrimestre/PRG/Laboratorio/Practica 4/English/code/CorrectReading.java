package pract4.utilPRG;

import java.util.InputMismatchException;
import java.util.Locale;
import java.util.Scanner;
/**
 * Class CorrectReading. Utility class to perform validated reading of
 * from standard input.
 * 
 * @author (PRG. ETSINF - UPV)
 * @version  (2019/20)
 */
public class CorrectReading {
    
    /** There are not objects of this class. */
    private CorrectReading() { }
	
    // ACTIVITY 2:
    /**
     * Reads from a Scanner object and returns an integer value. 
     * @param keyboard Scanner object for reading from.
     * @param message String for asking to the user for the value.
     * @return int, the integer value user entered.
     */
    public static int nextInt(Scanner keyboard, String message) {
        int value = 0;
        boolean someError = true; 
        do {
            try {
                System.out.print(message);
                value = keyboard.nextInt();
                someError = false;
            } catch (InputMismatchException e) {
                System.out.println("Please, type a correct integer! ...");
            } finally {
                keyboard.nextLine();
            }
        } while (someError);
        return value;
    }  
    
    /**
     * Reads from a Scanner object and returns a double value. 
     * @param keyboard Scanner object for reading from.
     * @param message String for asking to the user for the value.
     * @return double, the double value user entered.
     */
    public static double nextDouble(Scanner keyboard, String message) {
        double value = 0;
        boolean someError = true; 
        do {
            try {
                System.out.print(message);
                value = keyboard.nextDouble();
                someError = false;
            } catch (InputMismatchException e) {
                System.out.println("Please, type a correct floating point value! ...");
            } finally {
                keyboard.nextLine();
            }
        } while (someError);
        return value;
    } 
    
    // ACTIVITY 3:
    /**
     * Reads from a Scanner object and returns a double value 
     * checking that it is > 0.
     * @param keyboard Scanner object for reading from.
     * @param message String for asking the user for the value.
     * @return double, a non-negative double value.
     */    
    public static double nextDoublePositive(Scanner keyboard, String message) {
        double value = 0.0;
		boolean someError = true; 
        do {// TO BE COMPLETED 
            System.out.print(message);
            value = keyboard.nextDouble();    
			if (value < 0.0) {
				 System.out.println("Please, type a correct positive floating point value!! ... ");
            } else { someError = false; }
            keyboard.nextLine();
        } while (someError);	
        return value;
    }
    
    // ACTIVITY 4:
    /**
     * Reads from a Scanner object and returns an integer value 
     * in the range <code>[ lowerBound .. upperBound ]</code> 
     * where <code>Integer.MIN_VALUE <= lowerBound</code> and 
     * <code>upperBound <= Integer.MAX_VALUE</code>.
     * @param keyboard Scanner object for reading from.
     * @param message String for asking to the user for the value.
     * @param lowerBound int lower bound of the value to be read and accepted.
     * @param upperBound int upper bound of the value to be read and accepted.
     * @return int, the integer number entered by the user.
     */    
    public static int nextInt(Scanner keyboard, String message, 
                              int lowerBound, int upperBound) {
        int value = 0;        
		// TO BE COMPLETED 
        System.out.print(message);
        value = keyboard.nextInt(); 
		// TO BE COMPLETED 
        keyboard.nextLine();
		// TO BE COMPLETED 
        return value;
    }  
}