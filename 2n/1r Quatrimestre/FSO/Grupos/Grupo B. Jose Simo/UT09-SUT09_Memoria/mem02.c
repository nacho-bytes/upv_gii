 /**
  * FSO. ETSINF-UPV (c)
  * Observacion de la ubicacion en espacio de memoria logico de 
  * diferentes elementos de un proceso.
  */

#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>



int global1;
int global2;

/*
 * Muestra el mapa de memoria del proceso actual
 */
void muestra_mapa_mem() {

    char orden[80];
    //Construye orden para mostrar MAPA 
    sprintf(orden,"cat /proc/%d/maps",getpid());  
    system(orden);

}

/////////////////////////////////////////////////////////////////////////////////////
void f1() {
    int x, y;
    x = 1;
    y = 1;
    //z = 1;
    printf("Direccion variable local x en f1 (en la pila):\t\t%p\n", &x);
    printf("Direccion variable local y en f1 (en la pila):\t\t%p\n", &y);
    //printf("Direccion variable local z en f1 (en la pila):\t\t%p\n", &z);
}

void f2() {
    int x,y,z;
    x = 1;
    y = 1;
    z = 1;
    printf("Direccion variable local x en f2 (en la pila):\t\t%p\n", &x);
    printf("Direccion variable local y en f2 (en la pila):\t\t%p\n", &y);
    printf("Direccion variable local z en f2 (en la pila):\t\t%p\n", &z);
}


int main() {
 
    int i,j;
    //
    printf("Direccion variable global1:\t%p\n", &global1);
    printf("Direccion variable global2:\t%p\n", &global2);
    //
    printf("Direccion funcion f1:\t\t%p\n", f1);
    printf("Direccion funcion f2:\t\t%p\n", f2);
    printf("Direccion funcion main:\t\t%p\n", main);
    //
    printf("Direccion variable local i en main (en la pila):\t%p\n", &i);
    printf("Direccion variable local j en main (en la pila):\t%p\n", &j);
    //
    f1();
    f2();
    printf("******************************************\n");
    f1();
    f2();
    printf("******************************************\n");
    muestra_mapa_mem();
    
}
