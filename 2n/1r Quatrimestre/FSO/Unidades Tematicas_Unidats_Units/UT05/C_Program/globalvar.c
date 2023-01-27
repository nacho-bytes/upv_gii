#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int Globalvariable;
  
int main() {
    int i;
    long iterations = 40000000;

    for (i=0; i < iterations; i++){
        Globalvariable++;
    }
   
    printf("Globalvariable = %d\n", Globalvariable);
  
    return 0;
}
  


