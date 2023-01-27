package pract5;

import graph2D.Graph2D;
import java.awt.Color;
import java.util.Scanner;
import java.util.Locale;
import pract4.utilPRG.CorrectReading;
/**
 * Clase Test5. Clase programa que prueba diferentes acciones sobre un
 * grupo de poligonos, facilitando la visualizacion del comportamiento 
 * de dichas acciones mediante una representacion grafica. 
 * 
 * @author IIP - Practica 7. PRG - Practica 5.
 * @version Curso 2019/20
 */
public class Test5 {
    private Test5() { } // No se usan objetos de esta clase
    
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
        
        System.out.println("Se ha creado un grupo de polígonos de talla " + g.getSize());
        
        Graph2D gd = new Graph2D(-20, 20, -20, 20, 600, 400,
             Color.WHITE, "Prueba de grupo de Polígonos");
        drawGroup(gd, g);
       
        int opc = menu(kbd);
        while (opc == 1) {
            System.out.print("      Pulse un punto visible interior al polígono.");
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
                    String msg = "      Desplazamiento en el eje X: ";
                    double dx = CorrectReading.nextDouble(kbd, msg);
                    msg = "      Desplazamiento en el eje Y: ";
                    double dy = CorrectReading.nextDouble(kbd, msg);
                    g.translate(p, dx, dy);
                    break;
                case 4:
                    if (g.remove(p)) {
                        System.out.println("   La talla del grupo se ha reducido a " + g.getSize());
                    }
                    break;
                default:   
            }
            drawGroup(gd, g);
            opc = menu(kbd);            
        } 
    } 
    
    /**
     * Muestra un menu de opciones por pantalla y
     * lee desde teclado una opcion valida.
     * @param kb Scanner, el teclado.
     * @return int, la opcion valida.
     */
    private static int menu(Scanner kb) {        
        String msg = "======================================\n"
            + "OPCIONES: \n"
            + "   1. Seleccionar el polígono a mover.\n"
            + "   0. Acabar.\n"
            + "   > Introduzca una opción (0/1): ";
        int result = CorrectReading.nextInt(kb, msg, 0, 1);    
        return result;
    }
    
    /**
     * Muestra un submenu de opciones por pantalla y
     * lee desde teclado una opcion valida.
     * @param kb Scanner, el teclado.
     * @return int, la opcion valida.
     */
    private static int submenu(Scanner kb) {        
        String msg = "\n      OPCIONES DE MOVIMIENTO DEL POLIGONO: \n"
            + "         1. Llevarlo al frente.\n"
            + "         2. Llevarlo al fondo.\n"
            + "         3. Trasladarlo.\n"
            + "         4. Eliminarlo.\n"
            + "        > Introduzca una opción (1/2/3/4): ";
        int result = CorrectReading.nextInt(kb, msg, 1, 4); 
        return result;        
    }
    
    /** 
     * Muestra en la salida grafica un grupo de poligonos dado.
     * @param gd Graph2D, el grafo.
     * @param p PolygonGroup, el grupo de poligonos.
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
