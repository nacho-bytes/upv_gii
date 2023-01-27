#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>
#include <errno.h>

int main(int argc, char *argv[])
{
  DIR *dirp;
  struct dirent *direntp;
  if (argc != 2){
    fprintf(stderr, "Usage: %s directory_pathname\n", argv[0]);
    exit(1);
  }
  if ((dirp = opendir(argv[1])) == NULL){
   fprintf(stderr, "Could not open %s directory_pathname: %s\n", argv[1], strerror(errno));
   exit(1);
  }
  
  while ( (direntp = readdir(dirp)) != NULL) {
    printf("*************************************\n");
    printf("NOMBRE: %s\n", direntp->d_name);
    printf("TYPE: 0x%08X\n", direntp->d_type);
    printf("iNODE: %ld\n", (long) direntp->d_ino);
  }

  closedir(dirp);
  exit(0);  
}
