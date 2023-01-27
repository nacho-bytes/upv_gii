package pract5;

import graph2D.Graph2D;
import java.awt.Color;
import java.util.Scanner;
/**
 * Class RayTest: program class for checking if it is correct
 *                the method <code>cross()</code> of the class
 *                <code>Point</code>.
 * 
 * @author IIP - Lab Activity 5
 * @version Academic Year 2019/20
 */
public class RayTest {
    /** No objects of this class are created, so the default 
     *  and unique constructor must be private. */
    private RayTest() { }
   
    /** Main method. */
    public static void main(String[] args) {              
        // Points to be tested:
        Point p1 = new Point(-1, 18),
              p2 = new Point(2, 16),
              p3 = new Point(-4, 10),
              p4 = new Point(14, 7),
              p5 = new Point(1, 0),
              p6 = new Point(-5, -6);
        
        // Vertex of the segments:
        Point vert1 = new Point(3.0, 16.0), 
              vert2 = new Point(3.0, 0.0), 
              vert3 = new Point(17.0, 0.0);
              
        // STANDARD OUTPUT
        // CASE 1:
        int c = p1.cross(vert2, vert3);
        System.out.println("  Crossing of segment " + vert2 + " to " + vert3
                           + " from " + p1 + " : " + crossToString(c));
        
        /* Choose one example of each possible situation, check it
           and print the result in the standard output. */

        // CASE 2:
        /* TO BE COMPLETED BY STUDENTS */
        
        // CASE 3:
        /* TO BE COMPLETED BY STUDENTS */
        
        // CASE 4:
        /* TO BE COMPLETED BY STUDENTS */
        
        // CASE 5:
        /* TO BE COMPLETED BY STUDENTS */
        
        // GRAPHICAL OUTPUT    
        // Creation of the canvas:
        Graph2D gd = new Graph2D(-20, 20, -20, 20, 600, 600, Color.WHITE, "RAY TEST");
        
        // Plotting of the segments used in the test cases:
        gd.drawLine(vert2.getX(), vert2.getY(), vert3.getX(), vert3.getY(), Color.RED, 3); 
        /* TO BE COMPLETED BY STUDENTS */
        
        // Plotting of the points and their rays used in the test cases:
        drawRay(gd, p1);
        /* TO BE COMPLETED BY STUDENTS */
    }  
    
    
    /** Returns and <code>String</code> indicating the crossing type according to the
     *  value of <code>c</code>, which must be among one of the possible values:
     *  <code>DONT_CROSS</code>, <code>LOW_CROSS</code>, <code>CROSS</code> and 
     *  <code>HIGH_CROSS</code>.
     */
    private static String crossToString(int c) {
        String res = "";
        /* TO BE COMPLETED BY STUDENTS: give to the local variable <code>res</code>
           the corresponding description by using the constants defined in
           the class <code>Point</code>. */


        return res;
    }
    
    /** Plots in the canvas <code>gd</code> the point <code>p</code> and its ray. */
    private static void drawRay(Graph2D gd, Point p) {
        gd.drawPoint(p.getX(), p.getY(), Color.BLACK, 4);
        gd.drawLine(p.getX(), p.getY(), 20, p.getY(), Color.GREEN, 1);
    }
}
