/*****************************************************************************/
/**  ARCHIVO BISON                             2022-2023 Iñaki Diez Lambies **/
/*****************************************************************************/
%{
#include <stdio.h>
#include <string.h>
#include "header.h"
%}

/* Operadores matemáticos */
%token APAR_ CPAR_ 
%token ASI_ MAS_ MENOS_ POR_ DIV_
/* Operadores lógicos */
%token AND_ OR_ NOT_
%token IGU_ DIF_
%token MAY_ MEN_ MAYIGU_ MENIGU_
/* Constantes */
%token CTE_ TRU_ FAL_
%token ID_
/* Tipado */
%token INT_ BOOL_
/* Operadores */
%token IF_ ELSE_ FOR_ RET_
%token READ_ PRINT_
%token ACOR_ CCOR_ ALLA_ CLLA_
%token COMA_ PCOM_
%%
programa      : listDecla
              ;
listDecla     : decla
              | listDecla decla
              ;
decla         : declaVar
              | declaFunc
              ;
declaVar      : tipoSimp ID_ PCOM_
              | tipoSimp ID_ ASI_ const PCOM_
              | tipoSimp ID_ ACOR_ CTE_ CCOR_ PCOM_
              ;
const         : CTE_
              | TRU_
              | FAL_
              ;
tipoSimp      : INT_
              | BOOL_
              ;
declaFunc     : tipoSimp ID_ APAR_ paramForm CPAR_ bloque
              ;
paramForm     :
              | listParamForm
              ;
listParamForm : tipoSimp ID_
              | tipoSimp ID_ COMA_ listParamForm
              ;
bloque        : ALLA_ declaVarLocal listInst RET_ expre PCOM_ CLLA_
              ;
declaVarLocal :
              | declaVarLocal declaVar
              ;
listInst      :
              | listInst inst
              ;
inst          : ALLA_ listInst CLLA_
              | instExpre
              | instEntSal
              | instSelec
              | instIter
              ;
instExpre     : expre PCOM_
              | PCOM_
              ;
instEntSal    : READ_ APAR_ ID_ CPAR_ PCOM_
              | PRINT_ APAR_ expre CPAR_ PCOM_
              ;
instSelec     : IF_ APAR_ expre CPAR_ inst ELSE_ inst
              ;
instIter      : FOR_ APAR_ expreOp PCOM_ expre PCOM_ expreOp CPAR_ inst
              ;
expreOp       :
              | expre
              ;
expre         : expreLogic
              | ID_ ASI_ expre
              | ID_ ACOR_ expre CCOR_ ASI_ expre
              ;
expreLogic    : expreIgual
              | expreLogic opLogic expreIgual
              ;
expreIgual    : expreRel
              | expreIgual opIgual expreRel
              ;
expreRel      : expreAd
              | expreRel opRel expreAd
              ;
expreAd       : expreMul
              | expreAd opAd expreMul
              ;
expreMul      : expreUna
              | expreMul opMul expreUna
              ;
expreUna      : expreSufi
              | opUna expreUna
              ;
expreSufi     : const
              | APAR_ expre CPAR_
              | ID_
              | ID_ ACOR_ expre CCOR_
              | ID_ APAR_ paramAct CPAR_
              ;
paramAct      :
              | listParamAct
              ;
listParamAct  : expre
              | expre COMA_ listParamAct
              ;
opLogic       : AND_
              | OR_
              ;
opIgual       : IGU_
              | DIF_
              ;
opRel         : MAY_
              | MENOS_
              | MAYIGU_
              | MENIGU_
              ;
opAd          : MAS_
              | MEN_
              ;
opMul         : POR_
              | DIV_
              ;
opUna         : MAS_
              | MEN_
              | NOT_
              ;

%%
/*****************************************************************************/
