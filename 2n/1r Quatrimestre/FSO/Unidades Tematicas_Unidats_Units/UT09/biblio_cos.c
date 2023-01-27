#include <stdio.h>
#include <errno.h>
#include <malloc.h>
#include <stdlib.h>
#include <math.h>


char path_maps_global[80];


int main()
{ /***variables locales sin inicializar***/
   char path_maps[80];
   int   p=45;
   float  f;

  /** Construye orden para mostrar MAPA MEMORIA**/
  sprintf(path_maps,"cat /proc/%d/maps",getpid());
  

 printf("Direccion de  MAIN:\n   %p, \n",main);

 printf("VARIABLES LOCALES (MAIN)\n");
 printf("  NO INICIALIZADA:   path_maps %p\n",path_maps);
 printf("  NO INICIALIZADA:    f       %p\n",&f);
 printf("   INICIALIZADA:       p       %p\n", &p);   
 
 
 printf ("\n\n ANTES DE REALIZAR LA OPERACIÓN MATEMÁTICA\n");
 printf(" MAPA DE MEMORIA DEL PROCESO /proc/%d/maps \n", getpid());

  /** LLamada al sistema para ejecutar orden**/
  system(path_maps);

  /** Operación matematica ***/
   f=cos(p);
   printf("El resultado de la operación matematica es: %f\n", f);
   

 printf ("\n\n DESPUES DE REALIZAR LA OPERACIÓN MATEMÁTICA\n");
 printf(" MAPA DE MEMORIA DEL PROCESO /proc/%d/maps \n", getpid());

  /** LLamada al sistema para ejecutar orden**/
  system(path_maps);

  
} 
