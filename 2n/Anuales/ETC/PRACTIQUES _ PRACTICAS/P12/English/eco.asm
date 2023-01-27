### TEMPLATE FOR MIPS R2000 I/O LAB SESSIONS ###

#-------------------------------------------------#
#
#  LAB 12: SINCHRONIZATION BY POLLING
# 
#-------------------------------------------------#

# ACTIVITY 3:  Complete the following functions:
#    char getchar() - get character from keyboard
#    void putchar(char c) - print character on the console

# Data segment

	.data		

#-------------------------------------------------#

# Code segment
	.text
    	.globl __start	



__start:			

	li $a0, 'P'		# 
	jal putchar		# putchar('P')
	li $a0, '1'		# 
	jal putchar		# putchar('1')
	li $a0, '2'		# 
	jal putchar		# putchar('2')
	li $a0, 13		# return character ('\n')
	jal putchar		# putchar('\n')
	
loop:
	jal getchar		# $v0 = getchar()
	move $a0, $v0		#
	li $t0, 0x1b      	# detect ESC (0x1b = 27)
	beq $a0, $t0, finish
	jal putchar		# putchar($a0)
	b loop
finish:	
	li $v0, 10
	syscall			# exit
	
	
	
getchar:			# $v0 = getchar()
### TO BE COMPLETED: function code




###
	jr $ra                  # return from getchar



putchar:			# putchar($a0)
### TO BE COMPLETED: function code




###
	jr $ra                  # return from putchar
