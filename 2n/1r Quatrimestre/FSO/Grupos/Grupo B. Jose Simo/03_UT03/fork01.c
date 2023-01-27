#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <sys/types.h>
/**
 * 
 * 
 */
void ej00() {

    int v = 101;
    printf("----El pid de este proceso es %ld. La variable: %d\n",(long)getpid(), v);  
    
    int pid = fork();
    
    if (pid == 0) {
        // PROCESO HIJO
        //sleep(2);
        printf("H--> El valor de retono del fork ha sido %d. La variable: %d\n", pid, v);
        v = 1000;
        printf("H--> La variable: %d\n", v);
        printf("H--> Soy el proceso hijo, mi pid es: %ld y el de mi padre es: %ld\n", (long)getpid(), (long)getppid());
        sleep(1);
    } else {
        // PROCESO PADRE
        printf("P--> El valor de retono del fork ha sido %d. La variable: %d\n", pid, v);
        v = 3000;
        sleep(2);
        printf("P--> La variable: %d\n", v);
        printf("P--> Soy el proceso padre, mi pid es: %ld y el de mi padre es: %ld\n",(long)getpid(), (long)getppid());
        sleep(1);
    }
}

/**
 * 
 * 
 */
void ej01() {

    int v = 101;
    printf("----El pid de este proceso es %ld. La variable: %d\n",(long)getpid(), v);  
    
    int pid = fork();
    
    switch(pid) {
        case -1:
            // ERROR
            perror("Error creando proceso");
            break;
        case 0:
            // PROCESO HIJO
            printf("H--> Soy el proceso hijo, mi pid es: %ld y el de mi padre es: %ld\n", (long)getpid(), (long)getppid());
            sleep(1);
            break;
        default:
            // PROCESO PADRE
            printf("P--> Soy el proceso padre, mi pid es: %ld y el de mi padre es: %ld\n",(long)getpid(), (long)getppid());
            sleep(1);
    }
}

/**
 * 
 * 
 */
void ej02() {

    int nproc = 4;

    for (int i=0; i<nproc; i++) {
        ////////////////
        int pid = fork();
        ////////////////
        if (pid!=0) {
            //PADRE
            continue;
        } else {
            //HIJO
            printf("Soy: %ld y mi padre: %ld\n", (long)getpid(), (long)getppid());
            sleep(1);
            printf("Acabando: %ld\n", (long)getpid());
            break;
        }
    }
    sleep(2);
}

/**
 * 
 * 
 */
void ej03() {

    int nproc = 4;

    for (int i=0; i<nproc; i++) {
        ////////////////
        int pid = fork();
        ////////////////
        if (pid!=0) {
            //PADRE
            printf("Soy: %ld y mi padre: %ld\n", (long)getpid(), (long)getppid());
            sleep(1);
            printf("Acabando: %ld\n", (long)getpid());
            break;
        } else {
            //HIJO
            continue;
        }
    }
    sleep(2);
}

/**
 * 
 * 
 */
void ej04() {

    
    int pid = fork();
    
    switch(pid) {
        case -1:
            // ERROR
            perror("Error creando proceso");
            break;
        case 0:
            // PROCESO HIJO
            printf("H--> Soy el proceso hijo, mi pid es: %ld y el de mi padre es: %ld\n", (long)getpid(), (long)getppid());
            if ( execl("/bin/ls", "ls", "-l", NULL) == -1) {
                perror("Error en exec.");
            }
            printf("Acabando: %ld\n", (long)getpid());
            break;
        default:
            // PROCESO PADRE
            printf("P--> Soy el proceso padre, mi pid es: %ld y el de mi padre es: %ld\n",(long)getpid(), (long)getppid());
            sleep(1);
    }
}

/**
 * 
 * 
 */
void ej05() {

    
    int pid = fork();
    
    switch(pid) {
        case -1:
            // ERROR
            perror("Error creando proceso");
            break;
        case 0:
            // PROCESO HIJO
            printf("H--> Soy el proceso hijo, mi pid es: %ld y el de mi padre es: %ld\n", (long)getpid(), (long)getppid());
            if ( execl("/bin/lss", "ls", "-l", NULL) == -1) {
                perror("Error en exec.");
            }
            printf("Acabando: %ld\n", (long)getpid());
            exit(3);
            break;
        default:
            // PROCESO PADRE
            printf("P--> Soy el proceso padre, mi pid es: %ld y el de mi padre es: %ld\n",(long)getpid(), (long)getppid());
            int retval;
            waitpid(pid,&retval, 0);;
            printf("Hijo terminado con codigo de retorno: %d\n", retval>>8);
    }
}

/**
 * 
 * 
 */
void ej06() {

    int nproc = 4;
    int pids[nproc];
    
    for (int i=0; i<nproc; i++) {
        ////////////////
        pids[i] = fork();
        ////////////////
        if (pids[i] !=0) {
            //PADRE
            continue;
        } else {
            //HIJO
            printf("Soy: %ld y mi padre: %ld\n", (long)getpid(), (long)getppid());
            sleep(1);
            printf("Acabando: %ld\n", (long)getpid());
            exit(i);
            break;
        }
    }
    for (int i=0; i<nproc; i++) {
        int status;
        waitpid(pids[i], &status, 0);
        printf("Hijo terminado con codigo de retorno: %d\n", status>>8);
    }
}



int main() {
    
    //ej00();
    //ej01();
    //ej02();
    //ej03();
    //ej04();
    //ej05();
    //ej06();
    
}
