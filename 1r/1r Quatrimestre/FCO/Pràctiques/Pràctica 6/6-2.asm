	.text 0x00400000	# Adreça inici codi
	.globl __start		# Etiqueta global
__start:
	addi $8, $0, 10000	# Inicialitza $8 amb 10^4
	mult $8, $8			# HI-LO <- $8 * $8
	mflo $9				# $9 <- LO
	mult $8, $9			# HI-LO <- $8 * $9
	.end