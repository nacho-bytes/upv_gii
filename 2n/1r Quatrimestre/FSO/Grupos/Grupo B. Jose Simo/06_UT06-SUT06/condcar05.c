/**
 * UPV-DISCA FSO
 * 
 * Ejemplo de gestion de la seccion critica mediante "semaphores"
 * 
 */
#include <stdio.h> 
#include <pthread.h> 
#include <unistd.h> 
#include <semaphore.h>

#define NTHREADS 8 
#define ITERACIONES 40000000 
//////////////////////////
int variableCompartida = 0; 
sem_t sem;
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
       sem_wait(&sem);
            aux = variableCompartida; 
            aux++; 
            variableCompartida = aux; 
       sem_post(&sem);
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
   sem_init(&sem, 0, 1);
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
