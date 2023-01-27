package pract5;
/**
 * Clase PolygonGroup. Grupo de poligonos en el plano.
 * Los poligonos estan en orden segun la secuencia en que se añaden
 * al grupo, de manera que se considera que cada poligono esta mas 
 * arriba en el grupo que los poligonos anteriores, o dicho de otro 
 * modo, se superpone a los anteriores. 
 * Se supone que el orden del grupo da la secuencia en que se dibujan
 * los poligonos, de manera que cada uno se dibuja por encima de los
 * anteriores, superponiendose a aquellos con los que solape.
 * 
 * Ademas de añadir poligonos al grupo, se puede seleccionar un poligono
 * para eliminarlo, para trasladar sus coordenadas en el plano, o para
 * cambiar su posicion relativa en el grupo: llevarlo al frente (arriba 
 * del todo), llevarlo al fondo (debajo del todo), ...
 * 
 * La manera de seleccionar el poligono a mover en el grupo, es dando un
 * punto visible del poligono, es decir, dando un punto que no pertenezca
 * a los poligonos que aparecen superpuestos en el dibujo.
 *
 * @author PRG - Practica 5
 * @version Curso 2019/20
 */
public class PolygonGroup { 
    // COMPLETAR DECLARACION DE ATRIBUTOS
    
    
    /**
     * Crea un grupo de 0 poligonos.
     */
    public PolygonGroup() { 
        // COMPLETAR
    }
    
    /** Devuelve el numero de poligonos del grupo,  
     *  esto es, la talla del grupo.
     *  return int, la talla.
     */
    public int getSize() { return size; }
    
    /** Añade al grupo, arriba del todo, un poligono dado.
     *  @param pol Polygon, el poligono.
     */
    public void add(Polygon pol) {
        // COMPLETAR 
    }
    
    /** Devuelve un array con la secuencia de poligonos del grupo, 
     *  por orden desde el de mas abajo al de mas arriba.
     *  @return Polygon[], el array.
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
    
    /** Busca en el grupo descendentemente, de mas arriba
     *  a mas abajo, el primer poligono que contiene a un 
     *  punto dado. Devuelve un array de NodePol tal que:
     *  - la componente 1 es el nodo con el poligono que contiene 
     *    a p (null si no hubiera ninguno)
     *  - la componente 0 es el nodo anterior (null si no está definido).
     *  @param p Point, el punto.
     *  @return NodePol[], el array resultado.
     */
    private NodePol[] search(Point p) {
         // MODIFICAR/COMPLETAR
        return null;
    }
    
    /** Traslada en el plano el poligono seleccionado 
     *  mediante el punto p. Las abscisas y las ordenadas 
     *  de sus vertices se incrementan o decrementan en dos 
     *  valores dados. El metodo no hace nada si no 
     *  hay ningun poligono que contenga a p.
     *  @param p Point, el punto.
     *  @param incX double, el incremento o decremento de las abscisas.
     *  @param incY double, el incremento o decremento de las ordenadas.
     */
    public void translate(Point p, double incX, double incY) {
        NodePol[] s = search(p);
        NodePol mark = s[1];
        // COMPLETAR
    }
    
    /** Elimina del grupo el poligono seleccionado 
     *  mediante el punto p. El metodo no hace nada si no 
     *  hay ningun poligono que contenga a p.
     *  @param p Point, el punto.
     *  @return boolean, true si se ha eliminado o false en caso contrario.
     */
    public boolean remove(Point p) {
        NodePol[] s = search(p);
        NodePol prevMark = s[0], mark = s[1];        
        if (mark != null) {
            // COMPLETAR
            return true;
        }
        return false;
    }
    
    /** Situa al frente del grupo el poligono seleccionado 
     *  mediante el punto p. El metodo no hace nada si no 
     *  hay ningun poligono que contenga a p.
     *  @param p Point, el punto.
     */
    public void toFront(Point p) {
        NodePol[] s = search(p);
        NodePol prevMark = s[0], mark = s[1];
        if (mark != null) { 
            // COMPLETAR
        }
    }
    
    /** Situa al fondo del grupo el poligono seleccionado 
     *  mediante el punto p. El metodo no hace nada si no 
     *  hay ningun poligono que contenga a p.
     *  @param p Point, el punto.
     */
    public void toBack(Point p) {
        NodePol[] s = search(p);
        NodePol prevMark = s[0], mark = s[1];
        if (mark != null) { 
            // COMPLETAR
        }    
    }
}
