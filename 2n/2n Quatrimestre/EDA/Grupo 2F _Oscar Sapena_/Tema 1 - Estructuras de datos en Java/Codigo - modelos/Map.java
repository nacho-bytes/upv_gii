package librerias.estructurasDeDatos.modelos;

/**
 * Modelo Diccionario SIN claves repetidas, o Map: Busqueda Dinamica 
 * de una Entrada de Clave dada en una Coleccion, para recuperar el 
 * Valor asociado a esta 
 * @param <C>, el tipo de sus claves
 * @param <V>, el tipo de sus valores
 * @version Febrero 2017
 */

public interface Map<C, V> {

    /** Inserta/actualiza la Entrada (c,v) en un Map y devuelve 
     *  el valor que YA estuviera asociado a su clave, null si 
     *  no existe una Entrada con clave c
     */
    V insertar(C c, V v);
    
    /** Elimina la Entrada con clave c de un Map y devuelve su 
     *  valor asociado, null si no existe una Entrada con clave c
     */
    V eliminar(C c);
    
    /** Devuelve el valor asociado a la clave c en un Map,
     *  null si no existe una Entrada con clave c
     */
    V recuperar(C c);
    
    /** Comprueba si un Map esta vacio */
    boolean esVacio();
    
    /** Devuelve la talla, o numero de Entradas, de un Map */
    int talla();
    
    /** Devuelve una ListaConPI con las talla() Claves de un Map */
    ListaConPI<C> claves();
}

