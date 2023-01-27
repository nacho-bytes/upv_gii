package librerias.estructurasDeDatos.modelos;

/**
 * Modelo de una Cola
 * @param <E>, el tipo de los datos de la Cola
 * @version Febrero 2016
 */

public interface Cola<E> {
    
// metodos Modificadores del estado de una Cola:
    /** Inserta el elemento e en una Cola, o lo situa en su final
     *  @param E, el dato a insertar */
    void encolar(E e);
    
    /** SII !esVacia():
     *  Devuelve y elimina de una Cola el Elemento que ocupa su principio
     *  @return E, el primero de la cola */
    E desencolar();
    
// metodos Consultores del estado de una Cola
    /** SII !esVacia():
     *  Devuelve el Elemento que ocupa el principio de una Cola
     *  @return E, el primero de la Cola */
    E primero();
    
    /** Comprueba si una Cola esta vacia */
    boolean esVacia();
}