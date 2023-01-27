package librerias.estructurasDeDatos.lineales;

import  librerias.estructurasDeDatos.modelos.*; 

public class LEGPila<E> implements Pila<E> {
        
      protected NodoLEG<E> tope;
      protected int talla;

      /** crea una Pila vacía **/
      public LEGPila(){
          tope = null;
          talla = 0;
      }
      
      /** inserta el Elemento e en una Pila, o lo situa en su tope **/
      public void apilar(E e){
          tope = new NodoLEG<E>(e, tope);
          talla++;
      }
      
      /** SII !esVacia(): obtiene y elimina de una Pila el Elemento que ocupa su tope **/
      public E desapilar(){
           E datoPI = tope.dato;
           tope = tope.siguiente;
           talla--;
           return datoPI;
      }
      
      /** SII !esVacia(): obtiene el Elemento que ocupa el tope de una Pila **/
      public E tope(){
           return tope.dato;
      }
      
      /** comprueba si una Pila esta vacia **/
      public boolean esVacia(){
           return ( tope == null );
      }
      
      /** obtiene un String con los Elementos de una Pila en orden LIFO, inverso al de insercion **/
      public String toString(){
           String res = "";
           NodoLEG<E> aux; 
           for ( aux = tope ; aux != null; aux = aux.siguiente)
                res += aux.dato.toString()+"|";
           return res;
      }
}

