/**
 * UPV-DISCA FSO
 * 
 * Problema del productor/consumidor. Seccion critica no sincronizada. 
 * 
 */
#include <stdio.h> 
#include <pthread.h> 
#include <unistd.h> 
#include <semaphore.h>

#define BUFFERSIZE 10 
#define TIEMPOPRODUCIR 10
#define TIEMPOCONSUMIR 1000
#define NPROD 1
#define NCONS 1

//////////////////////////
int buffer[BUFFERSIZE];
int nItems = 0; 
int entrada = 0;
int salida = 0;
////
int llave = 0;
//////////////////////////

////////////////////////////////////////////////////////////
/**
 * Funciones test_and_set u release usando un "spinlock" de Linux
 */
int test_and_set(int *objetivo) {
    
    return (__sync_lock_test_and_set(objetivo, 1));
}
////
void release(int *objetivo) {
    
    __sync_lock_release(objetivo);
}
////////////////////////////////////////////////////////////

////////////////////////////////////////////////////
long getCurrentMicroseconds() {
	struct timespec currentTime;
	clock_gettime(CLOCK_MONOTONIC, &currentTime);
	return (currentTime.tv_sec)*1000000 + (currentTime.tv_nsec) / 1000;
}
////////////////////////////////////////////////////

void *Productor(void *ptr) { 
   //
   printf("Hilo %ld es productor\n", (long)pthread_self());
   //
   int item = 0;
   //
   for(;;) {
        // Producir (simula con un retraso la produccion de un item).
        usleep(TIEMPOPRODUCIR);
        item++;
        //
        while (nItems >= BUFFERSIZE) {;} //Espera activa para hueco
        //Insertar en el buffer el item.
        buffer[entrada] = item;
        entrada = (entrada+1)%BUFFERSIZE;
        //////////////
        while(test_and_set(&llave)){;}
            int aux = nItems;
            usleep(10);
            aux++;
            nItems = aux;
        release(&llave);
        //nItems++;
        printf("        Productor. Tamanyo buffer: %d\n", nItems);
        //////////////
        printf("Produciendo item %d.\n", item);
   }
   //
   return NULL;
}   

void *Consumidor(void *ptr) { 
   //
   printf("Hilo %ld es consumidor\n", (long)pthread_self());
   //
   int mi_item;
   //
   for(;;) {
       
        while (nItems <= 0) {;} //Espera activa para item
        //
        // Extrae el item del fuffer
        mi_item = buffer[salida];
        salida = (salida+1)%BUFFERSIZE;
        //////////////////////
        while(test_and_set(&llave)){;}
            int aux = nItems;
            usleep(10);
            aux--;
            nItems = aux;
        release(&llave);
        //nItems--;
        printf("        Consumidor. Tamanyo buffer: %d\n", nItems);
        //////////////////////
        // Consumir (simula con un retraso el consumo de un item)
        usleep(TIEMPOCONSUMIR);
        printf("                                Consumiendo item %d.\n", mi_item);
   }
   //
   return NULL;
}

////////////////////////////////////////////////////
int main() { 
   int i, niter; 
   pthread_t consumidores[NCONS]; 
   pthread_t productores[NPROD];
   pthread_attr_t attr; 
   pthread_attr_init(&attr); 
   ///////////////
    for (i=0; i <NPROD; i++)  
        pthread_create(&productores[i], &attr, Productor, NULL); 
    for (i=0; i <NCONS; i++)  
        pthread_create(&consumidores[i], &attr, Consumidor, NULL); 
    /////....
    for (i=0; i <NPROD; i++)  
        pthread_join(productores[i], NULL); 
    for (i=0; i <NCONS; i++)  
        pthread_join(consumidores[i], NULL); 
   ////////////////
   return 0; 
}
