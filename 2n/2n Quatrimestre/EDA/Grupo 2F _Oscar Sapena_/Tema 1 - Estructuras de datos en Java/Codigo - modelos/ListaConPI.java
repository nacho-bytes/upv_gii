package librerias.estructurasDeDatos.modelos;

/**
 * Modelo de una Lista Con Punto de Interes, o de Acceso Secuencial 
 * a los Elementos de una Coleccion
 * @param <E>, el tipo de los datos de la ListaConPI
 * @version Febrero 2016
 */

public interface ListaConPI<E> {

// metodos Modificadores del estado de la Lista Con PI:
    /** Inserta e antes del elemento que ocupa su PI, que permanece inalterado
     *  @param E, el dato a insertar */
    void insertar(E e);
    
    /** SII !esFin():
     *  elimina el elemento que ocupa su PI, que permanece inalterado */
    void eliminar();
    
// metodos Modificadores del estado del PI de la Lista:
    /** Situa el PI de una Lista en su inicio */
    void inicio();
    
    /** SII !esFin():
     *  avanza el PI de una Lista */
    void siguiente();
    
    /** Situa el PI de una Lista en su fin */
    void fin();
    
// metodos Consultores del estado de la Lista Con PI:
    /** SII !esFin():
     *  devuelve el Elemento que ocupa el PI de una Lista
     *  @return E, el dato sobre el PI */
    E recuperar();
    
    /** Comprueba si el PI de una Lista esta en su fin */
    boolean esFin();
    
    /** Comprueba si una Lista Con PI esta vacia */
    boolean esVacia();
    
    /** Devuelve la talla de una Lista, o su numero de elementos */
    int talla();
}