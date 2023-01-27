/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "tipos.h"
#include "main.h"

dword lee_int_reg(
        dword n,
        tipo_t *tipo,
        boolean *dirty
        ) {
    *tipo = Rint_tipo[n];
    *dirty = Rint_dirty[n];
    return (Rint[n].valor);

}

void escribe_int_reg(
        dword n,
        dword dato,
        tipo_t tipo_dato,
        boolean activar_dirty
        ) {
    Rint[n].valor = dato;
    Rint_tipo[n] = tipo_dato;
    if (activar_dirty)
        Rint_dirty[n] = SI;
}

valor_t lee_fp_reg(
        dword n,
        tipo_t *tipo,
        boolean *dirty
        ) {
    *tipo = Rfp_tipo[n];
    *dirty = Rfp_dirty[n];
    return (Rfp[n].valor);
}

void escribe_fp_reg(
        dword n,
        valor_t dato,
        tipo_t tipo_dato,
        boolean activar_dirty
        ) {
    Rfp[n].valor = dato;
    Rfp_tipo[n] = tipo_dato;
    if (activar_dirty)
        Rfp_dirty[n] = SI;
}

