#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>

void manejador(int sig) {
    //
    printf("Manejador de la senyal %d.\n", sig);
    //printf("Saliendo del programa...\n");
    //exit(0);
}

int main() {
     
    struct sigaction sg;
    sg.sa_handler = manejador;
    sg.sa_flags = 0;
    
    sigaction(SIGINT, &sg, NULL);

    for(;;) {
        int retval = usleep(1000000);
        printf("Ha salido de usleep. Retval = %d\n", retval);
    }
}