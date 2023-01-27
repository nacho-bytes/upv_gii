	.text 0x00400000	# Adreça inici codi
	.globl __start		# Etiqueta global
__start:
	addi $8, $0, 20		# Inicialitze a en $8
	addi $9, $0, -8		# Inicialitze b en $9
	addi $10, $0, 15	# Fique 15 en $10
	mult $8, $10		# Faig a * 15
	mflo $10			# Fique el resultat en $10
	sub $11, $8, $9		# Faig a - b i el fique en $11
	div $10, $11		# Dividisc a * 15 entre a - b
	mflo $10			# Fique el quocient en $10
	mfhi $11			# Fique el residu en $11
	.end				# Fi del programa