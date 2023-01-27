package librerias.estructurasDeDatos.lineales;

//import librerias.estructurasDeDatos.lineales.LEGListaConPI;

/**
 * Implementación de ListaConPI que mantiene
 * ordenados ascendentemente los elementos
 * de una Lista Con Punto De Interés
 * 
 * @version Febrero 2019
 */
public class LEGListaConPIOrdenada<E extends Comparable<E>> extends LEGListaConPI<E> {
    public LEGListaConPIOrdenada() { super(); }
    
    //@Override
    public void insertar(E e) {
        inicio();
        while (!esFin() && recuperar().compareTo(e) < 0) {
            siguiente();
        }
        super.insertar(e);
    }
}