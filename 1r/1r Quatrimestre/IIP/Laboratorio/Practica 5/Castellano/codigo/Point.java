package pract5;

/**  
 *  Clase Point: clase "tipo de datos" que define un punto en el plano 
 *  cartesiano, determinado por sus coordenadas x e y. 
 *  
 *  @author IIP - Practica 5
 *  @version Curso 2019/20
 */
public class Point {
    // Un Point TIENE...
    
    // (a) Como atributos de clase publicos, las siguientes constantes:
    /* COMPLETAR la definicion de constantes */
     
    
    // (b) Como atributos de instancia privados, las siguientes variables:
    private double x;
    private double y;
   
    // (c) Como metodos publicos, los siguientes:
    /** Crea un Point con abscisa 0.0 y ordenada 0.0. */
    public Point() { }
         
    /** Crea un Point con abscisa px y ordenada py. 
     *  @param px double, la abscisa.
     *  @param py double, la ordenada.
     */
    public Point(double px, double py) { this.x = px; this.y = py; }
  
    /** Devuelve la abscisa del Point this. 
     *  @return double, la abscisa.      
     */
    public double getX() { return this.x; }
    
    /** Devuelve la ordenada del Point this.
     *  @return double, la ordenada.
     */
    public double getY() { return this.y; }

    /** Actualiza la abscisa del Point this a px.
     *  @param px double, la nueva abscisa.
     */
    public void setX(double px) { this.x = px; }
    
    /** Actualiza la ordenada del Point this a py. 
     *  @param py double, la nueva ordenada.
     */
    public void setY(double py) { this.y = py; }
    
    /** Devuelve la distancia entre el Point this y otro Point dado.
     *  @param p Point, el otro Point.
     *  @return double, la distancia.
     */
    public double distance(Point p) { 
        double abs = p.x - this.x; double ord = p.y - this.y; 
        return Math.sqrt(abs * abs + ord * ord); 
    }
    
    /** Actualiza la abscisa del Point this a px y la ordenada a py.
     *  @param px double, la nueva abscisa.
     *  @param py double, la nueva ordenada.
     */
    public void move(double px, double py) { 
        this.x = px; this.y = py; 
    }  
    
    /**
     * Comprueba si el Point this es igual a otro Point dado.
     * @param o Object, objeto a comparar con el Point this.
     * @return boolean, true si o es un Point y las coordenadas
     * x e y del Point this coinciden con las del Point dado y 
     * false en caso contrario.
     */
    public boolean equals(Object o) {
        return o instanceof Point 
            && this.x == ((Point) o).x 
            && this.y == ((Point) o).y;        
    }

    /** Devuelve un String que representa el Point this en el  
     *  formato tipico matematico, i.e., (abscisa,ordenada) 
     *  @return String, el resultado.
     */
    public String toString() {
        return "(" + this.x + "," + this.y + ")";      
    }   
   
    /** Dado el rayo que se inicia en this y avanza paralelo al eje X 
     *  en sentido +, comprueba si dicho rayo cruza el segmento de 
     *  recta uv, es decir, pasa por un unico punto del segmento.
     *  @param u Point, punto extremo del segmento de recta uv.
     *  @param v Point, punto extremo del segmento de recta uv.
     *  @return int, entero entre DONT_CROSS (-1), LOW_CROSS (0), 
     *  CROSS (1), HIGH_CROSS (2), segun los casos:
     *  - Si el rayo no cruza el segmento, devuelve DONT_CROSS.
     *  - Si el rayo lo cruza por el extremo mas bajo, devuelve LOW_CROSS.
     *  - Si el rayo lo cruza por un punto entre u y v, devuelve CROSS.
     *  - Si el rayo lo cruza por el extremo mas alto, devuelve HIGH_CROSS.
     */
    public int cross(Point u, Point v) {        
        int cut;
        Point pLow, pHigh;
        /* COMPLETAR: inicializar pLow y pHigh */
        
        /* COMPLETAR: asignar un valor a cut siguiendo el analisis 
         * de casos del boletin */
        
        return cut;
    } 
}
