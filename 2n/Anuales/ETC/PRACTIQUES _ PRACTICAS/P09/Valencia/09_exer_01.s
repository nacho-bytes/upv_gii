          .globl __start
          .data 0x10000000
M:        .space 4

          .text 0x00400000
__start:  li $a0,'M'
          la $a1, M
          jal InputV

          # Terminar el procés
          li $v0,10
          syscall

InputV:   li $v0, 11
          syscall
          li $v0, 11
          li $a0, '='
          syscall
          li $v0, 5
          syscall
          sw $v0, 0($a1)
          jr $ra

Output:   # Output accepta paràmetres directament en registres:
          #   void Output (char $a0, int $a1)
          # Heu de canviar-la per OutputV, que opera amb variables en memòria:
          #   void OutputV (char $a0, int *$a1)

          li $v0, 11        # print_char
          syscall           # Imprimeix $a0
          li $v0, 11        # print_char
          li $a0, '='       # Caràcter ‘=’ en $a0
          syscall           # Imprimeix ‘=’
          li $v0, 1         # print_int
          move $a0, $a1     # Enter a imprimir en $a0
          syscall           # Imprimeix $a0
          li $v0, 11        # print_char
          li $a0, 10        # Caràcter ASCII ‘\n’ en $a0
          syscall           # Imprimeix ‘\n’
          jr $ra            # Retorn de Output

MultR:    # MultR accepta paràmetres i torna el resultat directament en registres:
          #    int Mult (int $a0, int $a1)
          # Heu de canviar-la per MultV, que opera amb variables en memòria:
          #    void MultV (int *$a0, int *$a1, int *$a2)

          mult $a0, $a1     # Multiplica arguments
          mflo $v0          # Resultat en $v0
          jr $ra            # Retorn de Mult
