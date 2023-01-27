	.data 0x10000000
	ini: .asciiz "Hola"
	sel: .word 3
	res: .space 4
	tot: .word -1
	
	.text 0x00400000
	.globl __start
__start:
	la $8, ini
	la $9, sel
	lw $9, 0($9)
	la $10, res
	add $11, $0, $0
bucle:
	beq $9, $0, fi
	lb $12, 0($8)
	sb $12, 0($10)
	addi $8, $8, 1
	addi $9, $9, -1
	addi $10, $10, 1
	addi $11, $11, 1
	j bucle
fi:
	la $12, tot
	sw $11, 0($12)
.end