	.globl __start
	.data 0x10000000
	vector: .word 3, 4, 5
	ncomp: .word 3
	result: .space 4
	
	.text 0x00400000
__start:
	la $8, vector
	la $9, ncomp
	lw $9, 0($9)
	addi $10, $0, 0
bucle:
	beq $9, $0, fi
	lw $11, 0($8)
	add $10, $10, $11
	addi $8, $8, 4
	addi $9, $9, -1
	j bucle
fi:
	la $12, result
	sw $10, 0($12)
.end