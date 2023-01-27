          .globl __start
          .data 0x10000000
M:        .space 4

          .text 0x00400000
__start:  li $a0,'M'
          la $a1, M
          jal InputV
		  li $a0,'Q'
          addi $a1, $a1, 4
          jal InputV
		  la $a0, M
		  addi $a1, $a0, 4
		  addi $a2, $a1, 4
		  jal MultV
		  li $a0, 'R'
		  la $a1, 0 ($a2)
		  jal OutputV

          # Terminar el procÃ©s
          li $v0,10
          syscall

InputV:   li $v0, 11		# Escriu $a0
          syscall
          li $v0, 11
          li $a0, '='		# Escriu '='
          syscall
          li $v0, 5			# $v0 = input
          syscall
          sw $v0, 0($a1)	# *$a1 = $v0
          jr $ra

Output:   # Output accepta parÃ metres directament en registres:
          #   void Output (char $a0, int $a1)
          # Heu de canviar-la per OutputV, que opera amb variables en memÃ²ria:
          #   void OutputV (char $a0, int *$a1)

          li $v0, 11        # print_char
          syscall           # Imprimeix $a0
          li $v0, 11        # print_char
          li $a0, '='       # CarÃ cter â€˜=â€™ en $a0
          syscall           # Imprimeix â€˜=â€™
          li $v0, 1         # print_int
          move $a0, $a1     # Enter a imprimir en $a0
          syscall           # Imprimeix $a0
          li $v0, 11        # print_char
          li $a0, 10        # CarÃ cter ASCII â€˜\nâ€™ en $a0
          syscall           # Imprimeix â€˜\nâ€™
          jr $ra            # Retorn de Output

OutputV:  # OutputV opera amb variables en memòria:
          #   void OutputV (char $a0, int *$a1)

          li $v0, 11        # print_char
          syscall           # Imprimeix $a0
          li $v0, 11        # print_char
          li $a0, '='       # CarÃ cter '=' en $a0
          syscall           # Imprimeix '='
          li $v0, 1         # print_int
          lw $a0, 0($a1)       # Enter a imprimir en $a0
          syscall           # Imprimeix $a0
          li $v0, 11        # print_char
          li $a0, 10        # CarÃ cter ASCII \n en $a0
          syscall           # Imprimeix \n
          jr $ra            # Retorn de Output

MultR:    # MultR accepta parÃ metres i torna el resultat directament en registres:
          #    int Mult (int $a0, int $a1)
          # Heu de canviar-la per MultV, que opera amb variables en memÃ²ria:
          #    void MultV (int *$a0, int *$a1, int *$a2)

          mult $a0, $a1     # Multiplica arguments
          mflo $v0          # Resultat en $v0
          jr $ra            # Retorn de Mult

MultV:    # MultV opera amb variables en memÃ²ria:
          #    void MultV (int *$a0, int *$a1, int *$a2)

          lw $a0, 0($a0)		# M = $a0
		  lw $a1, 0($a1)		# Q = $a1
		  mult $a0, $a1     # Multiplica arguments
          mflo $v0			# Resultat en $v0
		  sw $v0, 0($a2)		# Guarda en $a2 el contingut de $v0
          jr $ra            # Retorn de Mult