#include <stdio.h>
#include <mpi.h>
int main (int argc, char *argv[])
{
    int k, p; // Rang i nombre del procés

    MPI_Init(&argc, &argv);
    printf("Hello world\n");

    MPI_Comm_rank(MPI_COMM_WORLD, &k);
    MPI_Comm_size(MPI_COMM_WORLD, &p);
    printf("Soc el procés %d de %d\n", k, p - 1);

    MPI_Finalize();
    return 0;
}