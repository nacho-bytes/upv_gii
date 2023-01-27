package usaLinear;

import java.util.NoSuchElementException;
import linear.ListPIIntLinked;
/**
 * Classe ProblemesExamListPI: mètodes d'exàmens de cursos anteriors que 
 * fan ús dels mètodes de la classe ListPIIntLinked.
 *
 * @author PRG
 * @version Curs 2019/20
 */
public class ProblemesExamListPI {
    private ProblemesExamListPI() { }

    /** P2 - Curs 14/15: fa ús del mètode d'instància conte(int) */
    public static void inserirNous(ListPIIntLinked a, ListPIIntLinked b) {
        b.begin();
        while (!b.isEnd()) {
            int i = b.get();
            if (!a.conte(i)) { a.insert(i); }
            b.next();
        }
    }

    /** P2 - Curs 13/14 */
    public static int comptar(ListPIIntLinked l, int i, int j) {
        int compt = 0;
        l.begin();
        while (!l.isEnd()) {
            int x = l.get();
            if (x >= i && x <= j) { compt++; }
            l.next();
        }
        return compt;
    }

    /** P2 - Curs 18/19: Precondició: els elements de l valen 0 o 1. */
    public static ListPIIntLinked compress(ListPIIntLinked l) {
        ListPIIntLinked result = new ListPIIntLinked();
        int n = l.size();
        l.begin();
        while (n >= 2) {
            int e1 = l.get(); l.next();
            int e2 = l.get(); l.next();
            result.insert(e1 * 2 + e2);
            n = n - 2; 
        }
        if (n == 1) { result.insert(l.get() - 2); } 
        return result;
    }

    /** RecP2 - Curs 17/18 */
    public static ListPIIntLinked subtractMinimumToList(ListPIIntLinked l) {
        if (l.empty()) { return null; }
        ListPIIntLinked res = new ListPIIntLinked();
        l.begin();
        int min = l.get();
        while (!l.isEnd()) {
            if (l.get() < min) { min = l.get(); }
            l.next();
        }
        for (l.begin(); !l.isEnd(); l.next()) {
            res.insert(l.get() - min);
        }
        return res;
    }

    /** RecP2 - Curs 12/13 */
    public static ListPIIntLinked esborrar(ListPIIntLinked l, int x) {
        ListPIIntLinked llista = new ListPIIntLinked();
        l.begin();
        while (!l.isEnd()) {
            if (l.get() == x) {
                llista.insert(x);
                l.remove();
            }
            else { l.next(); }
        }
        return llista;
    }

    /** RecP2 - Curs 11/12 */
    public static void eliminarNeg(ListPIIntLinked l) {
        l.begin();
        while (!l.isEnd()) {
            if (l.get() < 0) { l.remove(); }
            else { l.next(); }
        }
    }

    /** P2 - Curs 16/17: Si apareix el caràcter '\\', aquest sempre 
     *  anirà seguit d'una 'c' o una 'C'.
     */
    public static void modifTrencada(ListPIIntLinked l) {
        l.begin();
        while (!l.isEnd()) {
            char c1 = (char) l.get();
            if (c1 == '\\') {
                l.remove();
                char c2 = (char) l.remove();
                if (c2 == 'c') { l.insert('ç'); }
                else { l.insert('Ç'); }
            } 
            else { l.next(); }
        }
    }

    /** P2 - Curs 12/13: l1 i l2 estan en ordre estrictament creixent */
    public static ListPIIntLinked unio(ListPIIntLinked l1, ListPIIntLinked l2) {
        ListPIIntLinked lu = new ListPIIntLinked();
        l1.begin(); l2.begin();
        while (!l1.isEnd() && !l2.isEnd()) {
            int i = l1.get(), j = l2.get();
            if (i < j) { lu.insert(i); l1.next(); }
            else if (i > j) { lu.insert(j); l2.next(); }
            else { lu.insert(i); l1.next(); l2.next(); }
        }
        while (!l1.isEnd()) {
            lu.insert(l1.get());
            l1.next();
        }
        while (!l2.isEnd()) {
            lu.insert(l2.get());
            l2.next();
        }
        return lu;
    }

    /** P2 - Curs 11/12: la i lb ordenades ascendentment, sense repetits.
     *  És el mètode intersectSort de la classe OpsLlistes.  
     */
    public static ListPIIntLinked interseccio(ListPIIntLinked la, ListPIIntLinked lb) {
        ListPIIntLinked li = new ListPIIntLinked();
        la.begin(); lb.begin();
        while (!la.isEnd() && !lb.isEnd()) {
            int a = la.get(), b = lb.get();
            if (a < b) { la.next(); }
            else if (b < a) { lb.next(); }
            else { li.insert(a); la.next(); lb.next(); }
        }
        return li;
    }
    
    /** P2 - Curs 15/16: l1 i l2 no contenen elements repetits. */
    public static ListPIIntLinked elimComuns(ListPIIntLinked l1, ListPIIntLinked l2) {
        ListPIIntLinked result = new ListPIIntLinked();
        l1.begin();
        while (!l1.isEnd()) {
            int x = l1.get();
            l2.begin();
            while (!l2.isEnd() && x != l2.get()) { l2.next(); }
            if (l2.isEnd()) { l1.next(); }
            else { l1.remove(); result.insert(x); }
        }
        return result;
    }
    
    /** RecP2 - Curs 15/16: l1 i l2 no contenen elements repetits. */
    public static ListPIIntLinked diferencia(ListPIIntLinked l1, ListPIIntLinked l2) {
        ListPIIntLinked result = new ListPIIntLinked();
        l1.begin();
        while (!l1.isEnd()) {
            int x = l1.get();
            l2.begin();
            while (!l2.isEnd() && x != l2.get()) { l2.next(); }
            if (l2.isEnd()) { result.insert(x); }
            l1.next();
        }
        return result;
    }
}
