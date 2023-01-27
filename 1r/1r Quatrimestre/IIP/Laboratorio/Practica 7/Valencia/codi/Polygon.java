package pract7;

import java.awt.Color;
import pract5.Point;
/**
 * Classe Polygon. Poligons solids (d'un determinat color) en el pla,
 * donats per la sequencia dels seus vertexs.
 * 
 * @author IIP - Practica 7
 * @version Curs 2019/20
 */
public class Polygon {    
    /* COMPLETAR la definicio d'atributs d'instancia privats */

    
    /**
     * Construeix un poligon a partir d'un array x amb les
     * abcsisses x0, x1, x2, ..., xn-1 dels seus vertexs, i un array y
     * amb les ordenades y0, y1, y2, ... yn-1 dels seus vertexs, n > 0.
     * Els vertexs defineixen un poligon els costats del qual s'extenen  
     * d'un vertex al seguent, i tancant-se en (x0,y0).
     * Per defecte, el poligon es de color blau (Color.BLUE).
     * @param x double[], les abscisses.
     * @param y double[], les ordenades.
     */
    public Polygon(double[] x, double[] y) {
        /* COMPLETAR */
    }

    /** Torna les abscisses dels vertexs del poligon. 
     *  @return double[], les abscisses dels vertexs.
     */
    public double[] verticesX() {
        /* COMPLETAR */  
    }
    
    /** Torna les ordenades dels vertexs del poligon.
     *  @return double[], les ordenades dels vertexs. 
     */
    public double[] verticesY() {
        /* COMPLETAR */   
    }
    
    /** Torna el color del poligon.
     *  @return Color, el color. 
     */
    public Color getColor() { /* COMPLETAR */ }
    
    /** Actualitza el color del poligon a un color donat.
     *  @param nC Color, el nou color.
     */
    public void setColor(Color nC) { /* COMPLETAR */ }
        
    /** Torna el perimetre del poligon.
     *  @return double, el perimetre.
     */
    public double perimeter() {
        /* COMPLETAR */
    }   
    
    /** Trasllada els vertexs del poligon: 
     *  incX en l'eix X i incY en l'eix Y.
     *  @param incX double, l'increment o decrement en X.
     *  @param incY double, l'increment o decrement en Y.
     */
    public void translate(double incX, double incY) {
        /* COMPLETAR */ 
    }
          
    /** Comprova si el Point p es interior al poligon.
     *  PRECONDICIO: p no esta sobre els costats del poligon.
     *  Si el punt es interior al poligon, torna true; 
     *  en cas contrari, torna false.
     *  @param p Point, el punt.
     *  @return boolean, true si el punt es interior o false
     *  si es exterior.
     */
    public boolean inside(Point p) {
        /* COMPLETAR */
    } 
}
