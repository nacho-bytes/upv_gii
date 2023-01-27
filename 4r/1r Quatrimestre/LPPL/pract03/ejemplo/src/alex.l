/*****************************************************************************/
/**  Ejemplo de BISON-II: S E M - 3         2022-2023 <jbenedi@dsic.upv.es> **/
/*****************************************************************************/
%{
#include <stdio.h>
#include <string.h>
#include "header.h"
#include "asin.h"

#define  retornar(x) {if (verbosidad) ECHO; return(x);}
%}
/*-----------------------------------------------------------------------------
  Estas opciones evitan "warnings" innecesarios y permiten obtener el
  numero de linea actual en la variable global "yylineno".
-----------------------------------------------------------------------------*/
%option noinput
%option nounput
%option yylineno

delimitador     [ \t\n]+
digito          [0-9]
entero          {digito}+

%%
{delimitador}  { if (verbosidad) ECHO; }
"+"            { retornar (MAS_);   }
"-"            { retornar (MENOS_); }
"*"            { retornar (POR_);   }
"/"            { retornar (DIV_);   }
"("            { retornar (PARA_);  }
")"            { retornar (PARC_);   }
{entero}       { yylval.cent = atoi(yytext); retornar(CTE_); }
.              { yyerror("Caracter desconocido");            }
%%
