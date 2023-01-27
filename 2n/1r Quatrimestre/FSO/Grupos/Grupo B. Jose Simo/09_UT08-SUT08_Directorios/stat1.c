#include <sys/stat.h>
#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <time.h>


int main(int argc, char *argv[])
{
  struct stat statbuf;

  if (argc != 2) {
    fprintf(stderr, "Usage: %s filename\n", argv[0]);
    exit(1);
  }

  if ( (stat(argv[1], &statbuf)) == -1) {
    fprintf(stderr, "Could not get stat on file %s: %s\n", argv[1],strerror(errno));
    exit(1);
  }
   printf("*************************************\n");
   printf("USUARIO: %d\n", statbuf.st_uid);
   printf("GRUPO: %d\n", statbuf.st_gid);
   printf("MODO: Octal: %o\n", statbuf.st_mode);
   printf("TAMANYO: %lld\n", statbuf.st_size);
   printf("N LINKS: %d\n", statbuf.st_nlink);
   printf("... ...\n ");   
   printf("*************************************\n ");

  if (statbuf.st_mode & S_IFDIR) {
    printf("%s is a directory: ", argv[1]);
    printf("last modfied at %s\n", ctime(&statbuf.st_mtime));
  } else
    printf("%s is not a directory\n", argv[1]);

  exit(0);
}
