/**
 * UPV-DISCA FSO
 * 
 * Ejemplo de gestion de la seccion critica mediante "posix mutex"
 * 
 */
#include <stdio.h> 
#include <pthread.h> 
#include <unistd.h> 

#define NTHREADS 8 
#define ITERACIONES 40000000 
//////////////////////////
int variableCompartida = 0; 
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
//////////////////////////

////////////////////////////////////////////////////
long getCurrentMicroseconds() {
	struct timespec currentTime;
	clock_gettime(CLOCK_MONOTONIC, &currentTime);
	return (currentTime.tv_sec)*1000000 + (currentTime.tv_nsec) / 1000;
}
////////////////////////////////////////////////////

void *Incremento(void *ptr) { 
   int i, aux; 
   int iter = *(int *)ptr; 
    
   printf("Hilo %ld haciendo %d iteraciones\n", (long)pthread_self(), iter);
   for (i=0; i<iter; i++){ 
        pthread_mutex_lock(&mutex);
            aux = variableCompartida; 
            aux++; 
            variableCompartida = aux; 
       pthread_mutex_unlock(&mutex);
   } 
   printf("Hilo %ld terminando\n", (long)pthread_self());
   return NULL;
}   

////////////////////////////////////////////////////
int main() { 
   int i, niter; 
   pthread_t t[NTHREADS]; 
   pthread_attr_t attr; 
   pthread_attr_init(&attr); 
   long start, finish;
   //
   niter = ITERACIONES / NTHREADS; 
   //
   start = getCurrentMicroseconds();
   ///////////////
        for (i=0; i <NTHREADS; i++)  
            pthread_create(&t[i], &attr, Incremento, &niter); 
                
        for (i=0; i <NTHREADS; i++)  
            pthread_join(t[i], NULL); 
   ////////////////
   finish = getCurrentMicroseconds();
   //

   printf("Variable global compartida= %d en %ld microsegundos\n", variableCompartida, finish-start); 
   return 0; 
}
