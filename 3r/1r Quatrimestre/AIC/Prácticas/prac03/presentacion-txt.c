/**************************************************************************
 * 
 * Departamento de Informática de Sistema y Computadores (DISCA)
 * Universidad Politecnica de Valencia.                         
 * 
 * Author: Sergio Sáez (ssaez@disca.upv.es)
 *	   Pedro López (plopez@gap.upv.es)
 * 
 * File: presentacion-txt.c
 *  
 * Description: Contiene las funciones necesarias para presentar la
 *    información sobre la ejecución del algoritmo
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 *************************************************************************/

#define presentatxt_C

/***** Includes ***********************************************/

#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <inttypes.h>


/***** Definiciones Externas **********************************/

#include "tipos.h"
#include "main.h"
#include "instrucciones.h"
#include "etiquetas.h"
#include "memoria.h"



/***** Variables Globales *************************************/

/***** Variables Locales **************************************/

/***** Funciones Locales **************************************/




/***** Funciones Exportables **********************************/

/***************************************************************
 *
 * Func: imprime_inicio_txt
 *
 * Desc: Imprime la configuracion 
 *
 **************************************************************/



void imprime_inicio_txt() {
    /*************************************/
    /*  Local variables                  */
    /*************************************/

    /*************************************/
    /*  Function body                    */
    /*************************************/



    fprintf(stdout, "\n*** CONFIGURACIÓN ***\n\n");

    switch (salida) {
        case html:
            fprintf(stdout, "Salida html\n");
            break;
        case html_final:
            fprintf(stdout, "Salida html: Resultados finales\n");
            break;
        case res_tiempo:
            fprintf(stdout, "Salida texto: Tiempo ejecucion\n");
            break;
            //      case res_ciclo:
            //             fprintf(stdout, "\nSalida texto: ciclo a ciclo");
            //             break;
        case res_final:
            fprintf(stdout, "Salida texto: Resultados finales\n");
    };


    switch (solucion_riesgos_datos) {
        case ninguno:
            fprintf(stdout, "Riesgos de datos: Ninguno\n");
            break;
        case parada:
            fprintf(stdout, "Riesgos de datos: Ciclos de parada\n");
            break;
        case cortocircuito:
            fprintf(stdout, "Riesgos de datos: Cortocircuito\n");
    };


    switch (solucion_riesgos_control) {
        case ds3:
            fprintf(stdout, "Riesgos de control: Salto retardado (DS=3)\n");
            break;
        case ds2:
            fprintf(stdout, "Riesgos de control: Salto retardado (DS=2)\n");
            break;
        case ds1:
            fprintf(stdout, "Riesgos de control: Salto retardado (DS=1)\n");
            break;
        case pnt3:
            fprintf(stdout, "Riesgos de control: Predict-not-taken (Lat=3)\n");
            break;
        case pnt2:
            fprintf(stdout, "Riesgos de control: Predict-not-taken (Lat=2)\n");
            break;
        case pnt1:
            fprintf(stdout, "Riesgos de control: Predict-not-taken (Lat=1)\n");
            break;
        case stall3:
            fprintf(stdout, "Riesgos de control: Ciclos de parada (Lat=3)\n");
            break;
        case stall2:
            fprintf(stdout, "Riesgos de control: Ciclos de parada (Lat=2)\n");
            break;
        case stall1:
            fprintf(stdout, "Riesgos de control: Ciclos de parada (Lat=1)\n");
    };


    fprintf(stdout, "\n");

    fprintf(stdout, "Num Registros= %d\n", TAM_REGISTROS);
    fprintf(stdout, "Memoria Instrucciones (KB)= %d\n", TAM_MEMO_INSTRUC);
    fprintf(stdout, "Memoria Datos (KB)= %d\n", TAM_MEMO_DATOS);
    fprintf(stdout, "Latencia operadores\n");
    fprintf(stdout, "\tF_LS= %d\n", FP_LS_LAT);
    fprintf(stdout, "\tF_ADD= %d\n", FP_ADD_LAT);
    fprintf(stdout, "\tF_CMP= %d\n", FP_CMP_LAT);
    fprintf(stdout, "\tF_MUL= %d\n", FP_MUL_LAT);
    fprintf(stdout, "\n\n");


} /* end imprime_inicio */

/***************************************************************
 *
 * Func: imprime_final_txt
 *
 * Desc: Imprime resultados finales
 *
 **************************************************************/

void imprime_final_txt() {
    /*************************************/
    /*  Local variables                  */
    /*************************************/

    /*************************************/
    /*  Function body                    */
    /*************************************/


    /*** Resultados de la ejecucion ***/
    fprintf(stdout, "*** ESTADÍSTICAS ***\n\n");

    fprintf(stdout, "Ciclos= %ld\n", estat.ciclos);
    fprintf(stdout, "Instrucciones= %ld\n", estat.instrucciones);
    fprintf(stdout, "Ins. Enteras= %ld\n", estat.enteras);
    fprintf(stdout, "Ins. Multiciclo= %ld\n", estat.multiciclo);
    fprintf(stdout, "CPI= %1.2f\n", (float) estat.ciclos / estat.instrucciones);
    fprintf(stdout, "Op. CF= %ld\n", estat.flops);
    fprintf(stdout, "Op. CF/Ciclo=%1.2f\n", (float) estat.flops / estat.ciclos);
    fprintf(stdout, "\n\n");



} /* end imprime_final */

