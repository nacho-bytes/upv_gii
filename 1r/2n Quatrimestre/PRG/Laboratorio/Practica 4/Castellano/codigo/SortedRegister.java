package pract4;

import java.io.PrintWriter; 
import java.util.Scanner;
/**
 * Clase SortedRegister: Un SortedRegister contiene un array bidimensional m en el que las filas 
 * son meses y las columnas los dias de cada mes de manera que m[f][c] corresponde a la cantidad  
 * de accidentes acumulados el dia c del mes f. 
 * La clase contiene los metodos necesarios para volcar la informacion leida desde un 
 * Scanner sobre la matriz y, a su vez, volcar la informacion de la matriz en un 
 * PrintWriter.
 * @author (PRG. ETSINF - UPV) 
 * @version (2019/20)  
 */
public class SortedRegister {
    private static int[] DAYS = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};  
    private int year;
    private int[][] m;

    /** Crea un SortedRegister para el año dataYear.
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
    
    /** Clasifica ordenadamente los datos leidos del Scanner s, linea a linea.
     *  Precondicion: En cada linea de s los datos deben tener la forma
     *        dia mes cantidad
     *  en donde dia y mes deben ser enteros correspondientes a una 
     *  fecha valida del año de this, y cantidad debe ser un entero > 0.
     *  La cantidad leida se acumula en el registro que se lleva para el 
     *  dia del mes. 
     *  
     *  Devuelve el numero de lineas procesadas.
     *  
     *  @throws NumberFormatException si se lee un dato no entero.
     *  @throws IllegalArgumentException si la linea no contiene 3 datos,
     *  o no se ajustan al formato de fecha y cantidad correctos.
     *  
     *  @param sc Scanner fuente de los datos.
     *  @return int
     *  
     */
    public int add(Scanner sc) {
        // A COMPLETAR CON LA CAPTURA DE EXCEPCIONES
        int count = 0;
            while (sc.hasNext()) {    
                count++;
                this.handleLine(sc.nextLine());
            }
        return count;
    } 
    
    /** Metodo de ayuda para el metodo add: procesa los datos de line, String 
     *  correspondiente a una linea leida del Scanner.
     *  El formato de line debe tener la forma
     *        dia mes cantidad
     *  en donde dia y mes deben ser enteros correspondientes a una fecha  
     *  valida, y cantidad debe ser un entero > 0.
     *  - Si los datos de la linea son correctos, la cantidad leida se acumula
     *  en el registro que se lleva para el dia del mes.
     *  - Si los datos son incorrectos,el metodo termina lanzando una excepcion.
     *
     *  @param line String fuente de los datos.
     *  @throws NumberFormatExceptionException si se lee un dato no entero. 
     *  @throws IllegalArgumentException si la linea no contiene 3 datos,
     *  o no se ajustan al formato de fecha y cantidad correctos.
     */    
    private void handleLine(String line) {
        String[] data = line.trim().split("[ ]+"); 
        // data es un array con tantas componentes como tokens aparecen en line
        if (data.length != 3) { 
            throw new IllegalArgumentException("La linea no contiene tres datos.");
        }
        int day = Integer.parseInt(data[0]); // Puede producir NumberFormatException
        int month = Integer.parseInt(data[1]); // Puede producir NumberFormatException
        int amount = Integer.parseInt(data[2]); // Puede producir NumberFormatException
        if (month <= 0 || month >= this.m.length || day <= 0 || day >= this.m[month].length) {
            throw new IllegalArgumentException("Fecha incorrecta.");
        }
        // COMPLETAR
        this.m[month][day] += amount; // Por la comprobacion anterior, no se puede producir 
                                      // ArrayIndexOutOfBoundsException
    }
    
    /** Los datos registrados > 0 se escriben en p, linea a linea
     *  con el formato
     *        dia  mes  cantidad
     *  ordenados cronologicamente.
     *  @param pw Printwriter destino de los datos ordenados.
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

    /** Clasifica ordenadamente los datos leidos del Scanner s. Se filtran
     *  los datos que tuvieran algun defecto de formato, emitiendo un informe
     *  de errores. 
     *  Precondicion: El formato de linea reconocible es
     *        dia mes cantidad
     *  en donde dia y mes deben ser enteros correspondientes a una fecha 
     *  valida, y cantidad debe ser un entero > 0.
     *  La cantidad leida se acumula en el registro que se lleva para 
     *  el dia del mes.
     *  En err se escriben las lineas defectuosas, indicando el numero de 
     *  linea.  
     *  @param sc Scanner fuente de los datos.
     *  @param err PrintWriter destino del informe de errores.
     *  @return int, el numero de lineas procesadas.
     */
    public int add(Scanner sc, PrintWriter err) {
        int count = 0;
        
        // COMPLETAR
        
        return count;
    }
    
    /** Comprueba si year es bisiesto.
     *  @param year int
     *  @return true sii es bisiesto.
     */
    private static boolean isLeap(int year) {
        return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
    }
}
