package pract5;
/**
 * Classe NodePol: representacio d'una estructura que associa 
 * una dada (de tipus Polygon) i l'enllaç a la dada seguent.
 * S'usa per a implementar sequencies enllaçades de poligons.
 *
 * @author PRG - Practica 5
 * @version Curs 2019/20
 */
public class NodePol {
    // COMPLETAR DECLARACIO ATRIBUTS
    
    
    /**
     * Crea un NodePol amb data p i que no te seguent.
     * @param p Polygon, data del nou node.
     */
    public NodePol(Polygon p) {
        data = p;
        // o de manera equivalent: this(p, null);		
    }
    
    /**
     * Crea un NodePol amb data p, enllaçat a un node preexistent n. 
     * @param p Polygon, data del nou node.
     * @param n NodePol, node seguent al que enllaçar el nou node.
     */
    public NodePol(Polygon p, NodePol n) {
        data = p;
        next = n;    
    }
}

    
