package pract5;
/**
 * Clase NodePol: representacion de una estructura que asocia 
 * un dato (de tipo Polygon) y el enlace al dato siguiente.
 * Se usa para implementar secuencias enlazadas de poligonos.
 *
 * @author PRG - Practica 5
 * @version Curso 2019/20
 */
public class NodePol {
    // COMPLETAR DECLARACION ATRIBUTOS
    
    
    /**
     * Crea un NodePol con dato p y que no tiene siguiente.
     * @param p Polygon, dato del nuevo nodo.
     */
    public NodePol(Polygon p) {
        data = p; 
        // o de manera equivalente: this(p, null); 
    }
    
    /**
     * Crea un NodePol con dato p, enlazado a un nodo preexistente n. 
     * @param p Polygon, dato del nuevo nodo.
     * @param n NodePol, nodo siguiente al que enlazar el nuevo nodo.
     */
    public NodePol(Polygon p, NodePol n) {
        data = p;
        next = n;    
    }
}