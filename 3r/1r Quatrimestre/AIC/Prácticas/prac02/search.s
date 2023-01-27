        .data
a:      .dword  9,8,0,1,0,5,3,1,2,0
tam:    .dword 10       ; Tamaño del vector
cont:   .dword 0        ; Número de componentes == 0

        .text
start:	dadd r1,$gp,a   ; Puntero
        ld r4,tam($gp)  ; Tamaño lista
        dadd r10,r0,r0  ; Contador de ceros
 
loop:
	ld r12, 0(r1)   ; r12 component vector
        dsub r4,r4,#1   ; Reduim tamany restant
        dadd r1,r1,#8   ; Avancem punter vector
        bnez r12,nz     ; a[r1] == 0?
        dadd r10,r10,1  ; Si es 0 sumem al comptador
nz:     bnez r4,loop
        sd r10,cont($gp)

        trap #0
