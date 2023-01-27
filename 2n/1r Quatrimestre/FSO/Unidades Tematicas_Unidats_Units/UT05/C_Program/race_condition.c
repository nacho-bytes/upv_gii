#include <stdio.h>
#include <pthread.h>

int Globalvariable;

void *Addition(void *ptr ) {
    int i, aux_variable;
    int *iter = (int *)ptr;
	
    for (i=0; i < *iter; i++) {
        aux_variable = Globalvariable;
        aux_variable ++;
        Globalvariable = aux_variable;
    }

}  

  
int main() {
    long iterations = 20000000;
   
    pthread_t t1, t2;
    pthread_attr_t attr;
   
    pthread_attr_init(&attr);
     
    pthread_create( &t1, &attr, Addition, &iterations);
    pthread_create( &t2, &attr,Addition, &iterations);
   
    pthread_join(t1, NULL);
    pthread_join(t2, NULL);
   
    printf("Globalvariable= %d\n", Globalvariable);
  
    return 0;
}
  


