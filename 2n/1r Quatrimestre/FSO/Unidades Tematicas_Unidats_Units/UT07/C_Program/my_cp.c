#include <sys/stat.h>
#include <stdio.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>

#define BLKSIZE 1
#define NEWFILE (O_WRONLY| O_CREAT | O_EXCL)
#define MODE600 (S_IRUSR | S_IWUSR)

main(int argc, char *argv[]) {
    int from_fd, to_fd;
    int count;
    char buf[BLKSIZE];
    if (argc != 3) {
        fprintf(stderr, "Usage: %s from_file to_file\n", argv[0]);
        exit(1);
    }
    if ( (from_fd = open(argv[1], O_RDONLY)) == -1) {
        fprintf(stderr, "Could not open %s: %s\n", argv[1],strerror(errno));
        exit(1);
    }
    if ( (to_fd = open(argv[2], NEWFILE,MODE600)) == -1) {
        fprintf(stderr, "Could not create %s: %s\n", argv[2],strerror(errno));
        exit(1);
    }
    while ( (count= read(from_fd, buf, sizeof(buf))) >0 ) {
        if (write(to_fd, buf, count) != count){
            fprintf(stderr,"Could not write %s: %s\n", argv[2],strerror(errno));
            exit(1); 
        }
    }
    if (count==-1) {
        fprintf(stderr, "Could not read %s: %s\n", argv[1],strerror(errno));
        exit(1); 
    }
    close(from_fd);
    close(to_fd);
    exit(0);
}
