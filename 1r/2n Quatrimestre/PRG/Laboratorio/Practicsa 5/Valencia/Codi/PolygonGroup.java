package pract5;
/**
 * Classe PolygonGroup. Grup de poligons en el pla.
 * Els poligons estan en ordre segons la sequencia en que s'afegeixen
 * al grup, de manera que es considera que cada poligon esta mes 
 * amunt en el grup que els poligons anteriors, o dit d'un altra 
 * manera, es superposa als anteriors. 
 * Se supose que l'ordre del grup dona la sequencia en que es dibuixen
 * els poligons, de manera que cadascun es dibuixa per damunt dels
 * anteriors, superposant-se a aquells amb els que solape.
 * 
 * A mes d'afegir poligons al grup, es pot seleccionar un poligon
 * per tal d'eliminar-lo, per traslladar les seues coordenades en el pla, 
 * o per canviar la seua posicio relativa en el grup: portar-lo al davant 
 * (damunt del tot), portar-lo al fons (baix del tot), ...
 * 
 * La manera de seleccionar el poligon a moure en el grup, es donant un
 * punt visible del poligon, es a dir, donant un punt que no pertanya
 * als poligons que apareixen superposats en el dibuix.
 *
 * @author PRG - Practica 5
 * @version Curso 2019/20
 */
public class PolygonGroup {    
    // COMPLETAR DECLARACIO ATRIBUTS
    
    
    /**
     * Crea un grup de 0 poligons.
     */
    public PolygonGroup() {
        // COMPLETAR
    }
    
    /** Torna el numero de poligons del grup,  
     *  es a dir, la talla del grup.
     *  return int, la talla.
     */
    public int getSize() { return size; }
    
    /** Afegeix al grup, damunt del tot, un poligon donat. 
     *  @param pol Polygon, el poligon.
     */
    public void add(Polygon pol) {
        // COMPLETAR        
    }
    
    /** Torna un array amb la sequencia de poligons del grup, 
     *  per ordre des del de mes avall al de mes amunt.
     *  @return Polygon[], l'array.
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
        
    /** Busca en el grup descendentment, de mes amunt
     *  a mes avall, el primer poligon que conte a un 
     *  punt donat, tornant la seua posicio en el grup.
     *  Torna un array de NodePol tal que:
     *  - la component 1 es el node amb el poligon que conte 
     *    a p (null si no n'hi haguera cap)
     *  - la component 0 es el node anterior (null si no esta definit).
	 *  @param p Point, el punt.
     *  @return NodePol[], l'array resultat.
     */
    private NodePol[] search(Point p) {
        // MODIFICAR/COMPLETAR        
        return null;
    }
    
    /** Trasllada en el pla el poligon seleccionat 
     *  pel punt p. Les abscisses i les ordenades 
     *  dels seus vertexs s'incrementen o decrementen  
     *  en dos valors donats. El metode no fa res si no 
     *  hi ha cap poligon que continga a p.
     *  @param p Point, el punt.
     *  @param incX double, l'increment o decrement de les abscisses.
     *  @param incY double, l'increment o decrement de les ordenades.
     */
    public void translate(Point p, double incX, double incY) {
        NodePol[] s = this.search(p);
        NodePol mark = s[1];
        // COMPLETAR            
    }
    
    /** Elimina del grup el poligon seleccionat 
     *  pel punt p. El metode no fa res si no 
     *  hi ha cap poligon que continga a p.
     *  @param p Point, el punt.
     *  @return boolean, true si s'ha eliminat o false en cas contrari.
     */
    public boolean remove(Point p) {       
        NodePol[] s = this.search(p);
        NodePol prevMark = s[0], mark = s[1];
        if (mark != null) {
            // COMPLETAR            
            return true;
        }
        return false;
    }
    
    /** Situa al davant del grup el poligon seleccionat 
     *  pel punt p. El metode no fa res si no 
     *  hi ha cap poligon que continga a p.
     *  @param p Point, el punt.
     */
    public void toFront(Point p) {
        NodePol[] s = this.search(p);
        NodePol prevMark = s[0], mark = s[1];
        if (mark != null) {
            // COMPLETAR            
        }
    }
    
    /** Situa al fons del grup el poligon seleccionat 
     *  pel punt p. El metode no fa res si no 
     *  hi ha cap poligon que continga a p.
     *  @param p Point, el punt.
     */
    public void toBack(Point p) {
        NodePol[] s = this.search(p);
        NodePol prevMark = s[0], mark = s[1];
        if (mark != null) {
             // COMPLETAR            
        }
    }
}
