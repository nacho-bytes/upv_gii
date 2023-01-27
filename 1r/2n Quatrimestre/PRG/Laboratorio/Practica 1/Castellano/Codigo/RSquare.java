package pract1; 
 
// Importa la classe Graph2D (en el paquete graph2D).
import graph2D.Graph2D;
// Importa la classe Color (en el paquete java.awt) para poder
// cambiar los colores de los elementos que se representen.
import java.awt.Color;
import java.awt.Font;
/**
 * Dibujo de figuras "Recursive Square".
 * De "Introduction to Programming in Java",
 * Sedgewick & Wayne, Princeton.
 * @author IIP-PRG-DSIC-ETSINF. pmarques
 * @version Curso 2018-19
 */
public class RSquare {
    
    /** No hay objetos de esta clase. */
    private RSquare() { }
    
    /** Dibuja en la ventana gd un cuadrado solido de color gris y enmarcado
     *  en azul, con centro en (cX, cY) y lado l.
     */
    public static void drawCentSquare(Graph2D gd, 
                                      double cX, double cY, double l) {
        delay();                                           
        // Calculo de la esquina superior izquierda (luX, luY) del cuadrado
        // a partir de su centro (cX, cY) y del lado l:
        double luX =           ; // COMPLETAR
        double luY =           ; // COMPLETAR
        
        // Dibujo de un rectangulo solido de color gris, de lados l x l, 
        // y cuya esquina superior izquierda se encuentra en (luX, luY):
        gd.fillRect(luX, luY, l, l, Color.LIGHT_GRAY, 2);
        // Dibujo de un rectangulo de color azul, de lados l x l, 
        // y cuya esquina superior izquierda se encuentra en (luX, luY):
        gd.drawRect(luX, luY, l, l, Color.BLUE, 2);
    }
    
    /** Suspende temporalmente la ejecucion durante 100 ms. */
    private static void delay() {
        try { Thread.sleep(100); } catch (Exception e) { ; }
    }
    
    /** Dibuja en la ventana gd una RSquare-A de orden n >= 1, 
     *  con centro en (cX, cY) y cuadrado central de lado l.
     */
    public static void rSquareA(Graph2D gd, int n, 
                                double cX, double cY, double l) {
        // COMPLETAR
    } 
    
    /** Dibuja una RSquare-A de orden n >= 1, 
     *  longitud 1 y centrada en (0, 0). 
     */
    public static void rSquareA(int n) {
        // COMPLETAR  
    }
    
    /** Dibuja en la ventana gd una RSquare-B de orden n >= 1, 
     *  con centro en (cX, cY) y cuadrado central de lado l.
     */
    public static void rSquareB(Graph2D gd, int n, 
                                double cX, double cY, double l) {
        // COMPLETAR
    }     
    
    /** Dibuja una RSquare-B de orden n >= 1, 
     *  longitud 1 y centrada en (0, 0). 
     */
    public static void rSquareB(int n) {
        // COMPLETAR                
    }    
}