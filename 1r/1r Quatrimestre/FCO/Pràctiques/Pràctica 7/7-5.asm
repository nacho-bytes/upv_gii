	.globl __start		# Etiqueta global
	.data 0x10000000	# Adreça inici codi
	base: .word 3		# Afegix un word de valor 3 anomenat "base" a DATA
	altura:  .word 10	# Afegix un word de valor 10 anomenat "altura" a DATA
	area: .space 4		# Afegix un espai de 4 bytes anomenat "area" a DATA

	.text 0x00400000	# Adreça inici codi
__start:				# Inici codi
	la $10, base		# Carregue en $10 l'adreça de base
	lw $11, 0($10)		# Carregue en $11 un word en l'adreça continguda en $10
	la $10, altura		# Carregue en $10 l'adreça de altura
	lw $12, 0($10)		# Carregue en $12 un word en l'adreça continguda en $10
	mult $11, $12		# Multiplique $11 per $12
	mflo $11			# Fique el valor en $11
	addi $13, $0, 2		# Afegix un 2 en $13
	div $11, $13		# Dividic $11 entre $13
	mflo $11			# Fique el resultat en $11
	la $12, area		# Carregue l'adreça de area en $12
	sw $11, 0($12)		# Guarde $12 com a un word en l'adreça continguda en $17
.end					# Fi codi