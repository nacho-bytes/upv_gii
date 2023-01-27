package pract7;

import java.awt.Color;
import pract5.Point;
/**
 * Class Polygon. Colour-solid filled polygons represented on the plane
 * (two-dimensional space) and defined by a sequence of vertex.
 * 
 * @author IIP - Lab practice 7
 * @version Academic year 2019/20
 */
public class Polygon {    
    /* TO COMPLETE: private attributes (instance variables) */

    /**
     * Creates a polygon from two arrays, an array <code>x</code>
     * containing the abscissas of the vertices, and a second
     * array <code>y</code> containing the ordinates of the vertices.
     * Polygons are defined by the sequence of sides (segments) defined
     * by each pair of consecutive vertices. There is an implicit side
     * from the last vertex to the first one.
     * The default colour for polygons is blue (Color.BLUE).
     * @param x double[], las abscissas.
     * @param y double[], las ordinates.
     */
    public Polygon(double[] x, double[] y) {
        /* TO COMPLETE */
    }

    /** Returns the abscissas of the vertices of the polygon.
     *  @return double[], abscissas of the vertices.
     */
    public double[] verticesX() {
        /* TO COMPLETE */
    }
    
    /** Returns the ordinates of the vertices of the polygon.
     *  @return double[], ordinates of the vertices. 
     */
    public double[] verticesY() {
        /* TO COMPLETE */ 
    }
    
    /** Returns the colour of the polygon.
     *  @return Color, the colour. 
     */
    public Color getColor() { /* TO COMPLETE */ }
    
    /** Updates the colour of the polygon.
     *  @param nC Color, the new colour.
     */
    public void setColor(Color nC) { /* TO COMPLETE */ }
        
    /** Returns the perimeter of the polygon.
     *  @return double, perimeter.
     */
    public double perimeter() {
        /* TO COMPLETE */
    }   
    
    /** Moves the vertex of the polygon:
     *  incX for x-axis and incY for y-axis.
     *  @param incX double, the offset to shift in the x-axis.
     *  @param incY double, the offset to shift in the y-axis.
     */
    public void translate(double incX, double incY) {
        /* TO COMPLETE */ 
    }
          
    /** Checks if <code>Point p</code> is inside the polygon.
     *  PRECONDITION: <code>p</code> is not over any of of the sides of the polygon.
     *  Returns <code>true</code> if <code>p</code> is inside the polygon, 
     *  otherwise <code>false</code>.
     *  @param p Point, the point.
     *  @return boolean, <code>true</code> if the point is inside the polygon, 
     *  otherwise <code>false</code>.
     */
    public boolean inside(Point p) {
        /* TO COMPLETE */
    } 
}
