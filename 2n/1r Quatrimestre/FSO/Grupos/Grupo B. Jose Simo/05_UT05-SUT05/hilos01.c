/*
 */
#include <stdio.h>
#include <unistd.h>
#include <time.h>
#include <pthread.h>

void *thread_func(void *param) {
  printf("Soy el hilo %d en ejecucion\n", (int)pthread_self());
  usleep(500000);
  printf("Soy el hilo %d que acaba\n", (int)pthread_self());
}

int main (void) {

  pthread_t hilo01, hilo02;
  pthread_attr_t attr;
  pthread_attr_init(&attr);
  
  printf("Arranca hilo hermano 01\n");
  pthread_create(&hilo01,&attr,thread_func,NULL);
  printf("Arranca hilo hermano 02\n");
  pthread_create(&hilo02,&attr,thread_func,NULL);
    
  pthread_join(hilo01,NULL);
  pthread_join(hilo02,NULL);
  
  printf("---> Termina hilo principal.\n");
}