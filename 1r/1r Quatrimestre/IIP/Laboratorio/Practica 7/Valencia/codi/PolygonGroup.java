package pract7;
import pract5.Point;
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
 * @author IIP - Practica 7
 * @version Curs 2019/20
 */
public class PolygonGroup {    
    /* COMPLETAR la definicio de la constant, atribut de classe public */
    
    /* COMPLETAR la definicio d'atributs d'instancia privats */
    
    /**
     * Crea un grup de 0 poligons.
     */
    public PolygonGroup() {
        /* COMPLETAR */
    }
    
    /** Afegeix al grup, damunt del tot, un poligon donat. 
     *  Si s'excedeix la capacitat del grup, el poligon 
     *  no s'afegeix.
     *  @param pol Polygon, el poligon.
     *  @return boolean, true si s'ha afegit o false en cas contrari.
     */
    public boolean add(Polygon pol) {
        /* COMPLETAR */     
    }
    
    /** Torna el numero de poligons del grup,  
     *  es a dir, la talla del grup.
     *  return int, la talla.
     */
    public int getSize() { /* COMPLETAR */ }
    
    /** Elimina del grup el poligon seleccionat 
     *  pel punt p. El metode no fa res si no 
     *  hi ha cap poligon que continga a p.
     *  @param p Point, el punt.
     *  @return boolean, true si s'ha eliminat o false en cas contrari.     
     */
    public boolean remove(Point p) {
        /* COMPLETAR */
    }
    
    /** Busca en el grup descendentment, de mes amunt
     *  a mes avall, el primer poligon que conte a un 
     *  punt donat, tornant la seua posicio en el grup.
     *  Si no existeix, torna -1.
     *  @param Point p, el punt.
     *  @return int, posicio en el grup del poligon que  
     *  conte al punt o -1 si no existeix.
     */
    private int search(Point p) {
        /* COMPLETAR */
    }
    
    /** Situa al davant del grup el poligon seleccionat 
     *  pel punt p. El metode no fa res si no 
     *  hi ha cap poligon que continga a p.
     *  @param p Point, el punt.
     */
    public void toFront(Point p) {
        /* COMPLETAR */
    }
    
    /** Situa al fons del grup el poligon seleccionat 
     *  pel punt p. El metode no fa res si no 
     *  hi ha cap poligon que continga a p.
     *  @param p Point, el punt.
     */
    public void toBack(Point p) {
        /* COMPLETAR */
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
        /* COMPLETAR */
    }
    
    /** Torna un array amb la sequencia de poligons del grup, 
     *  per ordre des del de mes avall al de mes amunt.
     *  @return Polygon[], l'array.
     */
    public Polygon[] toArray() {
        /* COMPLETAR */
    } 
}
