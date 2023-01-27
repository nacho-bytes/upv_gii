package pract5;

import graph2D.Graph2D;
import java.awt.Color;
import java.util.Scanner;
import java.util.Locale;
import pract4.utilPRG.CorrectReading;
/**
 * Class Test5.
 * Test class for testing different actions that can be performed
 * with a group of polygons.
 * This test class facilitates the visualization of the behaviour
 * of each action by a graphical representation.
 * 
 * @author IIP - Lab practice 7, PRG - Lab practice 5.
 * @version Academic year 2019/20
 */
public class Test5 {
    private Test5() { } // Private constructor to avoid creating objects of this class.
    
    public static void main(String[] args) {
        Scanner kbd = new Scanner(System.in).useLocale(Locale.US);
        
        PolygonGroup g = new PolygonGroup();
        
        double[] x1 = {-2.0, 2.0, 2.0, -2.0};
        double[] y1 = {3.0, 3.0, -2.0, -2.0};
        Polygon pol = new Polygon(x1, y1);
        pol.setColor(Color.GREEN);
        g.add(pol);
        
        double[] x2 = {0.0, 0.0, 12.0};
        double[] y2 = {0.0, 8.0, 0.0};
        pol = new Polygon(x2, y2);
        pol.setColor(Color.BLUE);
        g.add(pol);
        
        double[] x3 = {-1.0, 1.0, 1.0, -1.0};
        double[] y3 = {4.0, 4.0, -4.0, -4.0};
        pol = new Polygon(x3, y3);
        pol.setColor(Color.RED);
        g.add(pol);
      
        double[] x4 = {-2.5, 0.0, 2.5, 0.0};
        double[] y4 = {5.7, 10.0, 5.7, 1.0};
        pol = new Polygon(x4, y4);
        pol.setColor(Color.YELLOW);
        g.add(pol);
        
        System.out.println("A polygon group with " + g.getSize() + " polygons has bee created.");
        
        Graph2D gd = new Graph2D(-20, 20, -20, 20, 600, 400,
             Color.WHITE, "Polygon group testing.");
        drawGroup(gd, g);
       
        int opc = menu(kbd);
        while (opc == 1) {
            System.out.print("      Press the mouse left button when the mouse pointer " 
                + "is inside a visible part of a polygon.");
            double[] coord = gd.nextMousePressed();
            gd.drawPoint(coord[0], coord[1], Color.BLACK, 3);
            Point p = new Point(coord[0], coord[1]);
            int opc2 = submenu(kbd);
            switch (opc2) {
                case 1: 
                    g.toFront(p);
                    break;
                case 2:
                    g.toBack(p);
                    break;
                case 3:                    
                    String msg = "      X-axis shift: ";
                    double dx = CorrectReading.nextDouble(kbd, msg);
                    msg = "      Y-axis shift: ";
                    double dy = CorrectReading.nextDouble(kbd, msg);
                    g.translate(p, dx, dy);
                    break;
                case 4:
                    if (g.remove(p)) {
                        System.out.println("   Polygon group size reduced to " + g.getSize());
                    }
                    break;
                default:   
            }
            drawGroup(gd, g);
            opc = menu(kbd);            
        } 
    } 
    
    /**
     * Shows a menu on screen with different options
     * and reads from standard input (keyboard) a
     * valid option.
     * @param kb Scanner, standard input (keyboard).
     * @return int, the selected option.
     */
    private static int menu(Scanner kb) {        
        String msg = "======================================\n"
            + "OPTIONS: \n"
            + "   1. Select the polygon to be moved.\n"
            + "   0. Finish.\n"
            + "   > Choose an option (0/1): ";
        int result = CorrectReading.nextInt(kb, msg, 0, 1);    
        return result;
    }
    
    /**
     * Shows on screen a sub-menu with different options
     * and reads from standard input (keyboard) a
     * valid option.
     * @param kb Scanner, standard input (keyboard).
     * @return int, the selected option.
     */
    private static int submenu(Scanner kb) {        
        String msg = "\n      OPTIONS FOR MOVING A POLYGON: \n"
            + "         1. Bring the polygon to the front.\n"
            + "         2. Push the polygon to the back.\n"
            + "         3. Move the polygon from its current location to another one.\n"
            + "         4. Delete the polygon.\n"
            + "        > Choose an option (1/2/3/4): ";
        int result = CorrectReading.nextInt(kb, msg, 1, 4); 
        return result;        
    }
    
    /** 
     * Paint graphically the provided polygon group.
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