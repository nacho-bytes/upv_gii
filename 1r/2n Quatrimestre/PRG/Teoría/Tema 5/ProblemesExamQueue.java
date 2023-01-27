package usaLinear;

import java.util.NoSuchElementException;
import linear.QueueIntLinked;
/**
 * Classe ProblemesExamQueue: mètodes d'exàmens de cursos anteriors que 
 * fan ús dels mètodes de la classe QueueIntLinked.
 *
 * @author PRG
 * @version Curs 2019/20
 */
public class ProblemesExamQueue {
    private ProblemesExamQueue() { }

    /** RecP2 - Curs 18/19 */
    public static void moureAlFinal(QueueIntLinked q, int x) {
        int n = q.size(), i = 0;
        while (i < n && q.element() != x) {
            q.add(q.remove());
            i++;
            //System.out.println(q + "\ti: " + i);
        }
        // System.out.println("En finalitzar el primer bucle: " + q + "\ti: " + i);
        if (i < n) {
            q.remove();
            System.out.println(q + "\ti: " + i);
            for (int j = i + 1; j < n; j++) {
                q.add(q.remove());
                System.out.println(q + "\tj: " + j);
            }
            q.add(x);
        }
        // System.out.println("En finalitzar el mètode: " + q);
    }

    /** P2 - Curs 17/18 */    
    /** Versió 1 */
    public static QueueIntLinked fusion1(QueueIntLinked q1, QueueIntLinked q2) {
        QueueIntLinked res = new QueueIntLinked();
        int i = 0, j = 0;
        for ( ; i < q1.size() && j < q2.size(); i++, j++) {
            res.add(q1.element()); q1.add(q1.remove());
            res.add(q2.element()); q2.add(q2.remove());
        }
        while (i < q1.size()) { res.add(q1.element()); q1.add(q1.remove()); i++; }
        while (j < q2.size()) { res.add(q2.element()); q2.add(q2.remove()); j++; }
        return res;
    }
    
    /** Versió 2 */
    public static QueueIntLinked fusion(QueueIntLinked q1, QueueIntLinked q2) {
        QueueIntLinked res = new QueueIntLinked();
        int i = Math.min(q1.size(), q2.size());
        for (int j = 0; j < i; j++) {
            res.add(q1.element()); q1.add(q1.remove());
            res.add(q2.element()); q2.add(q2.remove());
        }
        while (i < q1.size()) { res.add(q1.element()); q1.add(q1.remove()); i++; }
        while (i < q2.size()) { res.add(q2.element()); q2.add(q2.remove()); i++; }
        return res;
    }

    /** RecP2 - Curs 16/17 */
    /** Versió 1: sense estructures auxiliars */
    public static int fromCuaToInt1(QueueIntLinked q) {
        int res = 0;
        for (int i = 0; i < q.size(); i++) {
            int x = q.remove();
            res = res * 10 + x;
            q.add(x);
        }
        return res;
    }

    /** Versió 2: usant una cua auxiliar */
    public static int fromCuaToInt2(QueueIntLinked q) {
        int res = 0;
        QueueIntLinked qAux = new QueueIntLinked();
        while (!q.empty()) {
            int x = q.remove();
            res = res * 10 + x;
            qAux.add(x);
        }
        while (!qAux.empty()) {
            int x = qAux.remove();
            q.add(x);
        }
        return res;
    }

    /** P2 - Curs 13/14 */
    public static QueueIntLinked incrementaParells(QueueIntLinked q) {
        QueueIntLinked q1 = new QueueIntLinked();
        int n = q.size();
        for (int i = 0; i < n; i++) {
            int x = q.remove();
            if (x % 2 == 0) { q1.add(x + 1); }
            else { q1.add(x); }
            q.add(x);
        }
        return q1;
    }

    /** RecP2 - Curs 13/14 */
    public static int maxim(QueueIntLinked c) {
        int n = c.size();
        if (n == 0) { throw new NoSuchElementException("Cua buida: màxim no definit"); }
        int e = c.remove();
        int maxim = e;
        c.add(e); n--;
        while (n > 0) {
            e = c.remove();
            if (e > maxim) { maxim = e; }
            c.add(e); n--;
        }
        return maxim;
    }

    public static void main(String[] args) {
        // Crea una cua buida com una llista enllaçada
        QueueIntLinked q1 = new QueueIntLinked();
        // Encuar els valors 1, 2, 3, 4, 5, 6        
        int[] dades1 = {1, 2, 3, 4, 5, 6};        
        for (int i = 0; i < dades1.length; i++) { q1.add(dades1[i]); }  
        System.out.println("q1: " + q1);

        // Crea un altra cua buida com una llista enllaçada
        QueueIntLinked q2 = new QueueIntLinked();
        // Encuar els valors 7, 8, 9        
        int[] dades2 = {7, 8, 9};        
        for (int i = 0; i < dades2.length; i++) { q2.add(dades2[i]); } 
        System.out.println("q2: " + q2);

        // Moure al final el 3 en q1
        moureAlFinal(q1, 3);
        System.out.println("\nDesprés de moureAlFinal:\nq1: " + q1);

        // Fusionar q1 i q2
        QueueIntLinked q3 = fusion(q1, q2);
        System.out.println("\nDesprés de fusion:\nq1: " + q1 + "\nq2: " + q2 + "\nq3: " + q3);

        // From cua to int de q1
        System.out.println("\nfromCuaToInt(q1): " + fromCuaToInt1(q1));
        System.out.println("q1: " + q1);
        
        // Incrementar els números parells de q3
        QueueIntLinked q4 = incrementaParells(q3);
        System.out.println("\nDesprés de incrementaParells:\nq3: " + q3 + "\nq4: " + q4);
        
        // Màxim de q4
        System.out.println("\nmaxim(q4): " + maxim(q4));
        System.out.println("q4: " + q4);
    }
}
