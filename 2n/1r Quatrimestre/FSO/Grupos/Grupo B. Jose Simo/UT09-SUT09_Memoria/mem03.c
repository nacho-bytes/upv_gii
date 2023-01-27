 /**
  * FSO. ETSINF-UPV (c)
  * Observacion de la ubicacion en espacio de memoria logico de 
  * diferentes elementos de un proceso.
  * Fichero proyectado con "mmap".
  */

#include <sys/types.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>


void error (char * mensaje) {

    perror(mensaje);
    exit(EXIT_FAILURE);
}

/*
 * Muestra el mapa de memoria del proceso actual
 */
void muestra_mapa_mem() {

    char orden[80];
    //Construye orden para mostrar MAPA 
    sprintf(orden,"cat /proc/%d/maps",getpid());  
    system(orden);
}



int main (int argc,char *argv[]) {

    int fd;
    void *mapeo;
    struct stat stadbuf;
    char path_maps[80];

    //Abrir el archivo a ser mapeado
    if (argc!=2) {
        puts("Usar: mapear NombreArchivo\n");
        exit(EXIT_FAILURE) ;
    }
    if ((fd=open(argv[1],O_RDONLY))<0) {
        error("Fallo en la apertura (open)\n");
    }

    //Obtener la longitud del archivo a mapear
    fstat(fd, &stadbuf); 
    //fstat vuelca su informacion en estadobuf

    //MOSTRAR MAPA
    printf(" MAPA MEMORIA PROCESO /proc/%d/maps \n", getpid());
    muestra_mapa_mem();
    
    //Mapear el archivo de entrada
    if ((mapeo = mmap(0,stadbuf.st_size,PROT_READ,MAP_SHARED,fd,0))== MAP_FAILED) {
        error("Fallo al mapear (open)");
    }
    close(fd); //cierro fichero 

    //MOSTRAR MAPA
    printf ("\n\n FICHERO MAPEADO EN MEMORIA\n");
    muestra_mapa_mem(); 
   
    /////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////
    // Bucle de acceso al fichero proyectado
    char *p = mapeo;
    int contador=0;
    char caracter = 'c';
    for (int i = 0; i < stadbuf.st_size; i++) {
        if (*p++ == caracter) { 
            contador++;
        }
    }
    printf("\n\n\nEl carcater %c aparece %d veces en el archivo %s\n\n\n", caracter, contador, argv[1]);
    /////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////
    
    //Elimino mapeo
    munmap(mapeo,stadbuf.st_size); 
   
    //MOSTRAR MAPA
    printf ("\n\n ELIMINADO EL MAPEO DEL FICHERO EN MEMORIA\n");
    muestra_mapa_mem();
    
    exit(EXIT_SUCCESS);

}/***Fin de main**/



    
