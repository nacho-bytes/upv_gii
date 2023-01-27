package pract5;

/**  
 *  Classe Point: classe "tipus de dades" que defineix un punt al pla 
 *  cartesia, determinat per les seues coordenades x i y. 
 *  
 *  @author IIP - Practica 5
 *  @version Curs 2019/20
 */
public class Point {
    // Un Point TE...
    
    // (a) Com atributs de classe publics, les seguents constants:
    /* COMPLETAR la definicio de constants */
     
    
    // (b) Com atributs d'instancia privats, les seguents variables:
    private double x;
    private double y;
   
    // (c) Com metodes publics, els seguents:
    /** Crea un Point amb abscissa 0.0 i ordenada 0.0. */
    public Point() { }
         
    /** Crea un Point amb abscissa px i ordenada py. 
     *  @param px double, l'abscissa.
     *  @param py double, l'ordenada.
     */
    public Point(double px, double py) { this.x = px; this.y = py; }
  
    /** Torna l'abscissa del Point this. 
     *  @return double, l'abscissa.      
     */
    public double getX() { return this.x; }
    
    /** Torna l'ordenada del Point this.
     *  @return double, l'ordenada.
     */
    public double getY() { return this.y; }

    /** Actualitza l'abscissa del Point this a px.
     *  @param px double, la nova abscissa.
     */
    public void setX(double px) { this.x = px; }
    
    /** Actualitza l'ordenada del Point this a py. 
     *  @param py double, la nova ordenada.
     */
    public void setY(double py) { this.y = py; }
    
    /** Torna la distancia entre el Point this i un altre Point donat.
     *  @param p Point, l'altre Point.
     *  @return double, la distancia.
     */
    public double distance(Point p) { 
        double abs = p.x - this.x; double ord = p.y - this.y; 
        return Math.sqrt(abs * abs + ord * ord); 
    }
    
    /** Actualitza l'abscissa del Point this a px i l'ordenada a py.
     *  @param px double, la nova abscissa.
     *  @param py double, la nova ordenada.
     */
    public void move(double px, double py) { 
        this.x = px; this.y = py; 
    }  
    
    /**
     * Comprova si el Point this es igual a un altre Point donat.
     * @param o Object, objecte a comparar amb el Point this.
     * @return boolean, true si o es un Point i les coordenades
     * x i y del Point this coincideixen amb les del Point donat i 
     * false en cas contrari.
     */
    public boolean equals(Object o) {
        return o instanceof Point 
            && this.x == ((Point) o).x 
            && this.y == ((Point) o).y;        
    }

    /** Torna un String que representa el Point this en el  
     *  formato tipic matematic, i.e., (abscissa,ordenada) 
     *  @return String, el resultat.
     */
    public String toString() {
        return "(" + this.x + "," + this.y + ")";      
    }   
   
    /** Donat el raig que s'inicia en this i avança paral.lel a l'eix X
     *  en sentit +, comprova si aquest raig creua el segment de 
     *  recta uv, es a dir, passa per un unic punt del segment.
     *  @param u Point, punt extrem del segment de recta uv.
     *  @param v Point, punt extrem del segment de recta uv.
     *  @return int, enter entre DONT_CROSS (-1), LOW_CROSS (0), 
     *  CROSS (1), HIGH_CROSS (2), segons els casos:
     *  - Si el raig no creua el segment, torna DONT_CROSS.
     *  - Si el raig el creua per l'extrem mes baix, torna LOW_CROSS.
     *  - Si el raig el creua per un punt entre u i v, torna CROSS.
     *  - Si el raig el creua per l'extrem mes alt, torna HIGH_CROSS.
     */
    public int cross(Point u, Point v) {        
        int cut;
        Point pLow, pHigh;
        /* COMPLETAR: inicialitzar pLow i pHigh */
        
        /* COMPLETAR: assignar un valor a cut seguint l'analisi 
         * de casos del butlleti */
        
        return cut;
    } 
}
