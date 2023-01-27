/*****************************************************************************/
/**  Ejemplo de FLEX: S E M - 1           2022-2023 <jmbenedi@prhlt.upv.es> **/
/*****************************************************************************/
/*****************************************************************************/
#ifndef _HEADER_H
#define _HEADER_H

/****************************************************** Constantes generales */
#define TRUE  1
#define FALSE 0
/************************************* Variables externas definidas en el AL */
extern int yylex();

extern FILE *yyin;
extern int   yylineno;
extern char *yytext;                         /* Patron detectado             */
/********* Funciones y variables externas definidas en el Programa Principal */
extern void yyerror(const char * msg) ;      /* Tratamiento de errores       */

extern int verbosidad;                   /* Flag si se desea una traza       */
extern int numErrores;                   /* Contador del numero de errores   */

#endif  /* _HEADER_H */
/*****************************************************************************/
/*****************************************************************************/