/***************************************************************
 *
 * Func: imprime_etapas
 *
 * Descripci�n: 
 *   Imprime el estado de la maquina
 *
 **************************************************************/

void imprime_etapas_txt(
        ) {
    /*************************************/
    /*  Variables locales                */
    /*************************************/

    char inst[80];

    /*************************************/
    /*  Cuerpo función                   */
    /*************************************/


    fprintf(stdout, "\n");

    fprintf(stdout, "\n*** Ciclo: %ld ***\n\n", Ciclo);

    fprintf(stdout, "PC: %5" PRId64 "\n\n", PC);

    /*
        imprime_instruccion_color(PC, inst); 
        fprintf (stdout, "--/IF: %s \n",inst);

        imprime_instruccion_color(IF_ID.iPC, inst);
        fprintf (stdout, "IF/ID: %s \n",inst);
  
        imprime_instruccion_color(ID_EX.iPC, inst);
        fprintf (stdout, "ID/EX: %s \n",inst);
  
        imprime_instruccion_color(EX_MEM.iPC, inst);
        fprintf (stdout, "EX/MEM: %s \n",inst);

        imprime_instruccion_color(MEM_WB.iPC, inst);
        fprintf (stdout, "MEM/WB: %s \n",inst);

        fprintf (stdout, "\n");
     */
    fprintf(stdout, "IF              ID              EX              MEM             WB\n");

    imprime_instruccion_color(inst, PC, SI);
    fprintf(stdout, "%-16s", inst);

    imprime_instruccion_color(inst, IF_ID.iPC, SI);
    fprintf(stdout, "%-16s", inst);

    imprime_instruccion_color(inst, ID_EX.iPC, SI);
    fprintf(stdout, "%-16s", inst);

    imprime_instruccion_color(inst, EX_MEM.iPC, SI);
    fprintf(stdout, "%-16s", inst);

    imprime_instruccion_color(inst, MEM_WB.iPC, SI);
    fprintf(stdout, "%-16s \n", inst);

    fprintf(stdout, "Señales: ");
    if (IFstall == SI) {
        fprintf(stdout, "IFstall ");
    };
    if (IDstall == SI) {
        fprintf(stdout, "IDstall ");
    };
    if (IFnop == SI) {
        fprintf(stdout, "IFnop ");
    };
    if (IDnop == SI) {
        fprintf(stdout, "IDnop ");
    };
    if (EXnop == SI) {
        fprintf(stdout, "EXnop ");
    };
    if (MEMaEXalu_s == SI) {
        fprintf(stdout, "MEMaEXalu_i ");
    };
    if (MEMaEXalu_i == SI) {
        fprintf(stdout, "MEMaEXalu_s ");
    };
    if (MEMaEXcomp_i == SI) {
        fprintf(stdout, "MEMaEXcomp_i ");
    };
    if (MEMaEXcomp_s == SI) {
        fprintf(stdout, "MEMaEXcomp_s ");
    };
    if (WBaEXalu_s == SI) {
        fprintf(stdout, "WBaEXalu_i ");
    };
    if (WBaEXalu_i == SI) {
        fprintf(stdout, "WBaEXalu_s ");
    };
    if (WBaEXcomp_s == SI) {
        fprintf(stdout, "WBaEXcomp_s ");
    };
    if (WBaEXcomp_i == SI) {
        fprintf(stdout, "WBaEXcomp_i ");
    };
    if (WBaMEM == SI) {
        fprintf(stdout, "WBaMEM ");
    };
    if (MEMaIDcomp_s == SI) {
        fprintf(stdout, "MEMaIDcomp_s ");
    };
    if (MEMaIDcomp_i == SI) {
        fprintf(stdout, "MEMaIDcomp_i ");
    };
    //    if (WBaIDcomp == SI)  {fprintf (stdout, "WBaIDcomp ");};
    fprintf(stdout, "\n");


} /* end imprime_etapas */

/***************************************************************
 *
 * Func: imprime_reg
 *
 * Descripci�n: 
 *   Imprime el estado de la maquina (i: Registros)
 *
 **************************************************************/

