package librerias.estructurasDeDatos.modelos;

/**
 * Modelo de una Pila
 * @param <E>, el tipo de los datos de la Pila
 * @version Febrero 2016
 */

public interface Pila<E> {
    
// metodos Modificadores del estado de una Pila:
    /** Inserta el Elemento e en una Pila, o lo situa en su tope */
    void apilar(E e);
    
    /** SII !esVacia():
     *  Devuelve y elimina de una Pila el Elemento que ocupa su tope */
    E desapilar();
    
// metodos Consultores del estado de una Pila:
    /** SII !esVacia():
     *  Devuelve el Elemento que ocupa el tope de una Pila */
    E tope();
    
    /** Comprueba si una Pila esta vacia */
    boolean esVacia();
}
