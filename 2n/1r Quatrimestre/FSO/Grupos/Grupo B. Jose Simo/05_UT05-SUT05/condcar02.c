/**
 * 
 */
#include <stdio.h> 
#include <pthread.h> 
#include <unistd.h> 

#define NTHREADS 8 
#define ITERACIONES 40000000 
//////////////////////////
int variableCompartida = 0; 
int control = 0;
//////////////////////////

void *Incremento(void *ptr) { 
   int i, aux; 
   int iter = *(int *)ptr; 
    
   printf("Hilo %ld haciendo %d iteraciones\n", (long)pthread_self(), iter);
   for (i=0; i<iter; i++){ 
       while (__sync_lock_test_and_set(&control, 1)) {;} 
        aux = variableCompartida; 
        aux++; 
        variableCompartida = aux; 
       __sync_lock_release(&control); 
   } 
   printf("Hilo %ld terminando\n", (long)pthread_self());
   return NULL;
}   

int main() { 
   int i, niter; 
   pthread_t t[NTHREADS]; 
   pthread_attr_t attr; 
   pthread_attr_init(&attr); 
    
   niter = ITERACIONES / NTHREADS; 
    
   for (i=0; i <NTHREADS; i++)  
       pthread_create(&t[i], &attr, Incremento, &niter); 
        
   for (i=0; i <NTHREADS; i++)  
       pthread_join(t[i], NULL); 

   printf("Variable global compartida= %d\n", variableCompartida); 

   return 0; 
}
