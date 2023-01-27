package pract7;

import graph2D.Graph2D;
import java.awt.Color;
import java.util.Scanner;
import java.util.Locale;
import pract5.Point;
/**
 * Class Test7.
 * Program-type class for performing different tests on a group of polygons.
 * The different actions will be represented graphically in order to help
 * students to understand what is done.
 * 
 * @author IIP - Lab practice 7
 * @version Academic year 2019/20
 */
public class Test7 {
    private Test7() { } // No objects of this class will be created.
    
    public static void main(String[] args) {
        Scanner kbd = new Scanner(System.in).useLocale(Locale.US);
        
        PolygonGroup g = new PolygonGroup();
        double[] x1 = {-2.0, 2.0, 2.0, -2.0};
        double[] y1 = {3.0, 3.0, -2.0, -2.0};
        Polygon pol = new Polygon(x1, y1);
        pol.setColor(Color.GREEN);
        boolean res = g.add(pol);
        
        double[] x2 = {0.0, 0.0, 12.0};
        double[] y2 = {0.0, 8.0, 0.0};
        pol = new Polygon(x2, y2);
        pol.setColor(Color.BLUE);
        res = g.add(pol);
        
        double[] x3 = {-1.0, 1.0, 1.0, -1.0};
        double[] y3 = {4.0, 4.0, -4.0, -4.0};
        pol = new Polygon(x3, y3);
        pol.setColor(Color.RED);
        res = g.add(pol);
      
        double[] x4 = {-2.5, 0.0, 2.5, 0.0};
        double[] y4 = {5.7, 10.0, 5.7, 1.0};
        pol = new Polygon(x4, y4);
        pol.setColor(Color.YELLOW);
        res = g.add(pol);
        
        System.out.println("A group of polygons has been created with a total of " 
            + g.getSize() + " polygons." );
        
        Graph2D gd = new Graph2D(-20, 20, -20, 20, 600, 400,
             Color.WHITE, "Test group of polygons");
        drawGroup(gd, g);
       
        int opc = menu(kbd);
        while (opc == 1) {
            System.out.print("      Press a visible point inside a polygon.");
            double[] coord = gd.nextMousePressed();
            gd.drawPoint(coord[0], coord[1], Color.BLACK, 3);
            Point p = new Point(coord[0], coord[1]);
            int opc2 = submenu(kbd);
            switch (opc2) {
                case 1: 
                    /* TO COMPLETE */
                    break;
                case 2:
                    /* TO COMPLETE */
                    break;
                case 3:
                    System.out.print("      x-axis offset: ");
                    double dx = kbd.nextDouble();
                    System.out.print("      y-axis offset: ");
                    double dy = kbd.nextDouble();
                    /* TO COMPLETE */
                    break;
                case 4:
                    /* TO COMPLETE */
                    System.out.println("   The size of the group has beed decreased to " 
                        + g.getSize());
                    break;
                default:   
            }
            drawGroup(gd, g);
            opc = menu(kbd);            
        } 
    } 
    
    /**
     * Shows a menu on screen with several options and reads from keyboard a valid option.
     *
     * @param kb Scanner, An object of the class <code>Scanner</code> representing the standard input.
     * @return int, a valid option.
     */
    private static int menu(Scanner kb) {
        int result;
        do {
            System.out.println("======================================");
            System.out.println("OPTIONS: ");
            System.out.println("   1. Select a polygon to be moved.");
            System.out.println("   0. Finish.");        
            System.out.print("   > Enter an option (0/1): ");
            result = kb.nextInt();
        } while (result <  0 || result > 1);
        return result;
    }
    
    /**
     * Shows a submenu on scree with several options and reads from keyboard a valid option.
     *
     * @param kb Scanner, An object of the class <code>Scanner</code> representing the standard input.
     * @return int, a valid option.
     */
    private static int submenu(Scanner kb) {
        int result;
        do {
            System.out.println("\n      OPTIONS FOR MANIPULATING THE SELECTED POLYGON: ");
            System.out.println("         1. Bring it to the front.");
            System.out.println("         2. Push it to the back.");
            System.out.println("         3. Move it from its location to another one.");
            System.out.println("         4. Remove it.");
            System.out.print("        > Enter an option (1/2/3/4): ");
            result = kb.nextInt();
        } while (result < 1 || result > 4);
        return result;        
    }
    
    /** 
     * Shows on a graphical window a group of polygons.
     *
     * @param gd Graph2D, the canvas.
     * @param p PolygonGroup, the group of polygons.
     */
    private static void drawGroup(Graph2D gd, PolygonGroup g) {
        gd.clear(); 
        Polygon[] aPol = g.toArray();
        for (int i = 0; i < aPol.length; i++) {
            gd.fillPolygon(aPol[i].verticesX(), aPol[i].verticesY(),
                aPol[i].getColor(), 2);   
        }   
    }
}
