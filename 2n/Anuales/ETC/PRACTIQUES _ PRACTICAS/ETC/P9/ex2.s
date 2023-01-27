          .globl __start
          .data 0x10000000
demana:   .asciiz "Escriviu-me alguna cosa: "
retorn:	  .asciiz "Heu escrit: "
strL:	  .asciiz "La longitud es de: "
cadena:   .space 80             

          .text 0x00400000
__start:  la $a0, demana        
          la $a1, cadena        
          li $a2, 80            
          jal InputS
		  la $a0, retorn
		  jal OutputS
		  la $a0, cadena
		  jal StrLength
		  li $v0, 11        # print_char
          li $a0, 10        # CarÃ cter ASCII â€˜\nâ€™ en $a0
          syscall           # Imprimeix â€˜\nâ€™
          li $v0,10
          syscall

InputS:   li $v0, 4			# Escriu la petició
          syscall
          li $v0, 8			# Demana el ASCII
          move $a0, $a1		# Fica l'adreça del resultat en $a0
          move $a1, $a2		# La llargaria màxima d'aquesta en $a1
          syscall
          jr $ra

OutputS:  li $v0, 4			# Escriu el retorn
		  syscall
		  la $a0, cadena	# Escriu la cadena
		  syscall
		  jr $ra

StrLength:move $a1, $a0
		  li $v0, 4
		  la $a0, strL
		  syscall
		  li $a0, 0			# $a0 comptador
loop:	  lb $a2, 0($a1)	# $a2 byte a vore
		  beq $a2, 0, fi	# Caracter vuit?
		  addi $a0, $a0, 1	# Suma comptador
		  addi $a1, $a1, 1	# Avança punter
		  j loop		  
fi:       addi $a0, $a0, -1
		  li $v0, 1
		  syscall
		  jr $ra