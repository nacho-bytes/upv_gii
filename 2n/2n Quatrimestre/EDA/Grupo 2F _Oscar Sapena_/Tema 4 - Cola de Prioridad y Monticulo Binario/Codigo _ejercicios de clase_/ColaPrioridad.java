public interface ColaPrioridad<E extends Comparable<E>> {
  // Añade x a la cola
  void insertar(E x); 
  // SII !esVacia(): devuelve el dato de mayor prioridad
  E recuperarMin();
  // SII !esVacia(): devuelve y elimina el dato de mayor prioridad
  E eliminarMin();
  // Devuelve true si la cola está vacía
  boolean esVacia();
}
