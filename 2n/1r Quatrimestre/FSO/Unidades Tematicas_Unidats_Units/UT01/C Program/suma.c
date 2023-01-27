#include <stdio.h>

int main(int argc, char *argv[]) {   
  int sum1, sum2;
  
  if (argc==3)
    {
      sum1=atoi(argv[1]);
      sum2=atoi(argv[2]);
      printf("La suma es %d\n", sum1+sum2);
    }  
  else 
    {   
     printf("Uso orden: %s arg1 arg2 \n", argv[0]); 
    }
}

