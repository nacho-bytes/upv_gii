package pract7;

import pract5.Point;
/**
 * Class </code>PolygonGroup</code> for representing groups of polygons
 * defined on the plane.
 * Polygons are stored in the same order they were addted to the group.
 * First added polygon will be at position 0 of the internal array, the one
 * added after the first one at position 1, and so on.
 * Oldest polygon will be painted the first one, at the bottom,
 * the newest polygon will be painted the last one, at the top.
 * In case of overlap when a polygon is painted will hide those parts of
 * the overlapping polygons painted previously.
 *
 * Polygons in the group can be added, removed, moved forwards,
 * moved backwards, sent to the back or brought to the top.
 * 
 * The way a polygon is selected is by means of a point inside it.
 * In case of overlapped polygons, it is assumed the provided point
 * selects the polygon which is on the top of all the polygons this
 * point is inside.
 *
 * @author IIP - Lab practice 7
 * @version Academic year 2019/20
 */
public class PolygonGroup {    
    /* TO COMPLETE: public constant (class attribute) */
    
    /* TO COMPLETE: private attributes (instance variables) */
    
    /**
     * Creates an empty group of polygons.
     */
    public PolygonGroup() {
        /* TO COMPLETE */
    }
    
    /** Adds on the top a given polygon.
     *  If no free slots are available, the polygon is not added. 
     *  @param pol Polygon, the polygon to be added.
     *  @return boolean, true if the polygon is added, otherwise false.
     */
    public boolean add(Polygon pol) {
        /* TO COMPLETE */
    }
    
    /** Returns the number of polygons in the group,
     *  i.e., the size of the group.
     *  return int, the size of the group of polygons.
     */
    public int getSize() { /* TO COMPLETE */ }
    
    /** Removes from the group the polygon selected by the point <code>p</code>.
     *  If <code>p</code> is not inside any polygon, then this method does not
     *  change the group.
     *  @param p Point, a point.
     *  @return boolean, true if the polygon is removed, otherwise false.
     */
    public boolean remove(Point p) {
        /* TO COMPLETE */
    }
    
    /** 
     *  Searches in the group the first polygon containing the point
     *  from the top to the bottom, that is, the search is performed
     *  in descending order inside the array.
     *  This method returns the positon in the array of the selected
     *  polygon. Or <code>-1</code> in the case the point is not inside
     *  any polygon of the group.
     *  @param Point p, a point.
     *  @return int, position in the array of the selected polygon
     *               from the group, or <code>-1</code> the point passed
     *               as parameter is not inside any polygon of this group.
     */
    private int search(Point p) {
        /* TO COMPLETE */
    }
    
    /** 
     *  Moves to the top the polygon selected by the point </code>p</code>.
     *  Or does not do anything if any polygon is selected by the point.
     *  @param p Point, a point.
     */
    public void toFront(Point p) {
        /* TO COMPLETE */
    }
    
    /** 
     *  Moves to the bottom the polygon selected by the point </code>p</code>.
     *  Or does not do anything if any polygon is selected by the point.
     *  @param p Point, a point.
     */
    public void toBack(Point p) {
        /* TO COMPLETE */
    }
    
    /** 
     *  Moves the polygon selected by point <code>p</code> from one
     *  position to another in the plane.
     *  Every vertex of the polygon is moved by means of <code>incX</code>
     *  and <code>incY</code>.
     *  This method does nothing if the point <code>p</code> is not inside
     *  any of the polygons.
     *  @param p Point, a point
     *  @param incX double, offset for x-axis.
     *  @param incY double, offset ofr y-axis.
     */
    public void translate(Point p, double incX, double incY) {
        /* TO COMPLETE */
    }
    
    /** 
     *  Returns an array with the sequence of polygons in the group,
     *  polygons are disposed from the bottom to the top.
     *  @return Polygon[], the array.
     */
    public Polygon[] toArray() {
        /* TO COMPLETE */
    } 
}
