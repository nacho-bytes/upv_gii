        ; z = a*x + y
        ; Tama�o de los vectores: 64 palabras
        ; Vector x
	.data
x:      .double 0,1,2,3,4,5,6,7,8,9
        .double 10,11,12,13,14,15,16,17,18,19
        .double 20,21,22,23,24,25,26,27,28,29
        .double 30,31,32,33,34,35,36,37,38,39
        .double 40,41,42,43,44,45,46,47,48,49
        .double 50,51,52,53,54,55,56,57,58,59

	; Vector y
y:      .double 100,100,100,100,100,100,100,100,100,100
	.double 100,100,100,100,100,100,100,100,100,100
	.double 100,100,100,100,100,100,100,100,100,100
	.double 100,100,100,100,100,100,100,100,100,100
	.double 100,100,100,100,100,100,100,100,100,100
	.double 100,100,100,100,100,100,100,100,100,100

        ; Vector z
	; 60 elementos son 480 bytes
z:      .space 480

        ; Escalar a
a:      .double 1

        ; El c�digo
	.text

start:
        dadd r1,r0,X     ; r1 contiene la direccion de X
        dadd r2,r0,y     ; r2 contiene la direccion de y
        dadd r3,r0,z     ; r2 contiene la direccion de z
        l.d f0,a(r0)     ; f0 contiene a
        dadd r4,r1,#480	 ; 60 elementos son 480 bytes
loop:
        l.d f2,0(r1)            ; f2 = valor x1
        l.d f6,8(r1)            ; f6 = valor x2
        l.d f10,16(r1)          ; f10 = valor x3
        l.d f14,24(r1)          ; f14 = valor x4
        l.d f4,0(r2)            ; f4 = valor y1
        l.d f8,8(r2)            ; f8 = valor y2
        l.d f12,16(r2)          ; f12 = valor y3
        l.d f16,24(r2)          ; f16 = valor y4
        mul.d f2,f2,f0          ; f2 = a·x1
        mul.d f6,f6,f0          ; f6 = a·x2
        mul.d f10,f10,f0        ; f10 = a·x3
        mul.d f14,f14,f0        ; f14 = a·x4
        add.d f4,f2,f4          ; f4 = (a·x1) + y1
        add.d f8,f6,f8          ; f8 = (a·x2) + y2
        add.d f12,f10,f12       ; f6 = (a·x3) + y3
        add.d f16,f14,f16       ; f16 = (a·x4) + y4
        s.d f4, 0(r3)           ; Guardem en z1
        s.d f8, 8(r3)           ; Guardem en z2
        s.d f12, 16(r3)         ; Guardem en z3
        s.d f16, 24(r3)         ; Guardem en z4
        dadd r1,r1,#32          ; Sumem punters
        dadd r2,r2,#32
        dadd r3,r3,#32
        dsub r5,r4,r1           ; r5 = 0 si acabat
        bnez r5,loop

        trap #0 