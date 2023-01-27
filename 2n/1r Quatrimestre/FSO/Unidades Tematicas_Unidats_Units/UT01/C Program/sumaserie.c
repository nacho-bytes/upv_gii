#include <stdio.h> 

main()
{
	int N; 
	int suma = 0; /* leer numero N */ 
	printf("N: "); 
	scanf("%d", &N); 
	while (N > 0) {
		suma = suma + N; 
		N = N - 1; /* equivale a N-- */
	} 
	printf("1 + 2 +...+ N = %d\n", suma);
}
