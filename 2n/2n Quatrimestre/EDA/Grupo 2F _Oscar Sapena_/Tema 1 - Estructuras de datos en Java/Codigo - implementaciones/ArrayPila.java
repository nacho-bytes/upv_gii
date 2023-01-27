package librerias.estructurasDeDatos.lineales;

import  librerias.estructurasDeDatos.modelos.*; 

public class ArrayPila<E> implements Pila<E> {    
      protected E elArray[];
      protected int tope;
      protected static final int CAPACIDAD_POR_DEFECTO = 50;

      /** crea una Pila vacia **/
      @SuppressWarnings("unchecked")
      public ArrayPila(){
        elArray = (E []) new Object[CAPACIDAD_POR_DEFECTO];
        tope = -1;
      }
      
      /** inserta el Elemento e en una Pila, o lo situa en su tope **/
      public void apilar(E e) {
        if ( tope + 1 == elArray.length) duplicarArray();
        tope++;
        elArray[tope] = e;
      }
      // duplica el tamanyo actual de un array
      @SuppressWarnings("unchecked")
      protected void duplicarArray() {
          E nuevoArray[] = (E []) new Object[elArray.length*2];
          System.arraycopy(elArray, 0, nuevoArray, 0, tope);
          elArray = nuevoArray;
      }  
      
      /** SII !esVacia(): obtiene y elimina de una Pila el Elemento que ocupa su tope **/
      public E desapilar(){ 
        E res = elArray[tope];
        tope--;
        return res;
      }
      
      /** SII !esVacia(): obtiene el Elemento que ocupa el tope de una Pila **/
      public E tope(){ 
        return elArray[tope];
      }
      
      /** comprueba si una Pila esta vacia **/
      public boolean esVacia(){
         return ( tope == -1 );
      }
        
      /** obtiene un String con los Elementos de una Pila en orden LIFO **/
      public String toString(){
        String res = "";
        for ( int i = tope; i >= 0; i-- ) res += elArray[i].toString()+"\n";
        return res;
     }
}
