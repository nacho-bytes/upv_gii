/*****************************************************************************/
/**  ARCHIVO FLEX                              2022-2023 Iñaki Diez Lambies **/
/*****************************************************************************/
%{
#include <stdio.h>
#include <string.h>
#include "header.h"
#include "asin.h"

#define  retornar(x) {if (verbosidad) ECHO; return(x); }
%}
/*-----------------------------------------------------------------------------
  Estas opciones evitan "warnings" innecesarios y permiten obtener el
  numero de linea actual en la variable global "yylineno".
-----------------------------------------------------------------------------*/
%option noinput       
%option nounput       
%option yylineno  

delimitador    [ \t\n]+
digito         [0-9]
entero         {digito}+
real           {entero}?[.]{entero}
id             ([A-Z][A-Z0-9_]*)|([a-z][a-z0-9_]*)
comentario     \/\/.*\n

%%
{delimitador}  { if (verbosidad) ECHO; }
{comentario}   { if (verbosidad) ECHO; }

"="            { retornar (ASI_);   }
"+"	           { retornar (MAS_);   }
"-"            { retornar (MENOS_); }
"*"            { retornar (POR_);   }
"/"            { retornar (DIV_);   }
"("            { retornar (APAR_);  }
")"            { retornar (CPAR_);  }

"&&"           { retornar (AND_);   }
"||"           { retornar (OR_);    }
"!"            { retornar (NOT_);   }
"=="           { retornar (IGU_);   }
"!="           { retornar (DIF_);   }
">"            { retornar (MAY_);   }
"<"            { retornar (MEN_);   }
">="           { retornar (MAYIGU_);}
"<="           { retornar (MENIGU_);}

true           { retornar (TRU_);   }
false          { retornar (FAL_);   }

int            { retornar (INT_);   }
bool           { retornar (BOOL_);  }

if             { retornar (IF_);    }
else           { retornar (ELSE_);  }
for            { retornar (FOR_);   }
return         { retornar (RET_);   }
read           { retornar (READ_);  }
print          { retornar (PRINT_); }
"["            { retornar (ACOR_);  }
"]"            { retornar (CCOR_);  }
"{"            { retornar (ALLA_);  }
"}"            { retornar (CLLA_);  }
","            { retornar (COMA_);  }
";"            { retornar (PCOM_);  }

{entero}       { retornar (CTE_);   }
{real}         { retornar (CTE_);   }
{id}           { retornar (ID_);    }
.	       { yyerror("Caracter desconocido"); }
%%
/*****************************************************************************/
