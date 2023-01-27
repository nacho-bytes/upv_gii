#include <stdio.h>

main() {
  int Datos[5]={1,2,3,4,5}; 
  int i,b; /*variable entera*/
  int *p; /* puntero a entero*/
  
  p=Datos;//p apunta al 1er elemento de Datos
  printf("Datos=%p\n",Datos);
  printf("p=%p\n",p);
  printf("Primer elemento del array Datos[0]=%d ,*p=%d\n",Datos[0],*p);
 
  printf("\n Imprimimos el array completo\n");
  for (i=0; i<5; i++)
    {printf("Datos[%d]=%d\n", i,Datos[i]);
      printf("*p++=%d\n", *p++);
    }  

}

