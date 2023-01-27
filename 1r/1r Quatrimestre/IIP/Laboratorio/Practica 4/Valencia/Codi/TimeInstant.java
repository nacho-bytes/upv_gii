package pract4;

/**
 * Classe TimeInstant. 
 * Aquesta classe permet representar instants o marques de temps
 * (<code>Timestamp</code>) amb detall de hores i minuts. Així, 
 * aquesta classe representa el moment que defineix un instant de 
 * temps, en aquest cas, les hores i els minuts d'un dia qualsevol.
 * </p>
 * 
 *  @author IIP. Grau en Informàtica. ETSINF, UPV 
 *  @version Curs 2019-20
 */
public class TimeInstant {
    // ATRIBUTS:
    /** Variable entera per emmagatzemar les hores. 
     *  Ha de pertanyer al rang <code>[0..23]</code>. */
    /* COMPLETAR */
    /** Variable entera per emmagatzemar els minuts. 
     *  Ha de pertanyer al rang <code>[0..59]</code>. */
    /* COMPLETAR */
    
    // CONSTRUCTORS:
    /**
     *  Crea un <code>TimeInstant</code> amb el valor de
     *  les hores i els minuts que rep com arguments,
     *  <code>iniHours</code> i <code>iniMinutes</code>, 
     *  respectivament.
     *  <p> Ha de complir-se la precondició: 
     *  <code>0 <= iniHours < 24, 0 <= iniMinutes < 60</code>. </p>
     */
    /* COMPLETAR */
    
    /**
     * Crea un <code>TimeInstant</code> amb el valor de l'instant
     * actual UTC (temps universal coordinat).
     */
    /* COMPLETAR */
   
    // CONSULTORS I MODIFICADORS:
    /** Torna les hores del TimeInstant. */ 
    /* COMPLETAR */
    
    /** Torna els minuts del TimeInstant. */
    /* COMPLETAR */
    
    /** Actualitza les hores del TimeInstant. */ 
    /* COMPLETAR */
   
    /** Actualitza els minuts del TimeInstant. */ 
    /* COMPLETAR */
   
    // ALTRES METODES:
    /** Torna el TimeInstant en el format "<code>hh:mm</code>". */
    /* COMPLETAR */
   
    /** Torna <code>true</code> sii <code>o</code> és 
     *  un objecte de la classe <code>TimeInstant</code>
     *  i les seues hores i minuts coincideixen amb els 
     *  de l'objecte en curs.
     */
    /* COMPLETAR */ 
      
    /** Torna el número de minuts transcorreguts des de les 00:00 
     *  fins l'instant representat per l'objecte en curs.
     */
    /* COMPLETAR */
    
    /** Compara cronològicament l'instant de l'objecte en curs
     *  amb el de l'objecte de la classe <code>TimeInstant</code>
     *  referenciat per <code>tInstant</code>.
     *  <p>
     *  El resultat és la resta entre la conversió a minuts dels
     *  dos objectes, en particular, aquest resultat serà un valor:
     *  <ul>
     *     <li> negatiu si l'instant de l'objecte en curs
     *     és anterior al de <code>tInstant</code>, </li>
     *     <li> zero si són iguals, </li>
     *     <li> positiu si l'Instant de l'objecte en curs
     *     és posterior al de l'<code>tInstant</code>. </li>
     *  </ul>
     *  </p>
     */    
    /* COMPLETAR */

    // ACTIVITAT EXTRA:
    /** Torna un <code>TimeInstant</code> a partir de la descripció
     *  textual (<code>String</code>) en format "<code>hh:mm</code>".
     */
    /* COMPLETAR */
  
}
