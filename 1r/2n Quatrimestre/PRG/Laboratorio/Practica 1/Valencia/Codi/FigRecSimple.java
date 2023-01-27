package pract1;

// Importa la classe Graph2D (en el paquet graph2D).
import graph2D.Graph2D;
// Importa la classe Color (en el paquet java.awt) per poder
// canviar els colors dels elements que es representen.
import java.awt.Color;
import java.awt.Font;
/**
 * La classe FigRecSimple inclou els elements basics
 * per tal de dibuixar una figura recursivament.
 * 
 * @author PRG-DSIC-ETSINF, pmarques 
 * @version Curs 2018-19
 */
public class FigRecSimple {
    
    /** No hi ha objectes d'aquesta classe. */
    private FigRecSimple() { }

    /**
     * Dibuixa una serie de quadrats inclosos uns en
     * altres. El numero de quadrats ve donat pel
     * numero ordIni.    
     * @param ordIni int, numero de quadrats que es dibuixen.
     * PRECONDICIO: ordIni >= 0
     */
    public static void figRec(int ordIni) {
        // Titol de la finestra on es dibuixa:
        String tit = "Quadrats niuats 1. Ordre: " + ordIni;

        // Dimensions de l'espai de dibuix en coords. reals:
        double minX = -0.1, maxX = 1.1;
        double minY = -0.1, maxY = 1.1;
        
        Graph2D gd = new Graph2D(minX, maxX, minY, maxY);
        gd.setTitle(tit); 
        
        // crida inicial, costat 1.0 i ordre ordIni:
        figRec(gd, ordIni, 1.0);
    }
    
    /**
     * Dibuix un quadrat d'ordre ord i costat l.
     * @param g Graph2D, l'espai Graph2D on es fa el dibuix.
     * @param ord int, ordre (o numero) del quadrat.
     * @param l double, longitud del costat del quadrat.
     * PRECONDICIO: ord >= 0 
     */
    private static void figRec(Graph2D g, int ord, double l) {
        // cas base: ord == 0, no es fa res
        // cas general: ord > 0
        if (ord >= 1) {
            // Els quadrats tenen el seu extrem superior
            // esquerre en (0.0, 1.0). 
            // Els dibuixem en Negre i amb amplaria 2:
            g.drawRect(0.0, 1.0, l, l, Color.BLACK, 2);
            
            // Podem calcular el punt inferior dret:
            double xID = l, yID = 1.0 - l;
            // i dibuixem la String amb l'ordre en Blau:
            g.setForegroundColor(Color.BLUE);            
            g.drawString(xID, yID, " " + ord);
            delay();
            // cada nou quadrat te el seu costat un 10% menor
            // que l'anterior, aço es: l * 0.9:
            figRec(g, ord - 1, l * 0.9);
        }
    }           
    
    /** Suspen temporalment l'execucio durant 300 ms. */
    private static void delay() {
        try { Thread.sleep(300); } catch (Exception e) { ; }
    }
}
