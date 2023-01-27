	.globl __start		# Etiqueta global
	.data 0x10000000	# Adreça inici codi
	base: .word 3		# Afegix un word de valor 3 anomenat "base" a DATA
	altura:  .word 10	# Afegix un word de valor 10 anomenat "altura" a DATA
	area: .space 4		# Afegix un espai de 4 bytes anomenat "area" a DATA

	.text 0x00400000	# Adreça inici codi
__start:				# Inici codi
	la $10, base		# Carregue en $10 l'adreça de base
	lw $11, 0($10)		# Carregue en $11 un word en l'adreça continguda en $10
	la $12, altura		# Carregue en $12 l'adreça de altura
	lw $13, 0($12)		# Carregue en $13 un word en l'adreça continguda en $12
	mult $11, $13		# Multiplique $11 per $13
	mflo $14			# Fique el valor en $14
	addi $15, $0, 2		# Afegix un 2 en $15
	div $14, $15		# Dividic $14 entre $15
	mflo $16			# Fique el resultat en $16
	la $17, area		# Carregue l'adreça de area en $17
	sw $16, 0($17)		# Guarde $16 com a un word en l'adreça continguda en $17
.end					# Fi codi