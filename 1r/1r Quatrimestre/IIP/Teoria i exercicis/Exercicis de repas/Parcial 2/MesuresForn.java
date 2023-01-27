
/**
 * Classe MesuresForn per representar un conjunt de mesures preses
 * al llarg d'una hora. Cada mesura va associada temporalment 
 * al segon determinat de l'hora en que aquesta es fa, de manera 
 * que el nombre maxim de mesures que poden fer-se es de 3600.
 * 
 * @author IIP
 * @version Curs 2019-20
 */
public class MesuresForn {
    public static final int MAX_MESURES = 3600;
    private Mesura[] mesures;
    private int numProblem;
    
    /** Constructor que inicialitza els atributs, creant l'array 
     *  de 3600 elements sense cap Mesura inicial.
     */
    public MesuresForn() {
        mesures = new Mesura[MAX_MESURES];
        numProblem = 0;
    }
    
    /** Donada certa mesura i el segon en que aquesta es realitza,
     *  actualitza l'element corresponent de l'array aixi com 
     *  l'atribut numProblem en el cas de que l'estat de la mesura 
     *  no siga Mesura.CORRECTA.
     *  @param s int, el segon, 0 <= s < 3600.
     *  @param m Mesura, la mesura.
     */
    public void altaMesura(int s, Mesura m) {
        if (mesures[s] != null 
            && mesures[s].getEstat() != Mesura.CORRECTA) { numProblem--; }
        mesures[s] = m;
        if (mesures[s].getEstat() != Mesura.CORRECTA) { numProblem++; }
    }
    
    /** Torna la posicio de l'array on es troba la mesura de menor pressio.
     *  Si hi ha diverses mesures amb la mateixa pressio minima, torna la 
     *  posicio de l'ultima de totes elles. 
     *  Si no hi ha cap mesura, torna -1 per indicar-ho.
     *  @return int, posicio de la mesura de menor pressio.
     */
    public int minPressio() {
        // VERSIO 1: per començar amb la pressio de la primera mesura, 
        // suposar com a pressio minima inicial el valor maxim de tipus 
        // double representable en Java i com a posicio inicial -1.
        double min = Double.MAX_VALUE;
        int posMin = -1;
        for (int i = 0; i < mesures.length; i++) {
            if (mesures[i] != null && mesures[i].getPressio() <= min) {
                min = mesures[i].getPressio();
                posMin = i;
            }
        }
        return posMin;
        
        // VERSIO 2: fer una cerca per trobar la primera mesura a l'array
        // int posMin = -1;
        // int j = 0;
        // while (j < mesures.length && mesures[j] == null) { j++; }
        // if (j < mesures.length) { 
            // posMin = j; 
            // double min = mesures[posMin].getPressio();
            // for (int i = j + 1; i < mesures.length; i++) {
                // if (mesures[i] != null && mesures[i].getPressio() <= min) {
                    // min = mesures[i].getPressio();
                    // posMin = i;
                // }
            // }
        // }
        // return posMin;
    }
    
    /** Torna un array que continga la posicio de totes les mesures que 
     *  han presentat algun problema (es a dir, aquelles mesures amb qualsevol 
     *  estat diferent de Mesura.CORRECTA).
     *  L'array resultat tindra tants elements com mesures problematiques 
     *  s'hagen pogut donar. I haura d'estar ordenat temporalment en sentit 
     *  ascendent, es a dir, les posicions de les mesures posteriors apareixeran 
     *  darrere de les de les mesures anteriors.
     *  @return int[], l'array resultat.
     */
    public int[] mesuresAmbProblemes() {
        int[] res = new int[numProblem];
        int k = 0;
        for (int i = 0; i < mesures.length && k < numProblem; i++) {
            if (mesures[i] != null && mesures[i].getEstat() != Mesura.CORRECTA) {
                res[k] = i;
                k++;
            }
        }
        return res;
    }
}
