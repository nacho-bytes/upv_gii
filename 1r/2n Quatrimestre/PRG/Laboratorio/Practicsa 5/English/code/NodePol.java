package pract5;
/**
 * Class NodePol for mantaining objects of the
 * class Polygon in a linked sequence.
 * Each object of this class has a reference to
 * a polygon and a reference to the next node
 * in the linked sequence.
 *
 * @author PRG - Lab practice 5
 * @version Academic year 2019/20
 */
public class NodePol {
    // ATTRIBUTE DECLARATION: TO BE COMPLETED BY THE STUDENT

    
    /**
     * Creates an object of the class NodePol with a polygon
     * reference by <code>p</code> and without next node.
     * @param p Polygon, reference to a polygon (object of the class Polygon).
     */
    public NodePol(Polygon p) {
        data = p; 
        // The body of this method could be just: this(p, null); 
    }
    
    /**
     * Creates an object of the class NodePol with a polygon
     * referenced by <code>p</code> and the reference to the next node.
     * @param p Polygon, reference to a polygon (object of the class Polygon).
     * @param n NodePol, reference to the next node in the linked sequence.
     */
    public NodePol(Polygon p, NodePol n) {
        data = p;
        next = n;    
    }
}
