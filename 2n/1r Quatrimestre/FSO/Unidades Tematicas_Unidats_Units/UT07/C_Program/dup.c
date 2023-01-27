#include <sys/types.h>
#include <sys/stat.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>

#define NEWFILE (O_WRONLY | O_CREAT | O_EXCL)
#define MODE644 (S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH)

int redirect_output(const char *file) {
    int fd;
    if ((fd = open(file, NEWFILE, MODE644)) == -1) return -1;
    //if ( dup2(fd, STDOUT_FILENO) == -1) return -1;
	close(STDOUT_FILENO);
	if (dup(fd) == -1) exit(0);
    close (fd);
    return 0;
}

int main(int argc, char *argv[]) {
    int from_fd, to_fd;
    if (argc < 3) {
        fprintf(stderr, "Usage: %s to_file command args\n", argv[0]);
        exit(1);
    }
    if ( redirect_output(argv[1]) == -1) {
        fprintf(stderr, "Could not redirect output to: %s\n", argv[1]);
        exit(1);
    }
    if ( execvp(argv[2], &argv[2]) < 0) {
        fprintf(stderr, "Could not execute: %s\n", argv[2]);
        exit(1);
    }
    return 0;
}
 