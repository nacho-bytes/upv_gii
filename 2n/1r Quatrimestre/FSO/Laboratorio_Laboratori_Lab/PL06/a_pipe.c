// a_pipe.c
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

int main (int argc,char *argv[]) {
    int i;
    char* arguments1 [] = { "ls", "-la", 0 };
    char* arguments2 [] = { "wc", "-l", 0 };
    int fildes[2];
    pid_t pid;
    // Parent process creates a pipe
    if ((pipe(fildes)==-1)) { 
        fprintf(stderr,"Pipe failure  \n");
        exit(-1);
    }
    for (i=0;i<2;i++) {	
        pid=fork(); // Creates a child process
        if ((pid==0) && (i==0)) {
            // Child process redirects its output to the pipe
            
            // Child process closes pipe descriptors 
  
            // Child process changes its memory image
            if ( execvp("ls",arguments1)<0) { 
                fprintf(stderr,"ls not found \n");
                exit(-1);
            }
        } else if ((pid==0) && (i==1)) {
            // Child process redirects its input to the pipe
            
            // Child process closses pipe descriptors

            // Child process changes its memory image
            if (execvp("wc",arguments2)<0) {
                fprintf(stderr,"wc not found \n");
                exit(-1);
            }   
        }
    }

    // Parent process closes pipe descriptors
    close(fildes[0]);
    close(fildes[1]);
    for (i = 0; i < 2; i++) wait(NULL);
    return(0);
}