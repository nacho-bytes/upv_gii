/*****************************************************************************/
/**  Ejemplo de BISON-II: S E M - 3         2022-2023 <jbenedi@dsic.upv.es> **/
/*****************************************************************************/
%{
#include <stdio.h>
#include <string.h>
#include "header.h"
%}

%union {/********************************************************************/
  int   cent;                 /* Para el terminal "cte" entera              */
}/***************************************************************************/

%token PARA_ PARC_ MAS_ MENOS_ POR_ DIV_
%token <cent> CTE_ 
%type  <cent> exp term fac

%%

expMat : exp
         { printf("\nValor de la expresion = %d\n",$1); }
       ;
exp    : exp MAS_ term    { $$ = $1 + $3; }
       | exp MENOS_ term  { $$ = $1 - $3; }
       | term             { $$ = $1;      }
       ;
term   : term POR_ fac    { $$ = $1 * $3; }
       | term DIV_ fac    { $$ = $1 / $3; }
       | fac              { $$ = $1;      }
       ;
fac    : PARA_ exp PARC_  { $$ = $2;      }
       | CTE_             { $$ = $1;      }
       ;
%%
