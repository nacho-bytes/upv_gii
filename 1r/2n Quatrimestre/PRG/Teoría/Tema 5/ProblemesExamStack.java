package usaLinear;

import java.util.NoSuchElementException;
import linear.StackIntLinked;
/**
 * Classe ProblemesExamStack; mètodes d'exàmens de cursos anteriors que 
 * fan ús dels mètodes de la classe StackIntLinked.
 *
 * @author PRG
 * @version Curs 2019/20
 */
public class ProblemesExamStack {
    private ProblemesExamStack() { }

    /** P2 - Curs 14/15: Calcula i torna el número d'aparicions
     *  de x en p. Ha de deixar la pila p en l'estat en què estava 
     *  inicialment.  
     */
    /* Versió recursiva */
    public static int numAparicionsEnPila(StackIntLinked p, int x) {
        int n = 0;
        if (!p.empty()) {
            int aux = p.pop();
            n = numAparicionsEnPila(p, x);
            if (aux == x) { n++; }
            p.push(aux);
        }
        return n;
    }

    /* Versió iterativa, usant un array auxiliar */
    public static int numAparicionsEnPila1(StackIntLinked p, int x) {
        int[] aux = new int[p.size()];
        int n = 0, i = 0;
        while (!p.empty()) {
            aux[i] = p.pop();
            if (aux[i] == x) { n++; }
            i++;
        }
        for (i = aux.length - 1; i >= 0; i--) { p.push(aux[i]); }
        return n;
    }

    /* Versió iterativa, usant una pila auxiliar */
    public static int numAparicionsEnPila2(StackIntLinked p, int x) {
        StackIntLinked aux = new StackIntLinked();
        int n = 0;
        while (!p.empty()) {
            int e = p.pop();
            if (e == x) { n++; }
            aux.push(e);
        }
        while (!aux.empty()) { p.push(aux.pop()); }
        return n;
    }

    /** RecP2 - Curs 12/13: mètode recursiu que elimina de p els elements 
     *  menors que e.
     */
    public static void eliminarMenorsQue(StackIntLinked p, int x) {
        if (!p.empty()) {
            int aux = p.pop();
            eliminarMenorsQue(p, x);
            if (aux >= x) { p.push(aux); }
        }
    }   

    /** RecP2 - Curs 11/12: què mostra per pantalla el següent programa? */
    public static void main(String[] args) {
        StackIntLinked p1 = new StackIntLinked();
        for (int i = 1; i <= 10; i++) { p1.push(i); }
        StackIntLinked p2 = new StackIntLinked();
        while (!p1.empty()) {
            int valor = p1.pop();
            if (valor % 2 == 0) { p2.push(valor); }
            else { System.out.print(" " + valor); }
        }
        while (!p2.empty()) { System.out.print(" " + p2.pop()); }
    }
    
    // Solució: 9 7 5 3 1 2 4 6 8 10
}
