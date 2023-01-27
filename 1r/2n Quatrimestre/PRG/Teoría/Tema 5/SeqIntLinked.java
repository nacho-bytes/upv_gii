package linear;

/**
 * Classe SeqIntLinked: classe tipus de dades que té com atribut una 
 * seqüencia enllaçada.
 *
 * @author PRG
 * @version Curs 2019/20
 */
public class SeqIntLinked {
    private NodeInt seq;
    
    /** Crea una SeqIntLinked buida. */
    public SeqIntLinked() { seq = null; }

    /** Crea una SeqIntLinked en els enters [0..n-1] */
    public SeqIntLinked(int n) {
        for (int i = n - 1; i >= 0; i--) { seq = new NodeInt(i, seq); }
    }

    /** Insereix la dada d en la posició i (sent i >= 0) 
     *  de la seqüència seq.
     */
    public void insert(int d, int i) {
        if (i == 0) { this.seq = new NodeInt(d, this.seq); }
        else { 
            NodeInt aux = this.seq; int k = 0;
            while (aux != null && k < i - 1) {
                aux = aux.next; k++;
            }
            if (aux != null) { // Èxit en la cerca 
                aux.next = new NodeInt(d, aux.next); 
            }
        }
    }

    /**
     * Esborra, si existeix, la primera ocurrencia d'una dada d. 
     * Si aquest element no apareix, no es fa res.
     */
    public void delete(int d) {
        NodeInt aux = this.seq, ant = null;
        while (aux != null && aux.data != d) {
            ant = aux;
            aux = aux.next;
        }
        if (aux != null) { // Èxit en la cerca
            if (ant == null) { // o aux == seq -aux és el primer node-
                this.seq = aux.next;
            }
            else { ant.next = aux.next; }
        }       
    }
    
    /** Torna un String ams les dades de la SeqIntLinked */
    public String toString() {
        String res = ""; 
        NodeInt aux = seq;
        while (aux != null) {
            res += aux.data + " ";
            aux = aux.next;
        }
        return res;
    }
}
