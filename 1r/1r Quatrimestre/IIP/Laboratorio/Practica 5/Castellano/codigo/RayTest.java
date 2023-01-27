package pract5;

import graph2D.Graph2D;
import java.awt.Color;
import java.util.Scanner;
/**
 * Clase RayTest: clase "programa" que comprueba si el metodo cross 
 * de la clase Point es correcto. 
 * 
 * @author IIP - Practica 5
 * @version Curso 2019/20
 */
public class RayTest {
    /** No hay objetos de esta clase. */
    private RayTest() { }
   
    /** Metodo principal */
    public static void main(String[] args) {              
        // Puntos a testear:
        Point p1 = new Point(-1, 18), p2 = new Point(2, 16),
            p3 = new Point(-4, 10), p4 = new Point(14, 7), 
            p5 = new Point(1, 0), p6 = new Point(-5, -6);
        
        // Vertices de los segmentos:        
        Point vert1 = new Point(3.0, 16.0), 
            vert2 = new Point(3.0, 0.0), 
            vert3 = new Point(17.0, 0.0);
        
        // SALIDA ESTANDAR    
        // CASO 1:
        int c = p1.cross(vert2, vert3);
        System.out.println("  Cruce del segmento " + vert2 + " a " + vert3
            + " desde " + p1 + " : " + crossToString(c));
        
        /* Escoger un ejemplo de cada caso, probarlo y 
         * escribir el resultado en la salida estandar */
        // CASO 2:
        /* COMPLETAR */
        
        // CASO 3:
        /* COMPLETAR */
        
        // CASO 4:
        /* COMPLETAR */
        
        // CASO 5:
        /* COMPLETAR */
        
        
        // SALIDA GRAFICA    
        // Creacion del espacio de dibujo:  
        Graph2D gd = new Graph2D(-20, 20, -20, 20, 600, 600,
            Color.WHITE, "TEST RAYO");            
        
        // Dibujo de los segmentos usados en los casos de prueba:
        gd.drawLine(vert2.getX(), vert2.getY(), vert3.getX(), vert3.getY(), Color.RED, 3); 
        /* COMPLETAR */
        
        // Dibujo de los puntos y sus rayos, usados en los casos de prueba:
        drawRay(gd, p1);
        /* COMPLETAR */
              
    }  
    
    
    /** Devuelve un String que indica el cruzamiento correspondiente al entero c 
     *  de entre los 4 posibles (DONT_CROSS, LOW_CROSS, CROSS y HIGH_CROSS). */
    private static String crossToString(int c) {
        String res = "";
        /* COMPLETAR: dar el valor a res mediante un switch
         * que haga uso de las constantes definidas en Point */
        
        return res;
    }
    
    /** Dibuja en el espacio de dibujo gd el Point p y su rayo. */
    private static void drawRay(Graph2D gd, Point p) {
        gd.drawPoint(p.getX(), p.getY(), Color.BLACK, 4);
        gd.drawLine(p.getX(), p.getY(), 20, p.getY(), Color.GREEN, 1);
    }
}
