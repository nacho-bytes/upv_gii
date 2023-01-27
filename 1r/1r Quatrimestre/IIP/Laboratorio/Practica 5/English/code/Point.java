package pract5;

/**  
 *  Class Point: data-type class for defining a 2D point in the Cartesian plane
 *  defined by two coordintes: attributes <code>x</code> and <code>y</code>.
 *  
 *  @author IIP - Lab Activity 5
 *  @version Academic Year 2019/20
 */
public class Point {
    // A Point HAS...
    
    // (a) the following constants defined as public and static variables:
    /* TO BE COMPLETED BY STUDENTS: the definition of constants. */
    
    // (b) as attributes the following instance variables:
    private double x;
    private double y;
   
    // (c) and as public methods the following ones:
    /** Default constructor for creating a point located at coordinates (0.0 , 0.0) */
    public Point() { }
         
    /** Generic constructor for creating a point located at coordinates (px , py). 
     *  @param px double, abscissa.
     *  @param py double, ordinate.
     */
    public Point(double px, double py) { this.x = px; this.y = py; }
  
    /** Returns the value of the abscissa: the value of attribute <code>x</code>
     *  @return double, abscissa.
     */
    public double getX() { return this.x; }
    
    /** Returns the value of the ordinate: the value of attribute <code>y</code>
     *  @return double, ordinate.
     */
    public double getY() { return this.y; }

    /** Updates the abscissa.
     *  @param px double, the new value for the abscissa.
     */
    public void setX(double px) { this.x = px; }
    
    /** Updates the ordinate.
     *  @param py double, the new value for the ordinate.
     */
    public void setY(double py) { this.y = py; }
    
    /** Returns the distance between two points, the current one and another one 
     *  passed as parameter.
     *  @param p Point, the other point.
     *  @return double, the distance between <code>this</code> and <code>p</code>.
     */
    public double distance(Point p) { 
        double abs = p.x - this.x;
        double ord = p.y - this.y; 
        return Math.sqrt(abs * abs + ord * ord); 
    }
    
    /** Updates both coordinates: the abscissa and the ordinate.
     *  @param px double, the new value for the abscissa.
     *  @param py double, the new value for the ordinate.
     */
    public void move(double px, double py) { 
        this.x = px;
        this.y = py; 
    }  
    
    /**
     * Checks if the current object of the class <code>Point</code>
     * referenced by <code>this</code> is equal to another point
     * passed as argument but as a generic reference to objects of
     * the class <code>Object</code>.
     * So a checking if the <code>o</code> is really a reference to
     * objects of the class <code>Point</code> must be carried out
     * before accessing the attributes of objects of class <code>Point</code>.
     * 
     * @param o <code>Object</code>, reference to the object to be compared with
     * the current object of the class <code>Point</code> referenced by <code>this</code>.
     * @return <code>boolean</code>, <code>true</code> if <code>o</code> is a reference to
     * objects of the class <code>Point</code> and the values of both coordinates are equal, 
     * otherwise returns <code>false</code>.
     */
    public boolean equals(Object o) {
        return o instanceof Point 
            && this.x == ((Point) o).x 
            && this.y == ((Point) o).y;        
    }

    /** Returns an object of the class <code>String</code> containing a representation of the
     *  current point with the common format (abscissa,ordinate).
     *
     *  @return String, the result.
     */
    public String toString() {
        return "(" + this.x + "," + this.y + ")";      
    }   
   
    /** Given a ray emitted from the current point that is parallel
     *  to the x-axis in the positive sense, this method checks if the
     *  ray goes through the segment represented by two points
     *  <code>u</code> and <code>v</code>, in other words, checks
     *  if the ray intesects with the segment.
     *  
     *  @param u <code>Point</code>, one end of the segment.
     *  @param v <code>Point</code>, the other end of the segment.
     *
     *  @return int, a value indicating one of the possible results:
     *  <ul>
     *    <li> <code>DONT_CROSS = -1</code> if the ray does not go through the segment.</li>
     *    <li> <code>LOW_CROSS  =  0</code> if the ray goes through the lowest point.</li>
     *    <li> <code>CROSS      =  1</code> if the ray goes through the segment 
     *                                      in an intermediate point.</li>
     *    <li> <code>HIGH_CROSS =  2</code> if the ray goes through the highest point.</li>
     *  </ul>
     */
    public int cross(Point u, Point v) {
        int cut = 0;
        Point pLow, pHigh;
        /* TO BE COMPLETED BY STUDENTS: initialization of pLow and pHigh */


        /* TO BE COMPLETED BY STUDENTS: to assign the correct value to local variable cut
           according to the analysis explained in the lab guide. */


        return cut;
    } 
}
