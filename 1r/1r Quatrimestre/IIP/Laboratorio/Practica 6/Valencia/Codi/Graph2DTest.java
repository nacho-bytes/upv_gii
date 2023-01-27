package pract6;

// Importa la classe Graph2D (en el paquet graph2D).
import graph2D.Graph2D;
// Importa la classe Color (en el paquet java.awt) per poder
// canviar els colors dels elements que es representen.
import java.awt.Color;
/**
 * Classe Graph2DTest: prova simple de la classe Graph2D.
 * Dibuixa les funcions Math.sin(x) i Math.sin(x)/x.
 * 
 * @author IIP
 * @version Curs 2019-2020
 */
public class Graph2DTest {
    /** No es poden crear objectes d'aquesta classe. */
    private Graph2DTest() { }    
    
    /** Dibuixar sin(x) i sin(x)/x amb
     *  x en [-1.0 : +PI*4] i f(x) en [-1.10 : +1.10].
     *  Representació mitjançant punts consecutius.
     */    
    public static void test() { 
        // Definir l'interval de valors per a x i per a y
        double xMin = -1.0;
        double xMax = Math.PI * 4;
        double yMin = -1.10;
        double yMax = +1.10;
        // Crear l'espai de dibuix amb les dimensions desitjades
        Graph2D gd1 = new Graph2D(xMin, xMax , yMin, yMax);
        // Calcular l'increment en cada pas de x (delta)                            
        double delta = (xMax - xMin) / Graph2D.INI_WIDTH;  
        // Recorrer cada punt en x, calcular f(x) i dibuixar (x, f(x))
        for (double x = xMin; x <= xMax; x = x + delta) {
            double y = Math.sin(x);
            gd1.drawPoint(x, y, Color.BLUE, 2);
        }
        
        // Canviar la grossaria dels elements a 3 (per defecte es 1)
        gd1.setThickness(3);
        // Canviar el color a GREEN per dibuixar d'ara endavant
        gd1.setForegroundColor(Color.GREEN);
        // Recorrer cada punt en x, calcular f(x) i dibuixar (x, f(x))
        for (double x = xMin; x <= xMax; x = x + delta) {
            double y = Math.sin(x) / x;
            gd1.drawPoint(x, y);            
            // o equivalentment (sense canviar valors abans):
            // gd1.drawPoint(x, y, Color.GREEN, 3);
        }        
    }
}
