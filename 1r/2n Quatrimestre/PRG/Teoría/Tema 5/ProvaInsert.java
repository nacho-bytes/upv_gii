package linear;

/**
 * Classe ProvaInsert: classe programa que prova el mètode insert.
 * - mètode estàtic de la classe UtilLinked amb una seqüencia seq com a paràmetre 
 *   --> en execució seq està en la pila del registre d'activació de la crida al mètode
 * - mètode dinàmic de la classe SeqIntLinked que té com atribut una seqüència seq
 *   --> en execució seq està en el heap, és un atribut de l'objecte al que s'aplica 
 *   el mètode
 *   
 * @author PRG
 * @version Curs 2019/20
 */
public class ProvaInsert {
    private ProvaInsert() { }

    public static void main(String[] args) {
        // Crea una seqüència enllaçada amb els
        // 4 primers números parells
        NodeInt seqIni = null;
        for (int i = 4; i >= 1; i--) {
            seqIni = new NodeInt(i * 2, seqIni);
        }       
        // Mostra la seqüencia: 2 4 6 8
        System.out.println("Inicial: \n" + UtilLinked.toString(seqIni));

        // Insereix la dada -1 en la posició 0
        seqIni = UtilLinked.insert(seqIni, -1, 0);       
        // Mostra la seqüencia: -1 2 4 6 8
        System.out.println("Després de insert -1 en posició 0: \n" 
            + UtilLinked.toString(seqIni));

        // Insereix la dada 7 en la posició 4
        seqIni = UtilLinked.insert(seqIni, 7, 4);
        // Mostra la seqüencia: -1 2 4 6 7 8    
        System.out.println("Després de insert 7 en posició 4: \n" 
            + UtilLinked.toString(seqIni));

        // Crea un objecte de tipus SeqIntLinked
        SeqIntLinked objSeq = new SeqIntLinked(4);
        // Mostra la seqüencia: 0 1 2 3
        System.out.println("\nInicial: \n" + objSeq);

        // Insereix la dada -1 en la posició 0
        objSeq.insert(-1, 0);
        // Mostra la seqüencia: -1 0 1 2 3
        System.out.println("Després de insert -1 en posició 0: \n" + objSeq);

        // Insereix la dada 5 en la posició 4
        objSeq.insert(5, 4);
        // Mostra la seqüencia: -1 0 1 2 5 3
        System.out.println("Després de insert 5 en posició 4: \n" + objSeq);
    }
}
