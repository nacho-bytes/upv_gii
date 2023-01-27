#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main( int argc, char *argv[] ) {
        int fd;
        char path_command[80];

        sprintf(path_command, "%s", argv[1]);
        
        fd = open( path_command, O_RDONLY );
        if (fd == -1) {
            fprintf(stdout, "error apertura lectura %s", path_command);
        } else {
           fprintf(stdout,"funciona apertura lectura %s\n", path_command);
        }
        fd = open( path_command, O_WRONLY );
        if (fd == -1) {
           fprintf(stdout, "error apertura escritura %s", path_command);
        } else {
           fprintf(stdout,"funciona apertura escritura  %s\n", path_command);
        }
}
