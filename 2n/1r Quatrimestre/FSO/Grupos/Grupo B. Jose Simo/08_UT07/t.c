#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>

int main(int argc, char * argsv[])
{
        printf("Hola cara huevo (%d)\n",argc);

    int tubo[2];

    if (argc < 2) exit(1);
    pipe(tubo);
        printf("sitio 1\n");
    if(fork())
    { //p
        dup2(tubo[1],1);
        close(tubo[0]);
        close(tubo[1]);
        execlp("cat", "cat", argsv[1],NULL);

        printf("error en cat\n");
        exit(1);
    } else { //h
        dup2(tubo[0],0);
        close(tubo[0]);
        close(tubo[1]);
        execlp("sort","sort",NULL);
        printf("error en sort\n");
        exit(1);
    }

}

