    
public class EntradaMap<C extends Comparable<C>, V> implements Comparable<EntradaMap<C, V>> {        
  // Atributos: clave y valor de la entrada
  private C clave;
  private V valor;
  
  public EntradaMap(C c, V v) { clave = c; valor = v; }   // Constructor
  
  public C getClave() { return clave; }           // Consultores
  public V getValor() { return valor; }
  
  public void setClave(C nueva) { clave = nueva; }  // Modificadores
  public void setValor(V nuevo) { valor = nuevo; }
  
  @SuppressWarnings("unchecked")    // 2 entradas son iguales si tienen la misma clave
  public boolean equals(Object otra) {  
    return this.clave.equals(((EntradaMap<C,V>) otra).clave);    
  }
  
  public int compareTo(EntradaMap<C, V> otra) {  // Comparación de 2 entradas según sus claves       
    return clave.compareTo(otra.clave);    
  }
  
  public String toString() {                    // Descripción de la entrada
    return "(" + this.clave + ", " + this.valor + ")";     
  }
}
