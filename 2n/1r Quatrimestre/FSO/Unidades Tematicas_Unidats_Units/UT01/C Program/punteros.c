#include <stdio.h>

main() {   
  int x; /*variable entera*/
  int y;/*variable entera*/
  int *px; /* puntero a entero*/
  x=5;
  px=&x;/*px=direccion de x*/
  y=*px;/* y contiene el dato apuntado por px*/
 
  printf("x=%d\n",x);
  printf("y=%d\n",y);
  printf("*px=%d\n",*px);   
 printf("px = %p\n", px);   

}

