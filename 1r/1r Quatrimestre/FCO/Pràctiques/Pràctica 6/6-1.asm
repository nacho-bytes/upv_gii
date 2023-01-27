	.text 0x00400000	# Adreça inici codi
	.globl __start		# Etiqueta global
__start:
	addi $8, $0, 1		# Inicialitza $8 amb 1
	addi $9, $0, -2		# Inicialitza $9 amb -2
	add $10, $8, $9		# $10 <- $8 + $9
	.end				# Fi del programa