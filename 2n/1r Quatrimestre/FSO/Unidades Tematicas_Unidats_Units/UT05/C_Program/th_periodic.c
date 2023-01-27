#include <pthread.h> 
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

void *func_period(void *arg) {
    int period, i;
    period = *((int *)arg); 
    for (i=0; i<10; i++) {
        printf("Pthread (period %d): ", period);
        printf("%ld \n", (long)pthread_self()); 
        sleep (period);
    } 
}


int main () {
    pthread_t t1,t2; 
    pthread_attr_t attr; 
    int period1 = 1;
    int period2 = 2;

    if (pthread_attr_init(&attr) != 0) { 
        printf("Error: atributtes \n");   
        exit(1);
    }

    if (pthread_create(&t1, &attr, func_period, &period1) != 0) { 
        printf("Error: creating first pthreas \n");
        exit(1);
    }
    if (pthread_create(&t2, &attr, func_period, &period2) != 0) { 
        printf("Error: creating second pthread \n");
        exit(1);
    }
    pthread_join(t1, NULL);
    pthread_join(t2, NULL);
}


