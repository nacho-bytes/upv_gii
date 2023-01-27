package librerias.estructurasDeDatos.modelos;

/**
 * Modelo de una Cola de Prioridad, o de Busqueda Dinamica 
 * del Elemento de maxima prioridad en una Coleccion
 * @param <E>, el tipo de los datos de la Cola de Prioridad
 * @version Febrero 2016
 */

public interface ColaPrioridad<E extends Comparable<E>> {

// metodos Modificadores del estado de una Cola de Prioridad (CP):
    /** Atendiendo a su prioridad, inserta e en una Cola de Prioridad */
    void  insertar(E e);
    
    /** SII !esVacia():
     *  obtiene y elimina el Elemento con maxima prioridad de una CP */
    E  eliminarMin();
    
// metodos Consultores del estado de una Cola de Prioridad (CP):
    /** SII !esVacia():
     *  obtiene el Elemento con maxima prioridad de una CP */
    E  recuperarMin();
    
    /** Comprueba si una CP esta vacia */
    boolean esVacia();
}
