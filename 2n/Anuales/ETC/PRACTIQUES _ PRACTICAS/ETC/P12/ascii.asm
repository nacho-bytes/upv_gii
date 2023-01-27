# Segmento de datos

	.data		

#-------------------------------------------------#

# Segmento de código ("text")
	.text
    	.globl __start	

__start:
	# Carga dir base teclado
	la $t0, 0xffff0000
	# Carga ASCII tecla stop (space)
	li $t2, 32

espera: # Espera bit R == 1
	lw $t1,0($t0)
	andi $t1,$t1,1
	beqz $t1, espera
	
	lw $a0, 4($t0)
	beq $t2, $a0, exit
	
	# Escribe en consola el carácter
	li $v0, 1
	syscall
	j espera
	
exit: # exit
	li $v0, 10
	syscall			

	.end