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
#define NPROD 10
#define NCONS 10

//////////////////////////
int buffer[BUFFERSIZE];
int nItems = 0; 
int entrada = 0;
int salida = 0;
////
sem_t mutex;
sem_t items;
sem_t huecos;
//////////////////////////

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
        sem_wait(&huecos);
        sem_wait(&mutex);
            //Insertar en el buffer el item.
            buffer[entrada] = item;
            entrada = (entrada+1)%BUFFERSIZE;
            //////////////
                int aux = nItems;
                usleep(10);
                aux++;
                nItems = aux;
            //nItems++;
            printf("        Productor. Tamanyo buffer: %d\n", nItems);
                    //////////////
            printf("Produciendo item %d.\n", item);
        sem_post(&mutex);
        sem_post(&items);

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
       
       sem_wait(&items);
       sem_wait(&mutex);
            // Extrae el item del fuffer
            mi_item = buffer[salida];
            salida = (salida+1)%BUFFERSIZE;
            //////////////////////
                int aux = nItems;
                usleep(10);
                aux--;
                nItems = aux;
            //nItems--;
            printf("        Consumidor. Tamanyo buffer: %d\n", nItems);
        sem_post(&mutex);
        sem_post(&huecos);
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
   //
    sem_init(&mutex, 0, 1);
    sem_init(&items, 0, 0);
    sem_init(&huecos, 0, BUFFERSIZE);
   
   
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
