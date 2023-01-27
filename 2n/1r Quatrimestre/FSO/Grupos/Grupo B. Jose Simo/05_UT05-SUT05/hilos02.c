/*
 */
#include <stdio.h>
#include <unistd.h>
#include <time.h>
#include <pthread.h>

void *thread_func(void *param) {
  printf("Soy el hilo %d en ejecucion\n", (int)pthread_self());
  usleep(500000);
}

int main (void) {
  struct timespec start, finish;
  double elapsed;
  pthread_t hilo01, hilo02;
  pthread_attr_t attr;
  pthread_attr_init(&attr);
  
  clock_gettime(CLOCK_MONOTONIC, &start);
  
  printf("Arranca hilo hermano 01\n");
  pthread_create(&hilo01,&attr,thread_func,NULL);
  printf("Arranca hilo hermano 02\n");
  pthread_create(&hilo02,&attr,thread_func,NULL);
    
  pthread_join(hilo01,NULL);
  pthread_join(hilo02,NULL);
  
  clock_gettime(CLOCK_MONOTONIC, &finish);
  //elapsed time in milliseconds
  elapsed = (finish.tv_sec - start.tv_sec)*1000.0;
  elapsed += (finish.tv_nsec - start.tv_nsec) / 1000000.0;
  
  printf("---> Termina hilo principal en %f milisegundos.\n", elapsed);
}