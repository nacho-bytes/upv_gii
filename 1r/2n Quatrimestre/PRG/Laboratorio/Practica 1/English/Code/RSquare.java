package pract1; 
 
// Imports classe Graph2D (available in package graph2D).
import graph2D.Graph2D;
// Imports class Color from package java.awt for chaning
// the colours of the elements to be drawn.
import java.awt.Color;
import java.awt.Font;
/**
 * Drawing figures of type "Recursive Square".
 * From "Introduction to Programming in Java",
 * Sedgewick & Wayne, Princeton.
 * @author IIP-PRG-DSIC-ETSINF. pmarques
 * @version Academic year 2018-19
 */
public class RSquare {
    
    /** There are no objects of this class. */
    private RSquare() { }
    
    /** Draws in the window <code>gd</code> a grey filled square with
     *  the ledge highlighted in blue, centred at <code>( cX, cY )</code>
     *  and lateral length equal to <code>l</code>.
     */
    public static void drawCentSquare(Graph2D gd, 
                                      double cX, double cY, double l) {
        delay();                                           
        // Computes the coordinates of the upper left corner (luX, luY)
        // of the square from its centre (cX, cY) and its lateral length l:
        double luX =           ; // TO COMPLETE 
        double luY =           ; // TO COMPLETE 
        
        // Draws a grey coloured solid rectangle, with the same vertical
        // and horizontal lateral length equal to l.
        // The upper left corner of the rectangle is at (luX, luY):
        gd.fillRect(luX, luY, l, l, Color.LIGHT_GRAY, 2);
        // Draws a non-filled rectangle with blue border, 
        // with the same vertical and horizontal lateral length equal to l.
        // The upper left corner of the rectangle is at (luX, luY):
        gd.drawRect(luX, luY, l, l, Color.BLUE, 2);
    }
    
    /** Waits 100 ms to continue the execution of the current thread. */
    private static void delay() {
        try { Thread.sleep(100); } catch (Exception e) { ; }
    }
    
    /** Draws in the window <code>gd</code> an <code>RSquare-A</code> figure
     *  of order <code>n >= 1</code>, with the central square centred at
     *  <code>( cX, cY )</code> and lateral length equal to $l$.
     */
    public static void rSquareA(Graph2D gd, int n, 
                                double cX, double cY, double l) {
        // TO COMPLETE 
    } 
    
    /** Draws an <code>RSquare-A</code> figure of order <code>n >= 1</code>
     *  with lateral length equal to 1 and centred at <code>(0, 0)</code>.
     */
    public static void rSquareA(int n) {
        // TO COMPLETE 
    }
    
    /** Draws an <code>RSquare-B</code> figure of order <code>n >= 1</code>
     *  with lateral length equal to 1 and centred at <code>(0, 0)</code>.
     */
    public static void rSquareB(Graph2D gd, int n, 
                                double cX, double cY, double l) {
        // TO COMPLETE 
    }     
    
    /** Draws an <code>RSquare-B</code> figure of order <code>n >= 1</code>
     *  with lateral length equal to 1 and centred at <code>(0, 0)</code>.
     */
    public static void rSquareB(int n) {
        // TO COMPLETE            
    }
}