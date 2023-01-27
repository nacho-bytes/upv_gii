
public class ABBMapOrdenado<C extends Comparable<C>, V>
       implements MapOrdenado<C, V> {
           
  protected ABB<EntradaMap<C, V>> abb;
  
  public ABBMapOrdenado() { abb = new ABB<EntradaMap<C, V>>(); }

  // Utilidades
  private C getClave(EntradaMap<C, V> e) { return e == null ? null : e.getClave(); }
  private V getValor(EntradaMap<C, V> e) { return e == null ? null : e.getValor(); }
  
  // Métodos de la interfaz Map
  public boolean esVacio() { return abb.esVacio(); }
  
  public int talla() { return abb.talla(); }
  
  public V recuperar(C c) { return getValor(abb.recuperar(new EntradaMap<C,V>(c, null))); }
  
  public V insertar(C c, V v) {
    EntradaMap<C,V> nuevo = new EntradaMap<C,V>(c,v);
    EntradaMap<C,V> ant = abb.recuperar(nuevo);
    abb.insertar(nuevo);
    return getValor(ant);
  }
  
  public V eliminar(C c) {
    EntradaMap<C, V> e = abb.recuperar(new EntradaMap<C,V>(c, null));
    if (e == null) return null; 
    abb.eliminar(e);
    return e.getValor();
  }
  
  public ListaConPI<C> claves() {
    EntradaMap<C,V> entradas[] = abb.toArrayInOrden();
    ListaConPI<C> res = new LEGListaConPI<C>();
    for (EntradaMap<C,V> e: entradas) res.insertar(e.getClave());
    return res;
  }
  
  // Métodos de MapOrdenado
  /** SII !esVacio(): devuelve la Entrada de Clave minima de un Map Ordenado */
  public EntradaMap<C, V> recuperarEntradaMin() { return abb.recuperarMin(); }
  /** SII !esVacio(): devuelve la Clave minima de un Map Ordenado */
  public C recuperarMin() { return getClave(abb.recuperarMin()); }

  /** SII !esVacio(): devuelve la Entrada de Clave maxima de un Map Ordenado */
  public EntradaMap<C, V> recuperarEntradaMax() { return abb.recuperarMax(); }
  /** SII !esVacio(): devuelve la Clave maxima de un Map Ordenado */
  public C recuperarMax() { return getClave(abb.recuperarMax()); } 

  /** SII !esVacio(): devuelve la Entrada siguiente a c segun el orden establecido entre claves */
  public EntradaMap<C, V> sucesorEntrada(C c) { return abb.sucesor(new EntradaMap<C,V>(c, null)); }  
  /** SII !esVacio(): devuelve la clave siguiente a c segun el orden establecido entre claves */
  public C sucesor(C c) { return getClave(sucesorEntrada(c)); } 

  /** SII !esVacio(): devuelve la Entrada anterior a c segun el orden establecido entre claves */
  public EntradaMap<C, V> predecesorEntrada(C c) { return abb.predecesor(new EntradaMap<C,V>(c, null)); }
  /** SII !esVacio(): devuelve la clave anterior a c segun el orden establecido entre claves */
  public C predecesor(C c) { return getClave(predecesorEntrada(c)); } 

  /** SII !esVacio(): elimina y devuelve la Entrada de Clave minima de un Map Ordenado */
  public EntradaMap<C, V> eliminarEntradaMin() { return abb.eliminarMin(); }
  /** SII !esVacio(): elimina y devuelve la Clave minima de un Map Ordenado */
  public C eliminarMin() { return getClave(abb.eliminarMin()); }
}

