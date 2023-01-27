package pract3;

import java.util.Locale;
import java.util.Random;

/** Class MeasuringSortingAlgorithms: Empirical analysis of the temporal cost of sorting algorithms
 *  @author PRG - ETSInf
 *  @version Curso 2019-2020
 */
class MeasuringSortingAlgorithms
{
    // Constants to be used when varying the measuring parameters
    public static final int MIN_SIZE = 1000, 
                            MAX_SIZE = 10000;
    public static final int STEP_OF_SIZE = 1000,
                            REPETITIONS = 200;
    public static final double NMS = 1e3;  // ratio microseconds/nanoseconds


    private static final Random generator = new Random(); // Generator of random numbers

  
    /* Creates an array of length size 
     * @param size int, size of the array
     * @result int[], created array
     */
    private static int[] createArray( int size )
    { 
        int[] a = new int[size]

        return a;
    }
  
    /* Fills an int array with random values
     * @param a int[], array to be filled
     */
    private static void fillArrayRandom( int [] a )
    {
        // To be completed by students
    }

    /* Fills an int array sorted in ascending order
     * @param a int[], array to be filled
     */
    private static void fillArraySortedInAscendingOrder( int [] a )
    { 
        // To be completed by students
    }

    /* Fills an int array sorted in descending order
     * @param a int[], array to be filled
     */
    private static void fillArraySortedInDescendingOrder( int [] a )
    {
        // To be completed by students
    }

    public static void measuringSelectionSort()
    { 
        // To be completed by students
    }

    public static void measuringInsertionSort()
    { 
        // To be completed by students
    }
  
    public static void measuringMergeSort()
    { 
        // To be completed by students
    }

    private static void help()
    {
        System.out.println( "Usage: java MeasurigSortingAlgorithms <algorithm_number>" );
        System.out.println( "   Where <algorithm_number> can be: " );
        System.out.println( "   1 -> Insertion Sort" );
        System.out.println( "   2 -> Selection Sort" );
        System.out.println( "   3 -> Merge Sort" );
    }

    public static void main( String[] args )
    {
        if ( args.length != 1 ) {
            help();
        } else {
            try {
                int a = Integer.parseInt(args[0]);
                switch (a) {
                    case 1: measuringInsertionSort(); break;
                    case 2: measuringSelectionSort(); break;
                    case 3: measuringMergeSort(); break;
                    default: help();
                }
            } catch (Exception e) {
                help(); 
            }
        }
    }
}
