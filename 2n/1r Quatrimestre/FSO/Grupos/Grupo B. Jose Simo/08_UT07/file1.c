
#include <fcntl.h>
int main() 
{
	int fd;
	
	fd=open("kk", O_RDWR|O_CREAT|O_TRUNC,0777);
	close(fd);
	
	
}