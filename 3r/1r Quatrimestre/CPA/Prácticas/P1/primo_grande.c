#include <stdio.h>
#include <math.h>
#include <omp.h>
#include <limits.h>

typedef unsigned long long Entero_grande;
#define ENTERO_MAS_GRANDE  ULLONG_MAX

int primo(Entero_grande n)
{
  volatile int p;
  Entero_grande i, s;

  p = (n % 2 != 0 || n == 2);

  if (p) {
    s = sqrt(n);

   #pragma omp parallel
   { 
    for (i = (omp_get_thread_num() * 2) + 3; p && i <= s; i += omp_get_num_threads() * 2)
      if (n % i == 0) p = 0;
   } 
  }

  return p;
}

int main()
{
  Entero_grande n;

  double t1, t2;

  t1 = omp_get_wtime();
  for (n = ENTERO_MAS_GRANDE; !primo(n); n -= 2) {
    /* NADA */
  }
  t2 = omp_get_wtime();

  printf("El tiempo es %f\n", t2-t1);
  printf("El mayor primo que cabe en %lu bytes es %llu.\n",
         sizeof(Entero_grande), n);

  return 0;
}
