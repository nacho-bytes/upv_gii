package pract1; 
 
// Importa la classe Graph2D (en el paquet graph2D).
import graph2D.Graph2D;
// Importa la classe Color (en el paquet java.awt) per a poder
// canviar els colors dels elements que es representen.
import java.awt.Color;
import java.awt.Font;
/**
 * Dibuix de figures "Recursive Square".
 * De "Introduction to Programming in Java",
 * Sedgewick & Wayne, Princeton.
 * @author IIP-PRG-DSIC-ETSINF. pmarques
 * @version Curs 2018-19
 */
public class RSquare {
    
    /** No hi ha objectes d'aquesta classe. */
    private RSquare() { }
    
    /** Dibuixa en la finestra gd un quadrat solid de color gris i enmarcat
     *  en blau, amb centre en (cX, cY) i costat l.
     */
    public static void drawCentSquare(Graph2D gd, 
                                      double cX, double cY, double l) {
        delay();                                           
        // Calcul del canto superior esquerre (luX, luY) del quadrat
        // a partir del seu centre (cX, cY) i del costat l:
        double luX =           ; // COMPLETAR 
        double luY =           ; // COMPLETAR 
        
        // Dibuix d'un rectangle solid de color gris, de costats l x l,  
        // i del que el canto superior esquerre es troba en (luX, luY):
        gd.fillRect(luX, luY, l, l, Color.LIGHT_GRAY, 2);
        // Dibuix d'un rectangle de color blau, de costats l x l, 
        // i del que el canto superior esquerre es troba en (luX, luY):
        gd.drawRect(luX, luY, l, l, Color.BLUE, 2);
    }
    
    /** Suspen temporalment l'execucio durant 100 ms. */
    private static void delay() {
        try { Thread.sleep(100); } catch (Exception e) { ; }
    }
    
    /** Dibuixa en la finestra gd una RSquare-A d'ordre n >= 1, 
     *  amb centre en (cX, cY) i quadrat central de costat l.
     */
    public static void rSquareA(Graph2D gd, int n, 
                                double cX, double cY, double l) {
        // COMPLETAR 
    } 
    
    /** Dibuixa una RSquare-A d'ordre n >= 1, 
     *  longitud 1 i centrada en (0, 0). 
     */
    public static void rSquareA(int n) {
        // COMPLETAR        
    }
    
    /** Dibuixa en la finestra gd una RSquare-B d'ordre n >= 1, 
     *  amb centre en (cX, cY) i quadrat central de costat l.
     */
    public static void rSquareB(Graph2D gd, int n, 
                                double cX, double cY, double l) {
        // COMPLETAR 
    }     
    
    /** Dibuixa una RSquare-B d'ordre n >= 1, 
     *  longitud 1 i centrada en (0, 0).
     */
    public static void rSquareB(int n) {
        // COMPLETAR                  
    }    
}