
/**
 * Classe Mesura per representar els valors de la temperatura i pressio 
 * d'un forn industrial en un instant determinat.
 * 
 * @author IIP
 * @version Curs 2011-12
 */
public class Mesura {
    /** Valor maxim de pressio. */
    public static final double MAX_PRES = 100.0;
    /** Valor maxim de temperatura. */
    public static final int MAX_TEMP = 1200;
    /** Estat en el que ni la pressio ni la temperatura excedeixen els valors maxims. */
    public static final int CORRECTA = 0; 
    /** Estat en el que la pressio o la temperatura excedeixen els valors maxims. */
    public static final int PROBLEMA1 = 1; 
    /** Estat en el que la pressio i la temperatura excedeixen els valors maxims. */
    public static final int PROBLEMA2 = 2;
    
    private double pres;
    private int temp;
    
    /**
     * Crea una Mesura amb certa pressio p i temperatura t donades.
     * @param p double, la pressio.
     * @param t int, la temperatura.
     */
    public Mesura(double p, int t) {
        pres = p;
        temp = t;
    }

    /** Torna la pressio de la Mesura.
     *  @return double, la pressio.
     */
    public double getPressio() { return pres; }
    
    /** Torna la temperatura de la Mesura.
     *  @return int, la temperatura.
     */
    public int getTemperatura() { return temp; }
    
    /** Torna un String amb la informacio de la Mesura.
     *  @return String.
     */
    public String toString() {
        return "Pressio: " + pres + "MHp\n"
            + "Temperatura: " + temp + "Grds\n";
    }
    
    /** Torna PROBLEMA2 si temperatura i pressio son els dos excessius;
     *  torna PROBLEMA1 si be la temperatura, be la pressio, son excessius;
     *  torna CORRECTA en cas contrari (ningun es excessiu).
     *  @return int.
     */
    public int getEstat() {
        int res = CORRECTA;
        if (pres > MAX_PRES && temp > MAX_TEMP) { res = PROBLEMA2; }
        else if (pres > MAX_PRES || temp > MAX_TEMP) { res = PROBLEMA1; }
        return res;
    }
}
