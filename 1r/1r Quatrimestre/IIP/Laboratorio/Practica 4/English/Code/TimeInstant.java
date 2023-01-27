package pract4;

/**
 * Class TimeInstant. 
 * <p> This class allows you to represent instants or timestamps with 
 * detail of hours and minutes. Thus, this class represents the moment 
 * that defines a time instant, in this case, the hours and minutes of 
 * any given day.
 * </p>
 * 
 *  @author IIP. Grado en Informatica. ETSINF, UPV 
 *  @version Academic Year 2019-20
 */
public class TimeInstant {

    // ATTRIBUTES:
    /** Integer attribute for storing the hours of a TimeInstant. 
     *  It should belong to the interval <code>[0..23]</code>
     */
    // TO COMPLETE
    /** Integer attribute for storing the minutes of a TimeInstant. 
     *  It should belong to the interval <code>[0..59]</code> 
     */
    // TO COMPLETE
    
    // CONSTRUCTORS:
    /**
     *  <code>TimeInstant</code> corresponding to <code>iniHours</code> 
     *  hours and <code>iniMinutes</code> minutes.
     *  <p> Precondition: <code>0<=iniHours<24, 0<=iniMinutes<60 </code> </p>
     */
     // TO COMPLETE
   
    /**
     * <code>TimeInstant</code> (hours and minutes) from current 
     * UTC (universal coordinated time).
     */
     // TO COMPLETE
    
    // CONSULTORS AND MODIFYERS:
    /** Returns hours of current TimeInstant object. */ 
     // TO COMPLETE

    /** Returns minutes of current TimeInstant object. */ 
     // TO COMPLETE
     
    /** Modifies hours of current TimeInstant object. */ 
    // TO COMPLETE
    
    /** Modifies minutes of current TimeInstant object. */ 
     // TO COMPLETE
   
    // OTHER METHODS:
    /** Returns current TimeInstant object in "hh:mm" format. */
     // TO COMPLETE
   
    /** Returns true only if <code> o </code> is a TimeInstant 
     *  that concides in hours and minutes with current TimeInstant.
     */
     // TO COMPLETE
      
    /** Returns number of minutes from 
     *  00:00 until current TimeInstant object
     */
     // TO COMPLETE
    
    /** Chronological comparison of current TimeInstant object 
     *  and <code>tInstant</code> parameter. Result is:
     *     <ul>
     *      <li>negative when current TimeInstant is previous to 
     *        <code>tInstant</code>
     *      </li>
     *      <li> zero if they are equal
     *      </li>
     *      <li>positive when current TimeInstant is posterior to 
     *        <code>tInstant</code>
     *      </li>
     *    </ul>
     */
      // TO COMPLETE

    // EXTRA ACTIVITY:
    /** Returns a TimeInstant from its textual description 
     *  in a <code>String</code> with format "<code>hh:mm</code>".
     */
      // TO COMPLETE
  
}
