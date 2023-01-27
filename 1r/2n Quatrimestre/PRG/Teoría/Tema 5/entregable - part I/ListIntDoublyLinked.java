package linear;
/**
 * Classe ListIntDoublyLinked: implementació d'una llista doblement
 * enllaçada, de manera que cada node té una referència tant al node
 * següent com al node anterior.
 * 
 * @author PRG - Activitat de reforç
 * @version Curs 2019/20
 */
public class ListIntDoublyLinked {
    private NodeIntDouble first, last; // referències al primer i últim nodes
    private int size;                  // número d'elements de la llista

    /** Crea una llista buida. */
    public ListIntDoublyLinked() {
        /* COMPLETAR */
    }

    /** Insereix un nou node amb l'element x en el cap de la llista,
     *  és a dir, el nou node serà el primer de la llista.
     *  @param x int a afegir en la llista.
     */
    public void inserir(int x) {
        /* COMPLETAR */
    }

    /** Insereix un nou node amb l'element x al final de la llista,
     *  és a dir, el nou node serà l'últim de la llista.
     *  @param x int a afegir en la llista.
     */
    public void inserirFi(int x) {
        /* COMPLETAR */
    }

    /** Esborra, si existeix, el primer node de la llista. */
    public void esborrarIni() {
        /* COMPLETAR */
    }
    
    /** Esborra, si existeix, el darrer node de la llista. */
    public void esborrarFi() {
        /* COMPLETAR */
    }  
    
    /** Esborra, si existeix, la primera ocurrència d'una
     *  dada donada. Si no existeix, no fa res.
     *  @param x int a esborrar de la llista.
     */
    public void esborrar(int x) {
        /* COMPLETAR */
    }  
    
    /** Obté un String amb totes les dades de la llista en
     *  sentit ascendent (des del primer node fins l'últim).
     *  Si la llista està buida, torna la cadena buida.
     *  Exemple: si les dades son 2, 15 i 8, el String 
     *  resultat sera "2 15 8 "
     *  @return String, resultat.
     */
    public String toString() {
        String str = "";
        /* COMPLETAR */
        return str;
    }

    /** Obté un String amb totes les dades de la llista en
     *  sentit descendent (des de l'últim node fins el primer).
     *  Si la llista està buida, torna la cadena buida.
     *  Exemple: si les dades son 2, 15 i 8, el String 
     *  resultat sera "8 15 2 "
     *  @return String, resultat.
     */
    public String toStringDescendent() {
        String str = "";
        /* COMPLETAR */
        return str;
    }   
    
}