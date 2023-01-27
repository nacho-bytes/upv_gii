	.text 0x00400000	# Adreça inici codi
	.globl __start		# Etiqueta global
__start:
	addi $8, $0, 43		# Inicialitza $8 amb 43
	addi $9, $0, 12		# Inicialitza $9 amb 12
	div $8, $9			# Divideix $8 entre $9
	mflo $10			# LO -> $10
	mfhi $11			# HI -> $11
	.end				# Fi del programa