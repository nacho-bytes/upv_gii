#include <stdio.h>
#include <pthread.h>
#include <string.h>
 
void *My_Print (void *ptr) {
    char *message;

    message = (char *) ptr;
    printf("I am a thread and say: %s \n", message);
    sleep(5); 
}

int main() { 
    pthread_t pthread1, pthread2;
    pthread_attr_t attr;
  
    printf("Main thread --> creating threads \n");
    pthread_attr_init(&attr);
    pthread_create(&pthread1, &attr, My_Print, "Hello");
    pthread_create(&pthread2, &attr, My_Print, "World");
    printf("Main thread --> I am sleeping for 5 seconds... \n");
    sleep(5);

    return(0); 

}
