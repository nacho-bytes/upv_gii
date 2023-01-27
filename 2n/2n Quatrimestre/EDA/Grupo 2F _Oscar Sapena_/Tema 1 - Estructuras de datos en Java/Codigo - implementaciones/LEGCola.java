package librerias.estructurasDeDatos.lineales;

import librerias.estructurasDeDatos.modelos.*;

public class LEGCola<E> implements Cola<E> {
   
    protected NodoLEG<E> principioC, finalC;
    protected int talla;
    
    /** construye una Cola vacia **/
    public LEGCola(){
        principioC = finalC = null;
        talla = 0;
    }
    
    /** inserta el Elemento e en una Cola, o lo situa en su final **/ 
    public void encolar(E e){
        NodoLEG<E> nuevo = new NodoLEG<E>(e);
        // ATENCIÓN al encolar si this.esVacia():
        // no hay que olvidar actualizar en ese caso principioC
        if ( finalC == null ) principioC = nuevo;
        else finalC.siguiente = nuevo;
        finalC = nuevo;
        talla++;
    }
    
    /** SII !esVacia(): obtiene y elimina de una Cola el Elemento que ocupa su principio **/
    public E desencolar(){
        E datoPI = principioC.dato;
        principioC = principioC.siguiente;
        // ATENCION: actualizar finalC tras desencolar el unico y ultimo Dato de una Cola
        if ( principioC == null ) finalC = null;
        talla--;
        return datoPI;
    }
    
    /** SII !esVacia(): obtiene el Elemento que ocupa el principio de una Cola,  
     *  el primero en orden de insercion **/
    public E primero(){
        return principioC.dato;
    }
    
     /** comprueba si una Cola esta vacia **/
    public boolean esVacia(){
        return ( principioC == null );
    }
    
    /** obtiene un String con los Elementos de una Cola en orden FIFO, o de insercion **/
    public String toString(){
        String res = "";
        for ( NodoLEG<E> aux = principioC ; aux != null; aux = aux.siguiente )
                res += aux.dato.toString()+"|";
        return res;
    }
}