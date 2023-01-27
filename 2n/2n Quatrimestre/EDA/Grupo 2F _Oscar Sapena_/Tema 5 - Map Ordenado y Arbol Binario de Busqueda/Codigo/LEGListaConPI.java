/** Implementa la interfaz ListaConPI mediante una LEG ...
 *  (a) Con Nodo ficticio cabecera.
 *  (b) Una referencia al primer Nodo.
 *  (c) Una referencia al ultimo Nodo.
 *  (d) Para representar el Punto de Interes, una referencia al Nodo 
 *       anterior al que ocupa el punto de interes.
 *  (e) Un int talla que representa la talla de la LEG.
 *
 * @version Febrero 2019
 * @param <E> tipo de datos de la estructura
 */

public class LEGListaConPI<E> implements ListaConPI<E> {

    protected NodoLEG<E> pri, ant, ult; 
    protected int talla;

    /** construye una Lista Con PI vacia **/
    public LEGListaConPI() {
        pri = ult = ant = new NodoLEG<E>(null);
        talla = 0;
    }
    
    /** inserta e en una Lista antes del Elemento que ocupa su PI, 
     * que permanece inalterado.
     *
     * @param e Elemento a insertar.
     **/
    public void insertar(E e) { 
        NodoLEG<E> nuevo = new NodoLEG<E>(e, ant.siguiente);
        ant.siguiente = nuevo;
        if (nuevo.siguiente == null) ult = nuevo;
        ant = ant.siguiente;
        talla++;
    } 

    /** SII !esFin(): elimina de una Lista el Elemento que ocupa 
     * su PI que permanece inalterado. 
     **/  
    public void eliminar() {
        talla--;
        if (ant.siguiente == ult) ult = ant;
        ant.siguiente = ant.siguiente.siguiente;
    }

    /** situa el PI de una Lista en su inicio, sobre su primer 
     * elemento si no esta vacia.
     **/
    public void inicio() { ant = pri; }

    /** SII !esFin(): situa sobre el siguiente Elemento el PI 
     * de una Lista.  
     **/
    public void siguiente() { ant = ant.siguiente; }

    /** situa el PI de una Lista en su fin, detras de su ultimo 
     * Elemento si no esta vacia. 
     **/
    public void fin() { ant = ult; }

    /** SII !esFin(): obtiene el Elemento que ocupa el PI de 
     * una Lista.
     *
     * @return E, el Elemento que ocupa el PI de una Lista.
     */
    public E recuperar() { 
        return ant.siguiente.dato;
    }

    /** comprueba si el PI de una Lista esta en su fin.
     *
     * @return true si el PI de una Lista esta en su fin y 
     * false en caso contrario
     **/
    public boolean esFin() { 
        return ant == ult;
    }

    /** comprueba si una Lista Con PI esta vacia
     *
     * @return true si una Lista Con PI esta vacia y 
     * false en caso contrario
     **/
    public boolean esVacia() { 
        return pri == ult;
    }

    /** devuelve la talla de una Lista Con PI, i.e. su 
     * numero de elementos.
     *
     * @return int, el numero de Elementos de una Lista con PI.
     **/
    public int talla() { return talla; }

    /** devuelve el String con los Elementos de una Lista con PI 
     * en orden de insercion.
     * 
     * @return String que contiene los Elementos de una Lista con 
     * PI, en el mismo formato que usa el estandar de Java para 
     * los arrays.
     **/
    public String toString() {
        StringBuilder s = new StringBuilder();
        s.append("[");
        NodoLEG<E> aux = pri.siguiente;         
        for (int i = 1; i < talla; i++, aux = aux.siguiente) {            
            s.append(aux.dato.toString() + ", ");
        }
        if (talla != 0) {
            s.append(aux.dato.toString() + "]"); 
        } else { s.append("]"); }
        return s.toString();
    }
}
