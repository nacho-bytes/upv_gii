#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>

#define CREATE (O_RDWR | O_CREAT | O_TRUNC)
#define PERM664 (S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH  )

int main(int argc, char *argsv[])
{
    char nombre[]="fichero1";
    char mensaje[]="0123456789";
    char buf[11];
    int fd1,fd2;
    int pid;
    
    //printf("%o\n",PERM664);
    
    fd1=open(nombre,CREATE,PERM664);
    fd2=open(nombre,O_RDONLY);
    
    if((pid=fork())!=0)
    {
       write(fd1,mensaje,11);
       close(fd1);close(fd2);
    } 
    else
    {
      read(fd2,buf,11);
      close(fd1);close(fd2);
      printf("%s\n",buf);
    }

}