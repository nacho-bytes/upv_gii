package pract5;
/**
 * Class PolygonGroup.
 * This class is used for representing a group of polygons in the plane
 * (two-dimensional space).
 * Polygons are disposed like in a stack, so that the last inserted is
 * on the top, but they will be painted from the bottom to the top.
 * When polygons overlap, the ones which are below others will be
 * partially or totally hidden.
 * 
 * In addition to add polygons to the group, other operations are
 * also implemented: removing a selected polygon, or bringing it
 * to the top or pushing it to the back.
 * 
 * The way for selecting a polygon of the group is by means of the
 * mouse when they are painted in a canvas, so that when the user
 * press the left button of the mouse over a visible part of a polygon,
 * then it is selected. In case of overlap, only the polygon visible
 * at the coordinates of the point selected by the user is the selected
 * polygon, i.e., the first polygon from front to bottom that contains
 * the point selected by the user.
 *
 * @author PRG - Lab practice 5
 * @version Academic year 2019/20
 */
public class PolygonGroup {  
    // ATTRIBUTE DECLARATION: TO BE COMPLETED BY THE STUDENT
    
    
    /**
     * Creates an empty group of polygons.
     */
    public PolygonGroup() { 
        // TO COMPLETE
    }
    
    /** Adds the provided polygon at the top of the group.
     *  @param pol Polygon, a polygon.
     */
    public void add(Polygon pol) {
        // TO COMPLETE
    }
    
    /** Returns the number of polygons in the group.
     *  return int, the size.
     */
    public int getSize() { return size; }
    
    /** Returns an array with the sequence of polygons in the group.
     *  The first polygon in the array will be the one at the bottom,
     *  and the last  one the polygon at the top.
     *  @return Polygon[], the array.
     */
    public Polygon[] toArray() {
        Polygon[] result = new Polygon[size];
        NodePol aux = front;
        for (int i = size - 1; i >= 0; i--) {
            result[i] = aux.data;
            aux = aux.next;
        }
        return result;
    } 
    
        /** Search the first polygon which contains
     *  the point provided as input parameter.
     *  This method returns an array with two elements:
     *   - the first one (position 0) is the previous node
     *     in the linked sequence, it could be null if the
     *     node containing the point is the first one, i.e. is at the top.
     *   - the second one (position 1) is the node with the
     *     polygon containing the point, or null if no polygons
     *     contain the point.
     *  @param p Point, the point in the two-dimensional space.
     *  @return NodePol[], the array with two references to objects of the class Polygon.
     */
    private NodePol[] search(Point p) {
        // TO MODIFY/COMPLETE
        return null;
    }
    
    /** Changes the location of the polygon selected by the point p
     *  in the plane (two-dimensional space).
     *  x and y coordinates are modified according to the values
     *  provided, one for the x-axis (incX) and another one for
     *  the y-axis (incY).
     *  This method does nothing if any polygon contains the point.
     *  @param p Point, the point in the two-dimensional space.
     *  @param incX double, el incremento o decremento de las abscisas.
     *  @param incY double, el incremento o decremento de las ordenadas.
     */
    public void translate(Point p, double incX, double incY) {
        NodePol[] s = search(p);
        NodePol mark = s[1];
        // TO COMPLETE
    }
    
    /** Removes a polygon from the group.
     *  The polygon to be removed is the first one from the top
     *  which contains the provided point as input parameter.
     *  This method does nothing if the provided polygon is not
     *  in the group.
     *  @param p Point, the point in the two-dimensional space.
     *  @return boolean, true if the polygon is removed, otherwise false.
     */
    public boolean remove(Point p) {
        NodePol[] s = search(p);
        NodePol prevMark = s[0], mark = s[1];        
        if (mark != null) {
            // TO COMPLETE
            return true;
        }
        return false;
    }
    
    /** Moves the selected polygon to the front of the group,
     *  i.e. to the top.
     *  This method does nothing if any polygon contains the point.
     *  @param p Point, the point in the two-dimensional space.
     */
    public void toFront(Point p) {
        NodePol[] s = search(p);
        NodePol prevMark = s[0], mark = s[1];
        if (mark != null) { 
            // TO COMPLETE
        }
    }
    
    /** Moves the selected polygon to the bottom of the group.
     *  This method does nothing if any polygon contains the point.
     *  @param p Point, the point in the two-dimensional space.
     */
    public void toBack(Point p) {
        NodePol[] s = search(p);
        NodePol prevMark = s[0], mark = s[1];
        if (mark != null) { 
            // TO COMPLETE
        }    
    }
}