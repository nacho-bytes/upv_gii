package pract2;

/**
 * Classe PRGString: classe d'utilitats amb mètodes 
 * per a treballat amb Strings.
 * 
 * @author PRG - ETSINF - DSIC - UPV
 * @version Curs 2019/2020
 */
public class PRGString {    
    
    /** No hi ha objectes d'aquesta classe. */
    private PRGString() { }
    
    /**
     * Torna el número de 'a's en la String donada.
     * @param s String on es volen comptar les 'a's.
     * @return int.
     */
    public static int countA(String s) {
        // Cas base: String buida
        if (s.length() == 0) { return 0; }
        // Cas general: String no buida. Tractar la substring posterior.
        else if (s.charAt(0) == 'a') { return 1 + countA(s.substring(1)); }
        else { return countA(s.substring(1)); }
    }

    /**
     * Torna el número de 'a's en la String donada a partir
     * d'una determinada posició.
     * @param s String on es volen comptar les 'a's.
     * @param pos posició de s on comenza la substring.
     * @return int.
     * PRECONDICIO: pos >= 0
     */
    public static int countA(String s, int pos) {
        // Cas base: String buida
        if (pos >= s.length()) { return 0; }
        // Cas general: String no buida. Tractar la substring posterior.
        else if (s.charAt(pos) == 'a') { return 1 + countA(s, pos + 1); }
        else { return countA(s, pos + 1); }
    }

    /**
     * Torna el número de 'a's en la String donada.
     * @param s String on es volen comptar les 'a's.
     * @return int.
     */
    public static int countA2(String s) {
        // Cas base: String buida
        if (s.length() == 0) { return 0; }
        // Cas general: String no buida. Tractar la substring anterior.
        else if (s.charAt(s.length() - 1) == 'a') {
            return 1 + countA2(s.substring(0, s.length() - 1));
        } else { return countA2(s.substring(0, s.length() - 1)); }
    }

    /**
     * Determina si a és o no prefixe de b.
     * -- COMPLETAR --
     */
    public static boolean isPrefix(String a, String b) {
        /* COMPLETAR */
        return true;
    }

    /**
     * Determina si a és o no subcadena de b.
     * -- COMPLETAR --
     */
    public static boolean isSubstring(String a, String b) {
        /* COMPLETAR */
        return true;
    }
}