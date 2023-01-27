#include <stdio.h>

int mayor(int  x, int y);


main()
{ int num;
  num= mayor (10,2);
  printf("mayor (10,2) = %d \n", num);
}

int mayor(int  x, int y)
{int temp;
  temp=-1;
  if (x>y)  temp=x;
  if (y>x)  temp=y;
  return temp;
}
  
