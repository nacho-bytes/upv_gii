package pract5;

import graph2D.Graph2D;
import java.awt.Color;
import java.util.Scanner;
import java.util.Locale;
import pract4.utilPRG.CorrectReading;
/**
 * Classe Test5. Classe programa que prova diferents accions sobre un
 * grup de poligons, facilitant la visualitzacio del comportament 
 * d'aquestes accions mijançant una representacio grafica. 
 * 
 * @author IIP - Practica 7. PRG - Practica 5.
 * @version Curs 2019/20
 */
public class Test5 {
    private Test5() { } // No s'usen objectes d'aquesta classe
    
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
        
        System.out.println("S'ha creat un grup de polígons de talla " + g.getSize());
        
        Graph2D gd = new Graph2D(-20, 20, -20, 20, 600, 400,
             Color.WHITE, "Prova de grup de polígons");
        drawGroup(gd, g);
       
        int opc = menu(kbd);
        while (opc == 1) {
            System.out.print("      Fes clic en un punt visible interior al polígon.");
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
                    String msg = "      Desplaçament en l'eix X: ";
                    double dx = CorrectReading.nextDouble(kbd, msg);
                    msg = "      Desplaçament en l'eix Y: ";
                    double dy = CorrectReading.nextDouble(kbd, msg);
                    g.translate(p, dx, dy);
                    break;
                case 4:
                    if (g.remove(p)) {
                        System.out.println("   La talla del grup s'ha reduït a " + g.getSize());
                    }
                    break;
                default:   
            }
            drawGroup(gd, g);
            opc = menu(kbd);            
        } 
    } 
    
   /**
     * Mostra un menu d'opcions per pantalla i
     * llig des de teclat una opcio valida.
     * @param kb Scanner, el teclat.
     * @return int, l'opcio valida.
     */
    private static int menu(Scanner kb) {        
        String msg = "======================================\n"
            + "OPCIONS: \n"
            + "   1. Seleccionar el polígon a moure.\n"
            + "   0. Acabar.\n"
            + "   > Introdueix una opció (0/1): ";
        int result = CorrectReading.nextInt(kb, msg, 0, 1);    
        return result;
    }
    
    /**
     * Mostra un submenu d'opcions per pantalla i
     * llig des de teclat una opcio valida.
     * @param kb Scanner, el teclat.
     * @return int, l'opcio valida.
     */
    private static int submenu(Scanner kb) {        
        String msg = "\n      OPCIONS DE MOVIMENT DEL POLÍGON: \n"
            + "         1. Portar-lo al davant.\n"
            + "         2. Portar-lo al fons.\n"
            + "         3. Traslladar-lo.\n"
            + "         4. Eliminar-lo.\n"
            + "        > Introdueix una opció (1/2/3/4): ";
        int result = CorrectReading.nextInt(kb, msg, 1, 4); 
        return result;        
    }
    
    /** 
     * Mostra en l'eixida grafica un grup de poligons donat.
     * @param gd Graph2D, el graf.
     * @param p PolygonGroup, el grup de poligons.
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
