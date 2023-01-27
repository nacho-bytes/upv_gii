                ######################################################
                # Data segment
                ######################################################

                .data 0x10000000
A:              .word 0,1,2,3,4,5,6,7   # Vector A
                .data 0x10001000
B:              .space 32               # Vector B (result)
                .data 0x1000A030
k:              .word 7                 # Scalar constant
dim:            .word 8                 # Vector dimension

                ######################################################
                # Code segment
                ######################################################

                .text 0x00400000
                .globl __start
                
__start:        la $a0, A               # $a0 = A address
                la $a1, B               # $a1 = B address
                la $a2, k               # $a1 = k address
                la $a3, dim             # $a2 = dimension address
                jal sax                 # Subrutine call
                
                ######################################################
                # System call execution end
                ######################################################

                addi $v0, $zero, 10     # Exit code
                syscall                 # Execution end
                
                ######################################################
                # Subrutine that computes Y <- k*X 
                # $a0 = Starting address of vector X
                # $a1 = Starting address of vector Y
                # $a2 = Address of scalar constant k
                # $a3 = Address of vector dimension                
                ######################################################

sax:
                lw $a2, 0($a2)          # $a3 = k constant
                lw $a3, 0($a3)          # $a3 = dimension
loop:
                lw $t0, 0($a0)          # X[i] read in $t0
                mult $a2, $t0           # Compute k*X[i]
                mflo $t0                # $t0 <- k*X[i] (HI is 0)
                sw $t0, 0($a1)          # Y[i] write
                addi $a0, $a0, 4        # X[i+1] address
                addi $a1, $a1, 4        # Y[i+1] address
                addi $a3, $a3, -1       # Decrement of element number
                bgtz $a3, loop         # Jump if any element remains
                jr $ra                  # Subrutine return
                
                .end

