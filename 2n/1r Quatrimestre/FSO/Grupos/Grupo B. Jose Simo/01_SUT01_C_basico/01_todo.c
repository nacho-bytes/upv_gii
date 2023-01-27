 
#include <stdio.h>

#define PI 3.1415926


void tamanyos();
void salidaNumeros(int n, long int nl, float e);
void imprimirTablaASCII();
void propiedadesCirculo(float radio, float *perimetro, float *superficie);
void vectores();

    
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
int main() {

  int mi_n = 28;
  long int mi_nl = 10000000000L;
  float mi_e = 2.71828182;
    
  //salidaNumeros(mi_n, mi_nl, mi_e);
  //tamanyos();
  //imprimirTablaASCII();
  /*******************
  float p;
  float s;
  printf("ANTES: La direccion de memoria de p es %p y la direccion de memoria de s es %p\n", &p, &s);
  propiedadesCirculo(36.78, &p, &s); 
  printf("El perimetro es %f y la superficie es %f\n", p, s);
  *******************/
  vectores();
  
  /***************************
  int num = -1;
  unsigned int unum = num;
  printf("num es %d (en hex es 0x%X) y unum es %u (que en hexadecimal es 0x%X\n", num, num, unum, unum);
  ********************************/
   
}
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////

void vectores() {
    
    int vInt[24];
    for(int i = 0; i< 24 ; i++) {
        vInt[i] = 2*i;
    }
    
    for(int i = 0; i< 24 ; i++) {
        printf("El valor de la posicion %d es %d\n", i, vInt[i]);
    }
    
    printf("La direccion de inicio es %p que debe ser tambien %p\n", vInt, &vInt[0]);
    printf("La direccion del primero es %p y la del segundo es %p\n", &vInt[0], &vInt[1]);
    
    printf("El salto de posiciones es %ld\n", &vInt[1] - &vInt[0]);
    
    long unsigned int d0 = (long unsigned int) &vInt[0];
    long unsigned int d1 = (long unsigned int) &vInt[1];
    
    printf("El salto de direcciones es %ld\n", d1 - d0);
    
}




/**
 * Muestra numeros por pantalla.....
 */
void salidaNumeros(int n, long int nl, float e) {
    
  printf("Hola fSO. Los numeros son n = %04d (que en hexadecimal es 0x%X u en octal %o) e = %2.4f\n", n, n, n, e);
  printf("El numero largo es %ld\n", nl);
  
}

/**
 * 
 */
void tamanyos() {
    
  printf("El tamanyo de \"int\" es %ld\n", sizeof(int));
  printf("El tamanyo de \"int*\" es %ld\n", sizeof(int*));
  printf("El tamanyo de \"long int\" es %ld\n", sizeof(long int));
  printf("El tamanyo de \"long unsigned int\" es %ld\n", sizeof(long unsigned int));
  printf("El tamanyo de \"long int*\" es %ld\n", sizeof(long int*));
  printf("El tamanyo de \"float\" es %ld\n", sizeof(float));
  printf("El tamanyo de \"double\" es %ld\n", sizeof(double));
  
}

/**
 * 
 */
void imprimirTablaASCII() {
    
    for(int i = 33; i< 128; i++) {
         char c = (char) i;
         printf("La entrada %03d corresponde al caracter %c\n", i, c);
    }
}

/**
 * 
 */
void propiedadesCirculo(float radio, float *pperimetro, float *psuperficie) {
    
    printf("DESPUES: La direccion de memoria de p es %p y la direccion de memoria de s es %p\n", pperimetro, psuperficie);
    
    *pperimetro = 2 * PI * radio;
    *psuperficie = PI * radio * radio;
    
}
////////////////////////////// EOF //////////////////////////////////////
/////////////////////////////////////////////////////////////////////////


