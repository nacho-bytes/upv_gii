package pract4;

import java.io.PrintWriter; 
import java.util.Scanner;
/**
 * Classe SortedRegister: conte un array bidimensional m on les files son mesos i
 * les columnes son els dies de cada mes, de manera que m[f][c] correspon a la 
 * quantitat d'accidents acumulats el dia c del mes f.
 * La classe conte els metodes necessaris per bolcar la informacio llegida des d'un
 * Scanner sobre la matriu i, al seu torn, bolcar la informacio de la matriu en un
 * PrintWriter.
 * @author (PRG. ETSINF - UPV) 
 * @version (2019/20)  
 */
public class SortedRegister {
    private static int[] DAYS = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};  
    private int year;
    private int[][] m;

    /** Crea un SortedRegister per a l'any dataYear.
     *  @param dataYear int.
     */
    public SortedRegister(int dataYear) {
        this.year = dataYear;
        boolean leap = isLeap(this.year);
        this.m = new int[13][]; 
        for (int month = 1; month <= 12; month++) {
            int numD = DAYS[month];
            if (month == 2 && leap) { numD++; }
            this.m[month] = new int[numD + 1];
        }    
    }    
    
    /** Classifica ordenadament les dades llegides del Scanner s.
     *  Precondicio: El format de linia recognoscible es: <br>
     *        dia mes quantitat                          <br>
     *  on dia i mes han de ser enters corresponents a una data valida,
     *  i quantitat ha de ser un enter > 0.              <br>
     *  La quantitat llegida s'acumula en el registre que es porta per 
     *  al dia del mes.  
     *  
     *  Retorna el nombre de linies processades.
     *  
     *  @throws NumberFormatException si es llig un dada no entera.
     *  @throws IllegalArgumentException si la linia no conte 3 dades,
     *  o no s'ajusten al format de data i quantitat correctes.
     *  
     *  @param sc Scanner font de les dades.
     *  @return int
     *  
     */
    public int add(Scanner sc) {
        // A COMPLETAR AMB LA CAPTURA D'EXCEPCIONS
        int count = 0;
        while (sc.hasNext()) {    
            count++;
            this.handleLine(sc.nextLine());
        }
        return count;
    } 
    
    /** Metode d'ajuda per al metode add: processa les dades de line, String 
     *  corresponent a una linia llegida del Scanner.
     *  El format de line ha de tindre la forma
     *        dia mes quantitat
     *  on dia i mes han de ser enters corresponents a una data  
     *  valida, i quantitat ha de ser un enter > 0.
     *  - Si les dades de la linia son correctes, la quantitat llegida s'acumula
     *  en el registre que es porta per al dia del mes.
     *  - Si les dades son incorrectes, el metode acaba llançant una excepcio.
     *
     *  @param line String font de les dades.
     *  @throws NumberFormatExceptionException si es llig una dada no entera. 
     *  @throws IllegalArgumentException si la linia no conte 3 dades,
     *  o no s'ajusten al format de data i quantitat correctes.
     */    
    private void handleLine(String line) {
        String[] data = line.trim().split("[ ]+"); 
        // data es un array amb tantes components com tokens apareixen en line
        if (data.length != 3) { 
            throw new IllegalArgumentException("La linia no conte tres dades.");
        }
        int day = Integer.parseInt(data[0]); // Pot produir NumberFormatException
        int month = Integer.parseInt(data[1]); // Pot produir NumberFormatException
        int amount = Integer.parseInt(data[2]); // Pot produir NumberFormatException
        if (month <= 0 || month >= this.m.length || day <= 0 || day >= this.m[month].length) {
            throw new IllegalArgumentException("Data incorrecta.");
        }
        // COMPLETAR
        this.m[month][day] += amount; // Per la comprovacio anterior, no es pot produir 
                                      // ArrayIndexOutOfBoundsException
    }
    
    /** Les dades registrades > 0 s'escriuen en p, linia a linia
     *  amb el format
     *        dia  mes  quantitat
     *  ordenades cronologicament.
     *  @param pw Printwriter desti de les dades ordenades.
     */
    public void save(PrintWriter pw) {
        for (int month = 1; month <= 12; month++) {
            for (int day = 1; day < this.m[month].length; day++) {
                int totalAmount = this.m[month][day];
                if (totalAmount > 0) {
                    pw.printf("%5d %5d %5d \n", day, month, totalAmount);
                }
            }
        }
    }

    /** Classifica ordenadament les dades llegides del Scanner s. Es filtren
     *  les dades que tingueren algun defecte de format, emetent un informe
     *  d'errors.
     *  Precondicio: El format de linia recognoscible es
     *        dia mes quantitat
     *  on dia i mes han de ser enters corresponents a una data valida,
     *  i quantitat ha de ser un enter > 0.
     *  La quantitat llegida s'acumula en el registre que es porta per 
     *  al dia del mes.
     *  En err s'escriuen les linies defectuoses, indicant el nombre de linia.
     *  @param sc Scanner font de les dades.
     *  @param err Printwriter desti de l'informe d'errors.
     *  @return int, el nombre de linies processades.
     */
    public int add(Scanner sc, PrintWriter err) {
        int count = 0;
        
        // COMPLETAR
        
        return count;
    }
    
    /** Comprova si year es bixest.
     *  @param year int.
     *  @return true sii es bixest.
     */
    private static boolean isLeap(int year) {
        return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
    }
}
