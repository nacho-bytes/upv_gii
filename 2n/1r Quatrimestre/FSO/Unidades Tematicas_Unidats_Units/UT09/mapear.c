#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/types.h>


int main (int argc, char *argv[]) 
{
  int          fd;
  void        *mapeo;
  struct stat  stadbuf;
  char         path_maps[80];

  if (argc != 2) {
    fprintf(stderr, "Usage: mapear <filename>\n");
    exit(-1);
  } // end if

  if ((fd = open(argv[1], O_RDONLY)) < 0) {
    error("Can not map archive\n");
  } // end if
  
  // get archive size
  fstat(fd, &stadbuf);

  // show map command
  sprintf(path_maps, "cat /proc/%d/maps", getpid());

  // show map
  printf("PROCESS MEMORY MAP /proc/%d/maps\n", getpid());
  printf("--------------------------------------------------\n");
  system(path_maps); // call command

  // maps archive
  if ((mapeo = mmap(0, stadbuf.st_size, PROT_READ, MAP_SHARED, fd, 0)) == MAP_FAILED) {
    error("Fail to map archive\n");
  } // end if

  // show map again
  printf("ARCHIVE MEMORY MAPPED\n");
  printf("--------------------------------------------------\n");
  system(path_maps); // call command

  // unmap
  munmap(mapeo, stadbuf.st_size);

  // show map again again
  printf("ARCHIVE UNMAPPED\n");
  printf("--------------------------------------------------\n");
  system(path_maps); // call command
  
  // bye
  exit(0);

} // end main()
