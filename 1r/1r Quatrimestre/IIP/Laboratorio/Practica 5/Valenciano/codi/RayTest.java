package pract5;

import graph2D.Graph2D;
import java.awt.Color;
import java.util.Scanner;
/**
 * Classe RayTest: classe "programa" que comprova si el metode cross 
 * de la classe Point es correcte. 
 * 
 * @author IIP - Practica 5
 * @version Curs 2019/20
 */
public class RayTest {
    /** No hi ha objectes d'aquesta classe. */
    private RayTest() { }
   
    /** Metode principal */
    public static void main(String[] args) {              
        // Punts a testejar:
        Point p1 = new Point(-1, 18), p2 = new Point(2, 16),
            p3 = new Point(-4, 10), p4 = new Point(14, 7), 
            p5 = new Point(1, 0), p6 = new Point(-5, -6);
        
        // Vertexs dels segments:        
        Point vert1 = new Point(3.0, 16.0), 
            vert2 = new Point(3.0, 0.0), 
            vert3 = new Point(17.0, 0.0);
        
	// EIXIDA ESTANDARD      
        // CAS 1:
        int c = p1.cross(vert2, vert3);
        System.out.println("  Encreuament del segment " + vert2 + " a " + vert3
            + " des de " + p1 + " : " + crossToString(c));
        
	/* Triar un exemple de cada cas, provar-lo i 
         * escriure el resultat a l'eixida estandard */
        // CAS 2:
	/* COMPLETAR */
        
	
        // CAS 3:
	/* COMPLETAR */
        
        
        // CAS 4:
	/* COMPLETAR */
        
        
        // CAS 5:
	/* COMPLETAR */
        
	
        
        // EIXIDA GRAFICA    
        // Creacio de l'espai de dibuix:  
        Graph2D gd = new Graph2D(-20, 20, -20, 20, 600, 600,
            Color.WHITE, "TEST RAIG");            
        
        // Dibuix dels segments usats als casos de prova:
        gd.drawLine(vert2.getX(), vert2.getY(), vert3.getX(), vert3.getY(), Color.RED, 3); 
	/* COMPLETAR */
        
	
        // Dibuix dels punts i els seus raigs, usats als casos de prova:
        drawRay(gd, p1);
	/* COMPLETAR */
                 
    }  
    
    
    /** Torna un String que indica l'encreument corresponent a l'enter c 
     *  d'entre els 4 possibles (DONT_CROSS, LOW_CROSS, CROSS i HIGH_CROSS). */
    private static String crossToString(int c) {
        String res = "";
	/* COMPLETAR: donar el valor a res mijançant un switch
         * que use les constants definides en Point */
        
        return res;
    }
    
    /** Dibuixa a l'espai de dibuix gd el Point p i el seu raig. */
    private static void drawRay(Graph2D gd, Point p) {
        gd.drawPoint(p.getX(), p.getY(), Color.BLACK, 4);
        gd.drawLine(p.getX(), p.getY(), 20, p.getY(), Color.GREEN, 1);
    }
}
