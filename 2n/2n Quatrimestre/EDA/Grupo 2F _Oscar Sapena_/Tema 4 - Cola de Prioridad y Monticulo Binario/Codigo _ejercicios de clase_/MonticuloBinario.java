/** Clase MonticuloBinario: representa un Heap con Raiz en 1.
 * 
 *  Sus caracteristicas son las siguientes:
 *  @param <E>, el tipo de sus elementos es E extends Comparable<E>
 *  ATRIBUTOS (protected para la herencia): 
 *      TIENE UN array con los elementos (E[] elArray)
 *      TIENE UNA talla que indica el numero de elementos
 **/ 
public class MonticuloBinario<E extends Comparable<E>> 
    implements ColaPrioridad<E> {  
    
    protected static final int CAPACIDAD_POR_DEFECTO = 10;
    
    // Un Heap es un AB Completo y, por tanto,...
    // TIENE UNA Representacion Implicita
    protected E[] elArray;
    // TIENE UNA talla o numero de nodos
    protected int talla;
    
	// Ejercicio: si lo encuentra, elimina el primer elemento del monticulo 
	// igual a x. En caso contrario, devuelve False
    public boolean eliminar(E x) { // Lanzadera
        return eliminar(x, 1);
    }
    
    private boolean eliminar(E x, int pos) {
        if (pos > talla) return false; // Estamos fuera del montículo
        int cmp = elArray[pos].compareTo(x);
        if (cmp > 0) return false;     // El actual ya es mayor
        if (cmp < 0) return eliminar(x, pos * 2) || eliminar(x, pos * 2 + 1);
        E ultimo = elArray[talla];
        talla--;
        elArray[pos] = ultimo;
        if (ultimo.compareTo(x) < 0) reflotar(pos); // Arregla la propiedad de orden con el padre
        else hundir(pos); // Arregla la propiedad de orden con los hijos
        return true;
    }
    
    // Ejercicio: cuenta los elementos del monticulo que son menores que x
    public int contarMenores(E x) { // Lanzadera
        return contarMenores(x, 1);
    }
    
    private int contarMenores(E x, int pos) {
        if (pos > talla) return 0; // Estamos fuera del montículo
        // Caso general
        if (elArray[pos].compareTo(x) < 0) { // Menor que x
            return 1 + contarMenores(x, pos * 2) + contarMenores(x, pos * 2 + 1);
        } else { // Mayor o igual que x
            return 0;
        }
    }
    
	// Ejercicio: elimina y devuelve el elemento maximo del monticulo
    public E eliminarMax() {
        int posMax = talla / 2 + 1; // Primera hoja
        for (int i = posMax + 1; i <= talla; i++) { // Recorremos el resto de hojas
            if (elArray[i].compareTo(elArray[posMax]) > 0)
                posMax = i;
        }
        E max = elArray[posMax];
        elArray[posMax] = elArray[talla];
        talla--;
        reflotar(posMax);
        return max;
    }
    
    /** Crea una Cola de Prioridad (CP) vacia 
     *  con capacidad inicial CAPACIDAD_POR_DEFECTO
     */
    @SuppressWarnings("unchecked")
    public MonticuloBinario() {
        elArray = (E[]) new Comparable[CAPACIDAD_POR_DEFECTO];
        talla = 0;
    }
    
    /** Comprueba si una CP esta vacia o no 
     *  @return boolean que indica si la CP esta vacia
     */
    public boolean esVacia() { return talla == 0; }
        
    /** SII !esVacia(): obtiene el dato con maxima prioridad de la CP 
     *  @return Elemento con maxima prioridad de la CP
     */
    public E recuperarMin() { return elArray[1]; }
    
    /** Inserta el dato e en una CP, atendiendo a su prioridad 
     *  @param e  Elemento a insertar  
     */
    public void insertar(E x) {
        // ¿hay espacio en el array para el nuevo dato?
      if (talla == elArray.length - 1) duplicarArray();
      // Incrementamos la talla e insertamos x
      elArray[++talla] = x;
      // Reflotamos hasta que no viole la propiedad de orden
      reflotar(talla);
    }
    
    protected void reflotar(int hueco) {
      E aux = elArray[hueco];
      while (hueco > 1 && aux.compareTo(elArray[hueco/2]) < 0) {
        elArray[hueco] = elArray[hueco/2];
        hueco = hueco/2;
      }
      elArray[hueco] = aux;
    } 

    // Duplica la capacidad de elArray
    @SuppressWarnings("unchecked")
    protected void duplicarArray() {
        E[] nuevo = (E[]) new Comparable[elArray.length * 2];
        System.arraycopy(elArray, 1, nuevo, 1, talla);
        elArray = nuevo;
    }  
    
    /** SII !esVacia(): obtiene y borra el dato con 
     *  maxima prioridad de la CP 
     *  @return Elemento con maxima prioridad de la CP
     */
    public E eliminarMin() {
        E elMinimo = recuperarMin();
        elArray[1] = elArray[talla--];
        hundir(1);
        return elMinimo;
    }
	
    //  Si es necesario, restablece la propiedad de orden 
    //  de un Heap hundiendo el elemento de elArray situado 
    //  en la posicion pos 
    //  @param pos  Posicion del elemento a hundir
    protected void hundir(int pos) {
        int posActual = pos;
        E aHundir = elArray[posActual]; 
        int hijo = posActual * 2; 
        boolean esHeap = false;
        while (hijo <= talla && !esHeap) {
            if (hijo != talla 
                && elArray[hijo + 1].compareTo(elArray[hijo]) < 0) { 
                hijo++; 
            }
            if (elArray[hijo].compareTo(aHundir) < 0) {
                elArray[posActual] = elArray[hijo];
                posActual = hijo; 
                hijo = posActual * 2;
            } else { esHeap = true; }
        }
        elArray[posActual] = aHundir;
    }
}
