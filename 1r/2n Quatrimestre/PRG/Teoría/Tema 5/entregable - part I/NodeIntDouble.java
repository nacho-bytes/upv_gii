package linear;
/**
 * Classe NodeIntDouble: Representació d'una estructura que associa 
 * una dada (de tipus int), l'enllaç a la dada anterior i l'enllaç 
 * a la dada següent.
 * 
 * @author PRG
 * @version Curs 2019/20
 */
public class NodeIntDouble {
    int data;   // dada del node
    NodeIntDouble next;    // enllaç al següent node
    NodeIntDouble prev;    // enllaç al node anterior

    /** Crea un nou node amb una dada d i que no té
     *  ni anterior ni següent.
     *  @param d int que representa la dada del nou node.
     */
    NodeIntDouble(int d) {
        this(d, null, null);
    }

    /** Crea un nou node amb una dada d, enllaçat a
     *  dos nodes preexistents.
     *  @param d int que representa la dada del nou node.
     *  @param s NodeDobleInt que serà el següent del nou node.
     *  @param a NodeDobleInt que serà l'anterior del nou node.
     */
    NodeIntDouble(int d, NodeIntDouble s, NodeIntDouble a) {
        data = d;  next = s;  prev = a;
    }
}