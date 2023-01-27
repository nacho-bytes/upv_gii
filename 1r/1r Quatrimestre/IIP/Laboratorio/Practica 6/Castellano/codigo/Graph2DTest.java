package pract6;

// Importa la clase Graph2D (en el paquete graph2D).
import graph2D.Graph2D;
// Importa la clase Color (en el paquete java.awt) para poder
// cambiar los colores de los elementos que se representen.
import java.awt.Color;
/**
 * Clase Graph2DTest: prueba simple de la clase Graph2D.
 * Dibuja las funciones Math.sin(x) y Math.sin(x)/x.
 * 
 * @author IIP
 * @version Curso 2019-2020
 */
public class Graph2DTest {
    /** No se pueden crear objetos de esta clase. */
    private Graph2DTest() { }    
    
    /** Dibujar sen(x) y sen(x)/x con
     *  x en [-1.0 : +PI*4] y f(x) en [-1.10 : +1.10].
     *  Representación mediante puntos consecutivos.
     */    
    public static void test() { 
        // Definir el intervalo de valores para x y para y
        double xMin = -1.0;
        double xMax = Math.PI * 4;
        double yMin = -1.10;
        double yMax = +1.10;
        // Crear el espacio de dibujo con las dimensiones deseadas
        Graph2D gd1 = new Graph2D(xMin, xMax , yMin, yMax);
        // Calcular el incremento en cada paso de x (delta)                            
        double delta = (xMax - xMin) / Graph2D.INI_WIDTH;  
        // Recorrer cada punto en x, calcular f(x) y dibujar (x, f(x))
        for (double x = xMin; x <= xMax; x = x + delta) {
            double y = Math.sin(x);
            gd1.drawPoint(x, y, Color.BLUE, 2);
        }
        
        // Cambiar el grosor de los elementos a 3 (por defecto es 1)
        gd1.setThickness(3);
        // Cambiar el color a GREEN para dibujar de ahora en adelante
        gd1.setForegroundColor(Color.GREEN);
        // Recorrer cada punto en x, calcular f(x) y dibujar (x, f(x))
        for (double x = xMin; x <= xMax; x = x + delta) {
            double y = Math.sin(x) / x;
            gd1.drawPoint(x, y);            
            // o equivalentmente (sin cambiar valores antes):
            // gd1.drawPoint(x, y, Color.GREEN, 3);
        }        
    }
}
