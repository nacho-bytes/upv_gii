/*********************************************************************
 *
 * Departamento de Inform·tica de Sistema y Computadores (DISCA)
 * Universidad PolitÈcnica de Valencia.
 *
 * Author: Sergio Sáez (ssaez@disca.upv.es)
 *	   Pedro López (plopez@disca.upv.es)
 *
 * File: main.h
 *
 * Description: Contiene las definiciones de constantes y de variables
 *    globales a todo el simulador
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 *
 *********************************************************************/

#ifndef main_H
#define main_H

/***** Includes ***********************************************/

#include "tipos.h"

/*** Defines ***************************************************************/

#define TAM_REGISTROS  32
#define MAX_BUFFER_PREDIC 16

#ifndef PRAC
#define MAX_CICLOS_HTML  1000
#define MAX_CICLOS_TXT  10000
#define MAX_CICLOS_TOTAL    100000000
#else
#define MAX_CICLOS_HTML  100
#define MAX_CICLOS_TXT  1000
#define MAX_CICLOS_TOTAL    1000
#endif

#define MAX_TEXTO_CONSOLA 512
#define MAX_TEXTO_LOG 512

#define MAX_FP_LAT   10
#define REG_FPSR   TAM_REGISTROS
#define PC_RET    TAM_REGISTROS-1

#define NUM_REG_VISIBLES 16

#define console_name "_consola.txt"
#define log_name "_log.txt"

#define md_tipo MD_tipo


/*** Inclusion condicional *************************************************/

#ifdef main_C   /* Privado para el fichero main.c */

/* Indica que en el ensamblador se utilizan los tipos de datos correspondientes */
boolean hay_double = NO,
        hay_float = NO,
        hay_dword = NO,
        hay_word = NO,
        hay_half = NO,
        hay_byte = NO,
        hay_char = NO;

long orden;
ciclo_t Ciclo;
estadisticas_t estat;
//ciclo_t Instrucciones;

/* Se ha detectado una trap #0*/
boolean SIG_TRAP0;

/* Se ha detectado una syscall */
boolean SIG_SYSCALL;

/* Nombre del archivo en ensamblador */
char nombre_fich[128];
// byte			ins_count;

/* Utilizar el estilo w3.css */
int w3css_flag = 1;
int small_screen_flag = 0;

/*** Estructuras visibles al programador */

segmento_t SegDatos;
memoria_datos_t MD;
segmento_t SegInstruc;
memoria_intrucciones_t MI;

reg_int_t Rint[TAM_REGISTROS + 1];
reg_fp_t Rfp[TAM_REGISTROS + 1];

/** Para el control del tipo de dato escrito */
tipo_t MD_tipo[TAM_MEMO_DATOS];
boolean md_dirty[TAM_MEMO_DATOS];
tipo_t Rfp_tipo[TAM_REGISTROS + 1];
tipo_t Rint_tipo[TAM_REGISTROS + 1];
boolean Rfp_dirty[TAM_REGISTROS + 1];
boolean Rint_dirty[TAM_REGISTROS + 1];

/* Consola generada en cada ciclo */
char CONSOLA[MAX_TEXTO_CONSOLA];

/* Log generado en cada ciclo */
char LOG[MAX_TEXTO_LOG];

/* Opciones de visualizacion */
int SHOW_DIT = 1;
int SHOW_DATAPATH = 1;
int SHOW_REG_MEM = 1;
int SHOW_LOG = 1;
int SHOW_CONSOLE = 1;

/* Opciones de la línea de órdenes */
riesgos_d_t solucion_riesgos_datos;
riesgos_c_t solucion_riesgos_control;
sal_t salida;
boolean html_merge;
boolean f_etiquetas;

/* Otras opciones */
boolean home_link_flag = 0;
char HOME_LINK[128];

/* Latencia de los operadores */
int FP_ADD_LAT = 4;
int FP_MUL_LAT = 7;
int FP_CMP_LAT = 4;
int FP_LS_LAT = 2;

/*** Registros inter-etapa para la segmentacion */
dword PCn, PC;

/* MIPS 5 etapas */
IF_ID_t IF_IDn, IF_ID;
ID_EX_t ID_EXn, ID_EX;
EX_MEM_t EX_MEMn, EX_MEM;
MEM_WB_t MEM_WBn, MEM_WB;

/** Multiciclo **/
/* Comparación --> FPSR */
MEM_WB_t CMP_WBn, CMP_WB;

/* ID a cada operador */
ID_FP_t ID_LS, ID_LSn,
ID_An, ID_A,
ID_Mn, ID_M,
ID_Cn, ID_C;

/* Operadores FP */
FP_FP_t LS[MAX_FP_LAT], LSn[MAX_FP_LAT],
A[MAX_FP_LAT], An[MAX_FP_LAT],
M[MAX_FP_LAT], Mn[MAX_FP_LAT],
C[MAX_FP_LAT], Cn[MAX_FP_LAT];

/* Operadores a WB FP */
FP_WB_t LS_WBn, LS_WB,
ADD_WBn, ADD_WB,
MUL_WBn, MUL_WB,
FP_WBn, FP_WB,
ID_WBn, ID_WB;

/* Señales de control */
boolean MEMaEXalu_s,
MEMaEXalu_i,
MEMaEXcomp_s,
MEMaEXcomp_i,
WBaEXalu_s,
WBaEXalu_i,
WBaEXcomp_s,
WBaEXcomp_i,
WBaEXmem,
WBaMEM,
MEMaIDcomp_s,
MEMaIDcomp_i,
MEMaLS1_s,
WBaLS1_s;