void imprime_reg_txt(
        ) {
    /*************************************/
    /*  Variables locales                */
    /*************************************/

    int i, j;

    /*************************************/
    /*  Cuerpo función                   */
    /*************************************/

    fprintf(stdout, "*** REGISTROS ***\n\n");

    j = 1;
    for (i = 0; i < TAM_REGISTROS; i++) {
        /*** Registros enteros */
        fprintf(stdout, "Regs[%2d]: %5" PRId64 "  ", i, Rint[i].valor);
        if ((j % 4) == 0) fprintf(stdout, "\n");
        j++;
    } /* endfor */
    fprintf(stdout, "\n");


    if (hay_double) {
        j = 1;
        for (i = 0; i < TAM_REGISTROS; i++) {
            /*** Registros enteros */
            fprintf(stdout, "Rfp[%2d]: %6.1lf  ", i, Rfp[i].valor.fp_d);
            if ((j % 4) == 0) fprintf(stdout, "\n");
            j++;
        } /* endfor */
        fprintf(stdout, "FPSR: %6" PRId64 "  ", Rint[TAM_REGISTROS].valor);
    }
    fprintf(stdout, "\n\n");

} /* end imprime_reg */

/***************************************************************
 *
 * Func: imprime_memdatosq
 *
 * Descripci�n: 
 *   Imprime el estado de la maquina (ii: memoria de datos)
 *
 **************************************************************/

void imprime_memdatos_txt(
        ) {
    /*************************************/
    /*  Variables locales                */
    /*************************************/


    int i = 0, next;
    char aux[128];

    //char col_M[20], col_LS[20];

    valor_t dato;
    //char vstr_col[128];
    char vstr[128];
    boolean dirty;

    /*************************************/
    /*  Cuerpo función                   */
    /*************************************/

    fprintf(stdout, "*** MEMORIA DATOS ***\n\n");

    next = SegDatos.inicio;
    for (i = SegDatos.inicio; i < SegDatos.final; i++) {

        if (i % sizeof (word) == 0) {
            // Falta ver si se lee o escribe
            //fprintf(f_salida_html, " <tr bgcolor=\"%s\">\n", BG_VAL2);
            te_etiqueta(aux, i, m_datos);
            //color_etiqueta_memdatos(color, i);
            fprintf(stdout, "%9s: ", aux);
        }


        if (i == next) {
            dato = lee_mem_datos(i, md_tipo[i], &dirty);
            //printf("%d,%hhd\n", i, dato.int_b);

            switch (md_tipo[i]) {
                case t_char:
                case t_byte:
                    sprintf(vstr, F_BYTE"(%c)", dato.int_b, dato.int_b);
                    if (dirty) {
                        fprintf(stdout, "|*%6s|", vstr);
                    } else {
                        fprintf(stdout, "|%7s|", vstr);
                    }
                    //FIRMA_2_2("MD%d", i, "%hhX", MD.m_byte[dir_byte(i)]);
                    next = i + sizeof (byte);
                    break;
                case t_half:

                    sprintf(vstr, F_HALF, dato.int_h);
                    if (dirty) {
                        fprintf(stdout, "|*%12s|", vstr);
                    } else {
                        fprintf(stdout, "|%13s|", vstr);
                    }
                    //FIRMA_2_2("MD%d", i, "%hd", MD.m_half[dir_half(i)]);
                    next = i + sizeof (half);
                    break;
                case t_word:

                    sprintf(vstr, F_WORD, dato.int_w);
                    if (dirty) {
                        fprintf(stdout, "|*%24s|", vstr);
                    } else {
                        fprintf(stdout, "|%25s|", vstr);
                    }
                    //FIRMA_2_2("MD%d", i, "%d", MD.m_word[dir_word(i)]);
                    next = i + sizeof (word);
                    break;
                case t_dword:

                    if (dato.int_d <= MAX_WORD) {
                        sprintf(vstr, F_DWORD, dato.int_d);
                    } else {
                        sprintf(vstr, "%" PRIx64, dato.int_d);
                    }
                    if (dirty) {
                        fprintf(stdout, "|*%24s|", vstr);
                    } else {
                        fprintf(stdout, "|%25s|", vstr);
                    }
                    //FIRMA_2_2("MD%d", i, F_DWORD, MD.m_dword[dir_dword(i)]);
                    next = i + sizeof (dword);
                    break;
                case t_float:

                    sprintf(vstr, "%5.1f", dato.fp_s);
                    if (dirty) {
                        fprintf(stdout, "|*%24s|", vstr);
                    } else {
                        fprintf(stdout, "|%25s|", vstr);
                    }
                    //FIRMA_2_2("MD%d", i, "%.2f", MD.m_float[dir_float(i)]);
                    next = i + sizeof (float);
                    break;
                case t_double:

                    sprintf(vstr, "%5.1lf", dato.fp_d);
                    if (dirty) {
                        fprintf(stdout, "|*%24s|", vstr);
                    } else {
                        fprintf(stdout, "|%25s|", vstr);
                    }
                    //FIRMA_2_2("MD%d", i, "%.2f", MD.m_double[dir_double(i)]);
                    next = i + sizeof (double);
                    break;
                default:

                    fprintf(stdout, "xxx\n");
                    next = i + 1;
            } /* endswitch */
        } /* endif */
        if ((i + 1) % sizeof (word) == 0) {

            fprintf(stdout, "\n");
        } /* endif */
    }
    fprintf(stdout, "\n");


} /* end imprime_mem */



