package pract1;

// Importa la clase Graph2D (en el paquete graph2D).
import graph2D.Graph2D;
// Importa la clase Color (en el paquete java.awt) para poder
// cambiar los colores de los elementos que se representen.
import java.awt.Color;
import java.awt.Font;
/**
 * La clase FigRecSimple incluye los elementos basicos
 * para dibujar una figura recursivamente.
 * 
 * @author PRG-DSIC-ETSINF, pmarques 
 * @version Curso 2018-19
 */
public class FigRecSimple {
    
    /** No hay objetos de esta clase. */
    private FigRecSimple() { }

    /**
     * Dibuja una serie de cuadrados incluidos unos en
     * otros. El numero de cuadrados viene dado por el
     * numero ordIni.    
     * @param ordIni int, numero de cuadrados que se dibujan.
     * PRECONDICION: ordIni >= 0
     */
    public static void figRec(int ordIni) {
        // Titulo de la ventana donde se dibuja:
        String tit = "Cuadrados anidados 1. Orden: " + ordIni;

        // Dimensiones del espacio de dibujo en coords. reales:
        double minX = -0.1, maxX = 1.1;
        double minY = -0.1, maxY = 1.1;
        
        Graph2D gd = new Graph2D(minX, maxX, minY, maxY);
        gd.setTitle(tit); 
        
        // llamada inicial, lado 1.0 y orden ordIni:
        figRec(gd, ordIni, 1.0);
    }
    
    /**
     * Dibuja un cuadrado de orden ord y lado l.
     * @param g Graph2D, el espacio Graph2D donde se realiza el dibujo.
     * @param ord int, orden (o numero) del cuadrado.
     * @param l double, longitud lado del cuadrado.
     * PRECONDICION: ord >= 0 
     */
    private static void figRec(Graph2D g, int ord, double l) {
        // caso base: ord == 0, no se hace nada
        // caso general: ord > 0
        if (ord >= 1) {
            // Los cuadrados tienen su extremo superior
            // izquierdo en (0.0, 1.0). 
            // Los dibujamos en Negro y con grosor 2:
            g.drawRect(0.0, 1.0, l, l, Color.BLACK, 2);
            
            // Podemos calcular el punto inferior derecho:
            double xID = l, yID = 1.0 - l;
            // y dibujamos la String con el orden en Azul:
            g.setForegroundColor(Color.BLUE);            
            g.drawString(xID, yID, " " + ord);
            delay();
            // cada nuevo cuadrado tiene su lado un 10% menor
            // que el anterior, esto es: l * 0.9:
            figRec(g, ord - 1, l * 0.9);
        }
    }           
    
    /** Suspende temporalmente la ejecucion durante 300 ms. */
    private static void delay() {
        try { Thread.sleep(300); } catch (Exception e) { ; }
    }
}