boolean FP_WBaA1_i,
FP_WBaA1_s,
FP_WBaM1_i,
FP_WBaM1_s,
FP_WBaLS1_i,
FP_WBaC1_i,
FP_WBaC1_s,
FP_WBaEXcomp;
//FP_WBaIDcomp;

boolean RAW,
WAW,
estructural;

boolean IFstall,
IDstall,
EXstall,
IFnop,
IDnop,
EXnop,
MEMnop;

/* Variables internas */
dword
ID_dir,
ALUout,
WBdata;

boolean ID_CONDout,
EX_CONDout,
SaltoEfectivo;

boolean final = NO;

/*** Estructuras para el predictor */

entrada_btb_t BTB[MAX_BUFFER_PREDIC];

dword PC_inicial = 0;

#endif

/***************************************************************************/
/***************************************************************************/

#ifndef main_C  /* Publico (excepto main.c) */

extern boolean hay_double,
        hay_float,
        hay_dword,
        hay_word,
        hay_half,
        hay_byte,
        hay_char;

extern long orden;
extern ciclo_t Ciclo;
extern ciclo_t Instrucciones;
extern estadisticas_t estat;
extern boolean SIG_TRAP0,
        SIG_SYSCALL;
extern char nombre_fich[128];
// extern byte			ins_count;

/*** Estructuras visibles al programador */
extern segmento_t SegDatos;
extern memoria_datos_t MD;
extern segmento_t SegInstruc;
extern memoria_intrucciones_t MI;

// El FPSR tiene el valor en Rint[TAM_REGISTROS], pero utiliza Rfp[[TAM_REGISTROS].busy para detectar riesgos RAW
extern reg_int_t Rint[TAM_REGISTROS + 1];
extern reg_fp_t Rfp[TAM_REGISTROS + 1];

// Para el control del tipo de dato escrito
extern tipo_t MD_tipo[TAM_MEMO_INSTRUC];
extern boolean md_dirty[TAM_MEMO_DATOS];
extern tipo_t Rfp_tipo[TAM_REGISTROS];
extern tipo_t Rint_tipo[TAM_REGISTROS + 1];
extern boolean Rfp_dirty[TAM_REGISTROS];
extern boolean Rint_dirty[TAM_REGISTROS + 1];


extern char CONSOLA[MAX_TEXTO_CONSOLA];
extern char LOG[MAX_TEXTO_LOG];

/* Opciones de visualizacion */
extern int SHOW_DIT;
extern int SHOW_DATAPATH;
extern int SHOW_REG_MEM;
extern int SHOW_CONSOLE;
extern int SHOW_LOG;

/*** Registros inter-etapa para la segmentación */

extern dword PCn, PC;

extern IF_ID_t IF_IDn, IF_ID;
extern ID_EX_t ID_EXn, ID_EX;
extern EX_MEM_t EX_MEMn, EX_MEM;
extern MEM_WB_t MEM_WBn, MEM_WB,
        CMP_WBn, CMP_WB;

extern ID_FP_t ID_LS, ID_LSn,
        ID_An, ID_A,
        ID_Mn, ID_M,
        ID_Cn, ID_C;

extern FP_FP_t LS[MAX_FP_LAT], LSn[MAX_FP_LAT],
        A[MAX_FP_LAT], An[MAX_FP_LAT],
        M[MAX_FP_LAT], Mn[MAX_FP_LAT],
        C[MAX_FP_LAT], Cn[MAX_FP_LAT];

extern FP_WB_t LS_WBn, LS_WB,
        ADD_WBn, ADD_WB,
        MUL_WBn, MUL_WB,
        FP_WBn, FP_WB,
        ID_WBn, ID_WB;

/* Opciones de la línea de órdenes */
extern riesgos_d_t solucion_riesgos_datos;
extern riesgos_c_t solucion_riesgos_control;
extern sal_t salida;
extern boolean html_merge;
extern boolean f_etiquetas;
extern int small_screen_flag;

/* Otras opciones */
extern boolean home_link_flag;
extern char HOME_LINK[128];

/* Latencia de los operadores */
extern int FP_ADD_LAT;
extern int FP_CMP_LAT;
extern int FP_MUL_LAT;
extern int FP_LS_LAT;


/* Señales de control */
extern boolean
MEMaEXalu_s,
        MEMaEXalu_i,
        MEMaEXcomp_s,
        MEMaEXcomp_i,
        WBaEXalu_s,
        WBaEXalu_i,
        WBaEXcomp_s,
        WBaEXcomp_i,
        WBaEXmem,
        WBaMEM,
        MEMaIDcomp_s,
        MEMaIDcomp_i,
        MEMaLS1_s,
        WBaLS1_s;

extern boolean FP_WBaA1_i,
        FP_WBaA1_s,
        FP_WBaM1_i,
        FP_WBaM1_s,
        FP_WBaLS1_i,
        FP_WBaLS1_s,
        FP_WBaC1_i,
        FP_WBaC1_s,
        FP_WBaEXcomp;
//FP_WBaIDcomp;


extern boolean RAW,
        WAW,
        estructural;

extern boolean IFstall,
        IDstall,
        EXstall,
        IFnop,
        IDnop,
        EXnop,
        MEMnop;

/* Variables internas */
extern dword
ID_dir,
        ALUout,
        WBdata;

extern boolean ID_CONDout,
        EX_CONDout;

extern boolean SaltoEfectivo;

extern boolean final;

extern entrada_btb_t BTB[MAX_BUFFER_PREDIC];

extern dword PC_inicial;
#endif

#endif /* Include main.h */


