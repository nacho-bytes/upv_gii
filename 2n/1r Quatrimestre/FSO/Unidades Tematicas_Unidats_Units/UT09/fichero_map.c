
/* Cuenta el número de apariciones de un carácter en un archivo */
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>

int main(int  argc, char **argv)
{
        int i, fd, contador=0;
        char caracter;
        char *org, *p;
        struct stat bstat;
		char path_maps[80];

        if (argc!=3) { 
	  fprintf (stderr, "Uso: %s caracter archivo\n", argv[0]);
        	return(1);}

/* Por simplicidad, se supone que el carácter a contar corresponde
           con el primero del primer argumento */
        caracter=argv[1][0];

        /* Abre el archivo para lectura */
        if ((fd=open(argv[2], O_RDONLY))<0)
        {       perror("No puede abrirse el archivo");
                return(1);
        }
 
	
/* Averigua la longitud del archivo */
        if (fstat(fd, &bstat)<0)
        {       perror("Error en fstat del archivo");
                close(fd);
                return(1);
        }

		printf("El fichero a proyectar en memoria es: %s\n", argv[2]);
		printf("El tamanyo del fichero a proyectar es de %d bytes \n", bstat.st_size);
 
   

  /** Construye orden para mostrar MAPA MEMORIA**/
  sprintf(path_maps,"cat /proc/%d/maps",getpid());
   
 printf ("\n\n ANTES DE MAPEAR FICHERO EN MEMORIA\n");
 printf(" MAPA DE MEMORIA DEL PROCESO /proc/%d/maps \n", getpid());

  /** LLamada al sistema para ejecutar orden**/
  system(path_maps);


/* Se proyecta el archivo */
        if ((org = mmap((caddr_t) 0, bstat.st_size, PROT_READ,
             MAP_SHARED, fd, 0)) == MAP_FAILED)
        {       perror("Error en la proyeccion del archivo");
                close(fd);
                return(1);
        }

/* Se cierra el archivo */
        close(fd);

/**MOSTRAR MAPA**/
 printf ("\n\n FICHERO MAPEADO EN MEMORIA\n");
 printf(" MAPA DE MEMORIA DEL PROCESO /proc/%d/maps \n", getpid());

  /** LLamada al sistema para ejecutar orden**/
  system(path_maps);


/* Se accede al contenido del fichero con si **/
  /** si estuviese en memoria */
        
        for (i=0; i<bstat.st_size; i++)
                if (org[i]==caracter)
                        contador++;
/* Se elimina la proyeccion */
        munmap(org, bstat.st_size);

 /**MOSTRAR MAPA**/
  printf ("\n\n ELIMINADO EL MAPEO DEL FICHERO EN MEMORIA\n");
   printf(" MAPA DE MEMORIA DEL PROCESO /proc/%d/maps \n", getpid());

  /** LLamada al sistema para ejecutar orden**/
  system(path_maps);

        printf("NUMERO DE CARACTERES ENCONTRADOS %d\n", contador);
        return(0);
}

