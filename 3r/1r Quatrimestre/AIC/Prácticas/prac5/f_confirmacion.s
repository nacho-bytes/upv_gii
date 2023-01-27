	.file	"f_confirmacion.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"x"
.LC1:
	.string	"X"
	.text
	.p2align 4,,15
	.globl	cancelar_instrucciones
	.type	cancelar_instrucciones, @function
cancelar_instrucciones:
.LFB26:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	leaq	-24(%rsp), %rsp
	.cfi_def_cfa_offset 80
	movq	TAM_REORDER@GOTPCREL(%rip), %rbp
	movq	RB@GOTPCREL(%rip), %rax
	movl	0(%rbp), %r9d
	movq	%rax, 8(%rsp)
	testl	%r9d, %r9d
	jle	.L41
	movq	%rax, %r14
	xorl	%r12d, %r12d
	movq	RB_inicio@GOTPCREL(%rip), %r13
	leaq	.LC0(%rip), %r15
	.p2align 4,,15
.L4:
	movl	(%r14), %r8d
	testl	%r8d, %r8d
	je	.L3
	cmpl	%r12d, 0(%r13)
	je	.L3
	movl	92(%r14), %esi
	xorl	%edx, %edx
	movq	presentacion@GOTPCREL(%rip), %rax
	movq	%r15, %rdi
	call	*64(%rax)
.L3:
	addl	$1, %r12d
	addq	$96, %r14
	cmpl	%r12d, 0(%rbp)
	jg	.L4
.L2:
	movq	TAM_ESTACIONES@GOTPCREL(%rip), %r12
	movl	(%r12), %edi
	testl	%edi, %edi
	jle	.L5
	movq	RS@GOTPCREL(%rip), %r14
	xorl	%ebx, %ebx
	leaq	.LC1(%rip), %r15
	jmp	.L8
	.p2align 4,,7
	.p2align 3
.L6:
	addl	$1, %ebx
	addq	$168, %r14
	cmpl	%ebx, (%r12)
	jle	.L5
.L8:
	movl	(%r14), %esi
	testl	%esi, %esi
	je	.L6
	cmpl	$3, 124(%r14)
	jne	.L6
	movq	TAM_RS_SUMREST@GOTPCREL(%rip), %rdx
	movq	TAM_RS_ENTEROS@GOTPCREL(%rip), %rcx
	movl	(%rdx), %edx
	addl	(%rcx), %edx
	movq	TAM_RS_MULTDIV@GOTPCREL(%rip), %rcx
	addl	(%rcx), %edx
	movq	TAM_BUFFER_CARGA@GOTPCREL(%rip), %rcx
	addl	(%rcx), %edx
	cmpl	%ebx, %edx
	jg	.L7
	movq	TAM_BUFFER_ALMACEN@GOTPCREL(%rip), %rcx
	addl	(%rcx), %edx
	cmpl	%ebx, %edx
	jg	.L6
.L7:
	movl	160(%r14), %esi
	xorl	%edx, %edx
	movq	presentacion@GOTPCREL(%rip), %rcx
	movq	%r15, %rdi
	addl	$1, %ebx
	addq	$168, %r14
	call	*64(%rcx)
	cmpl	%ebx, (%r12)
	jg	.L8
	.p2align 4,,15
.L5:
	movq	NUM_OPERADORES@GOTPCREL(%rip), %rbx
	movl	(%rbx), %esi
	testl	%esi, %esi
	jle	.L9
	movq	Op@GOTPCREL(%rip), %r15
	xorl	%r14d, %r14d
	.p2align 4,,15
.L12:
	movl	(%r15), %ecx
	testl	%ecx, %ecx
	je	.L10
	movq	TAM_RS_SUMREST@GOTPCREL(%rip), %rax
	movq	TAM_RS_ENTEROS@GOTPCREL(%rip), %rsi
	movslq	8(%r15), %rdx
	movl	(%rax), %eax
	addl	(%rsi), %eax
	movq	TAM_RS_MULTDIV@GOTPCREL(%rip), %rsi
	addl	(%rsi), %eax
	movq	TAM_BUFFER_CARGA@GOTPCREL(%rip), %rsi
	addl	(%rsi), %eax
	cmpl	%eax, %edx
	jl	.L11
	movq	TAM_BUFFER_ALMACEN@GOTPCREL(%rip), %rsi
	addl	(%rsi), %eax
	cmpl	%eax, %edx
	jl	.L10
.L11:
	leaq	(%rdx,%rdx,4), %rax
	leaq	.LC1(%rip), %rdi
	leaq	(%rdx,%rax,4), %rax
	movq	RS@GOTPCREL(%rip), %rdx
	leaq	(%rdx,%rax,8), %rax
	xorl	%edx, %edx
	movl	160(%rax), %esi
	movq	presentacion@GOTPCREL(%rip), %rax
	call	*64(%rax)
.L10:
	movl	(%rbx), %esi
	addl	$1, %r14d
	addq	$28, %r15
	cmpl	%r14d, %esi
	jg	.L12
.L9:
	movq	TAM_REGISTROS@GOTPCREL(%rip), %rax
	movslq	(%rax), %r8
	testl	%r8d, %r8d
	jle	.L42
	leal	-1(%r8), %edx
	movl	$8, %eax
	movq	Rfp@GOTPCREL(%rip), %rdi
	salq	$4, %rdx
	movq	Rint@GOTPCREL(%rip), %rcx
	addq	$24, %rdx
	.p2align 4,,15
.L14:
	movl	$4096, (%rax,%rdi)
	movl	$4096, (%rcx,%rax)
	addq	$16, %rax
	cmpq	%rdx, %rax
	jne	.L14
.L13:
	movl	(%r12), %eax
	salq	$4, %r8
	movl	$4096, 8(%rcx,%r8)
	testl	%eax, %eax
	jle	.L15
	movq	RS@GOTPCREL(%rip), %rdx
	leal	-1(%rax), %eax
	leaq	(%rax,%rax,4), %rcx
	leaq	(%rax,%rcx,4), %rcx
	leaq	168(%rdx), %rax
	leaq	(%rax,%rcx,8), %rcx
	jmp	.L18
	.p2align 4,,7
	.p2align 3
.L43:
	leaq	168(%rax), %rax
.L18:
	movl	(%rdx), %r11d
	testl	%r11d, %r11d
	je	.L16
	movl	120(%rdx), %r10d
	testl	%r10d, %r10d
	jne	.L17
.L16:
	movl	$0, (%rdx)
.L17:
	cmpq	%rcx, %rax
	movq	%rax, %rdx
	jne	.L43
.L15:
	testl	%esi, %esi
	jle	.L19
	movq	Op@GOTPCREL(%rip), %rdx
	leal	-1(%rsi), %eax
	leaq	0(,%rax,8), %rcx
	subq	%rax, %rcx
	leaq	28(%rdx), %rax
	leaq	(%rax,%rcx,4), %rcx
	jmp	.L22
	.p2align 4,,7
	.p2align 3
.L21:
	movl	$0, (%rdx)
.L20:
	cmpq	%rax, %rcx
	movq	%rax, %rdx
	je	.L19
.L44:
	leaq	28(%rax), %rax
.L22:
	movl	(%rdx), %r9d
	testl	%r9d, %r9d
	je	.L20
	cmpl	$3, 4(%rdx)
	jne	.L21
	movslq	8(%rdx), %rsi
	leaq	(%rsi,%rsi,4), %rdi
	leaq	(%rsi,%rdi,4), %rsi
	movq	RS@GOTPCREL(%rip), %rdi
	leaq	(%rdi,%rsi,8), %rsi
	movl	120(%rsi), %r8d
	testl	%r8d, %r8d
	je	.L21
	cmpq	%rax, %rcx
	movq	%rax, %rdx
	jne	.L44
	.p2align 4,,15
.L19:
	movslq	0(%r13), %rax
	leaq	(%rax,%rax,2), %rax
	salq	$5, %rax
	addq	8(%rsp), %rax
	movl	40(%rax), %edx
	testl	%edx, %edx
	je	.L45
	movq	32(%rax), %rdx
.L24:
	movq	Control_1@GOTPCREL(%rip), %rax
	movq	%rdx, (%rax)
	movq	$1, 12(%rax)
	movl	0(%rbp), %eax
	testl	%eax, %eax
	jle	.L25
	movq	8(%rsp), %rbx
	leal	-1(%rax), %eax
	leaq	(%rax,%rax,2), %rdx
	salq	$5, %rdx
	leaq	96(%rbx), %rax
	addq	%rax, %rdx
	jmp	.L26
	.p2align 4,,7
	.p2align 3
.L46:
	leaq	96(%rax), %rax
.L26:
	movl	$0, (%rbx)
	cmpq	%rax, %rdx
	movl	$0, 72(%rbx)
	movq	%rax, %rbx
	jne	.L46
.L25:
	movq	RB_long@GOTPCREL(%rip), %rax
	movl	$0, 0(%r13)
	movl	$0, (%rax)
	movq	RB_fin@GOTPCREL(%rip), %rax
	movl	$0, (%rax)
	leaq	24(%rsp), %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,7
	.p2align 3
.L45:
	.cfi_restore_state
	movq	80(%rax), %rdx
	addq	$4, %rdx
	jmp	.L24
	.p2align 4,,7
	.p2align 3
.L42:
	movq	Rint@GOTPCREL(%rip), %rcx
	jmp	.L13
	.p2align 4,,7
	.p2align 3
.L41:
	movq	RB_inicio@GOTPCREL(%rip), %r13
	jmp	.L2
	.cfi_endproc
.LFE26:
	.size	cancelar_instrucciones, .-cancelar_instrucciones
	.p2align 4,,15
	.globl	prediccion_correcta
	.type	prediccion_correcta, @function
prediccion_correcta:
.LFB27:
	.cfi_startproc
	movq	RB_inicio@GOTPCREL(%rip), %rax
	movslq	(%rax), %rax
	leaq	(%rax,%rax,2), %rax
	salq	$5, %rax
	addq	RB@GOTPCREL(%rip), %rax
	movl	40(%rax), %edx
	cmpl	%edx, 44(%rax)
	sete	%al
	movzbl	%al, %eax
	ret
	.cfi_endproc
.LFE27:
	.size	prediccion_correcta, .-prediccion_correcta
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"Ciclo %u: Acceso a memoria de instrucciones ilegal. PC=%ld (%s)\n"
	.align 8
.LC3:
	.string	"Ciclo %u: Acceso a memoria de datos ilegal. PC=%ld (%s)\n"
	.align 8
.LC4:
	.string	"Ciclo %u: Acceso deslineado a memoria de datos. PC=%ld (%s)\n"
	.align 8
.LC5:
	.string	"Ciclo %u: El programa est\303\241 terminando normalmente. PC=%ld (%s)\n"
	.align 8
.LC6:
	.string	"Ciclo %u: Excepci\303\263n no manejada. PC=%ld (%s)\n"
	.section	.rodata.str1.1
.LC7:
	.string	"C"
.LC8:
	.string	"f_confirmacion.c"
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"ERROR (%s:%d): Operacion %d no implementada\n"
	.text
	.p2align 4,,15
	.globl	fase_COM
	.type	fase_COM, @function
fase_COM:
.LFB29:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	leaq	-128(%rsp), %rsp
	.cfi_def_cfa_offset 176
	movq	terminando@GOTPCREL(%rip), %r12
	movq	RB_inicio@GOTPCREL(%rip), %rbx
	movq	RB_cab@GOTPCREL(%rip), %rdx
	movl	(%r12), %ebp
	movl	(%rbx), %eax
	testl	%ebp, %ebp
	movl	%eax, (%rdx)
	jne	.L48
	movq	RB@GOTPCREL(%rip), %rbp
	movslq	%eax, %rdx
	leaq	(%rdx,%rdx,2), %rax
	salq	$5, %rax
	addq	%rbp, %rax
	movl	(%rax), %r11d
	testl	%r11d, %r11d
	je	.L48
	movl	4(%rax), %esi
	movl	8(%rax), %r10d
	leal	-16(%rsi), %ecx
	cmpl	$2, %ecx
	setbe	%cl
	cmpl	$65, %esi
	sete	%dil
	orl	%edi, %ecx
	testl	%r10d, %r10d
	je	.L150
	movq	estat@GOTPCREL(%rip), %r13
	addq	$1, 8(%r13)
	testb	%cl, %cl
	je	.L53
	movq	16(%rax), %rax
	movq	RS@GOTPCREL(%rip), %rsi
.L54:
	leaq	(%rax,%rax,4), %rdi
	leaq	(%rdx,%rdx,2), %rcx
	leaq	(%rax,%rdi,4), %rax
	movl	152(%rsi,%rax,8), %eax
	salq	$5, %rcx
	movl	%eax, 72(%rbp,%rcx)
.L55:
	leaq	(%rdx,%rdx,2), %rax
	movq	%rsp, %r14
	xorl	%edx, %edx
	movq	%r14, %rdi
	salq	$5, %rax
	movq	80(%rbp,%rax), %rsi
	call	imprime_instruccion_color@PLT
	movslq	(%rbx), %rax
	leaq	(%rax,%rax,2), %rcx
	salq	$5, %rcx
	addq	%rbp, %rcx
	movl	72(%rcx), %edx
	cmpl	$2, %edx
	je	.L108
	jle	.L151
	cmpl	$32, %edx
	je	.L113
	cmpl	$255, %edx
	.p2align 4,,2
	jne	.L152
	movq	SIG_SYSCALL@GOTPCREL(%rip), %rdx
	movl	$1, (%rdx)
	movq	presentacion@GOTPCREL(%rip), %rdx
	movq	64(%rdx), %rcx
.L65:
	leaq	(%rax,%rax,2), %rax
	movl	$1, %edx
	leaq	.LC7(%rip), %rdi
	salq	$5, %rax
	addq	%rbp, %rax
	movl	92(%rax), %esi
	movl	$1, 4(%rax)
	call	*%rcx
.L67:
	movslq	(%rbx), %rdx
	leaq	(%rdx,%rdx,2), %rcx
	movq	%rdx, %rax
	salq	$5, %rcx
	movl	4(%rbp,%rcx), %r8d
	cmpl	$183, %r8d
	ja	.L68
	leaq	.L70(%rip), %rdi
	movl	%r8d, %esi
	movslq	(%rdi,%rsi,4), %rcx
	addq	%rdi, %rcx
	jmp	*%rcx
	.section	.rodata
	.align 4
	.align 4
.L70:
	.long	.L79-.L70
	.long	.L78-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L77-.L70
	.long	.L77-.L70
	.long	.L77-.L70
	.long	.L77-.L70
	.long	.L77-.L70
	.long	.L77-.L70
	.long	.L71-.L70
	.long	.L71-.L70
	.long	.L71-.L70
	.long	.L68-.L70
	.long	.L77-.L70
	.long	.L77-.L70
	.long	.L77-.L70
	.long	.L77-.L70
	.long	.L77-.L70
	.long	.L77-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L77-.L70
	.long	.L77-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L77-.L70
	.long	.L77-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L77-.L70
	.long	.L77-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L77-.L70
	.long	.L77-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L77-.L70
	.long	.L77-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L77-.L70
	.long	.L77-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L77-.L70
	.long	.L71-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L77-.L70
	.long	.L77-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L77-.L70
	.long	.L77-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L77-.L70
	.long	.L68-.L70
	.long	.L77-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L77-.L70
	.long	.L77-.L70
	.long	.L77-.L70
	.long	.L77-.L70
	.long	.L77-.L70
	.long	.L77-.L70
	.long	.L77-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L75-.L70
	.long	.L75-.L70
	.long	.L75-.L70
	.long	.L75-.L70
	.long	.L75-.L70
	.long	.L75-.L70
	.long	.L76-.L70
	.long	.L76-.L70
	.long	.L75-.L70
	.long	.L75-.L70
	.long	.L75-.L70
	.long	.L75-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L69-.L70
	.long	.L71-.L70
	.long	.L74-.L70
	.long	.L74-.L70
	.long	.L74-.L70
	.long	.L74-.L70
	.long	.L68-.L70
	.long	.L73-.L70
	.long	.L73-.L70
	.long	.L73-.L70
	.long	.L73-.L70
	.long	.L73-.L70
	.long	.L73-.L70
	.long	.L69-.L70
	.long	.L71-.L70
	.long	.L74-.L70
	.long	.L74-.L70
	.long	.L74-.L70
	.long	.L74-.L70
	.long	.L68-.L70
	.long	.L73-.L70
	.long	.L73-.L70
	.long	.L73-.L70
	.long	.L73-.L70
	.long	.L73-.L70
	.long	.L73-.L70
	.long	.L72-.L70
	.long	.L72-.L70
	.long	.L72-.L70
	.long	.L72-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L68-.L70
	.long	.L69-.L70
	.long	.L71-.L70
	.long	.L69-.L70
	.long	.L69-.L70
	.text
.L86:
	movslq	(%rbx), %rax
	movl	$1, %esi
	leaq	(%rax,%rax,2), %rax
	salq	$5, %rax
	addq	%rax, %rbp
	movl	52(%rbp), %eax
	movl	40(%rbp), %edi
	leal	(%rax,%rax), %edx
	movq	n_bits_branch_mask_local@GOTPCREL(%rip), %rax
	orl	%edi, %edx
	movl	(%rax), %ecx
	movl	%esi, %eax
	sall	%cl, %eax
	movl	%eax, %ecx
	movq	branch_mask_local@GOTPCREL(%rip), %rax
	subl	$1, %ecx
	andl	%ecx, %edx
	movl	%edx, (%rax)
	movq	n_bits_branch_mask_global@GOTPCREL(%rip), %rdx
	movl	48(%rbp), %eax
	movl	(%rdx), %ecx
	addl	%eax, %eax
	sall	%cl, %esi
	orl	%edi, %eax
	leal	-1(%rsi), %edx
	andl	%edx, %eax
	movq	branch_mask_global@GOTPCREL(%rip), %rdx
	movl	%eax, (%rdx)
	movq	parar_clarividente@GOTPCREL(%rip), %rax
	movl	(%rax), %edi
	testl	%edi, %edi
	je	.L87
	movq	orden_clarividente@GOTPCREL(%rip), %rdx
	movl	(%rdx), %edi
	cmpl	%edi, 92(%rbp)
	jne	.L87
	movl	$0, (%rax)
.L87:
	call	cancelar_instrucciones@PLT
.L48:
	leaq	128(%rsp), %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,7
	.p2align 3
.L150:
	.cfi_restore_state
	testb	%cl, %cl
	je	.L153
	movq	16(%rax), %rax
	movq	RS@GOTPCREL(%rip), %rsi
	leaq	(%rax,%rax,4), %rcx
	leaq	(%rax,%rcx,4), %rcx
	cmpl	$1, 124(%rsi,%rcx,8)
	jne	.L48
	movq	estat@GOTPCREL(%rip), %r13
	addq	$1, 8(%r13)
	jmp	.L54
	.p2align 4,,7
	.p2align 3
.L69:
	leaq	(%rdx,%rdx,2), %rcx
	salq	$5, %rcx
	addq	%rbp, %rcx
	movq	16(%rcx), %rdi
	movq	24(%rcx), %rcx
	movq	%rdi, %rsi
	salq	$4, %rsi
	addq	Rfp@GOTPCREL(%rip), %rsi
	movq	%rcx, (%rsi)
	cmpl	8(%rsi), %edx
	jne	.L92
	movl	$4096, 8(%rsi)
.L92:
	leal	-141(%r8), %ecx
	cmpl	$42, %ecx
	jbe	.L93
	leal	-128(%r8), %ecx
.L94:
	movabsq	$18014398509490111, %rsi
	btq	%rcx, %rsi
	jnc	.L96
	movq	Rfp_tipo@GOTPCREL(%rip), %rcx
	movl	$6, (%rcx,%rdi,4)
.L96:
	leal	-154(%r8), %ecx
	cmpl	$3, %ecx
	jbe	.L118
	subl	$180, %r8d
	cmpl	$1, %r8d
	ja	.L79
.L118:
	movq	Rfp_tipo@GOTPCREL(%rip), %rcx
	movl	$7, (%rcx,%rdi,4)
	.p2align 4,,15
.L79:
	leaq	(%rdx,%rdx,2), %rdx
	addl	$1, %eax
	movq	TAM_REORDER@GOTPCREL(%rip), %rdi
	salq	$5, %rdx
	addq	%rdx, %rbp
	movl	%eax, %edx
	sarl	$31, %edx
	idivl	(%rdi)
	movq	RB_long@GOTPCREL(%rip), %rax
	movl	$0, 0(%rbp)
	movl	$0, 72(%rbp)
	subl	$1, (%rax)
	movl	%edx, (%rbx)
	jmp	.L48
	.p2align 4,,7
	.p2align 3
.L152:
	cmpl	$4, %edx
	je	.L154
.L112:
	imulq	$96, %rax, %rax
	movq	%r14, %r8
	leaq	.LC6(%rip), %rsi
	movq	80(%rbp,%rax), %rcx
	movq	Ciclo@GOTPCREL(%rip), %rax
	movl	(%rax), %edx
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	xorl	%eax, %eax
	call	fprintf@PLT
	movl	$1, %edi
	call	exit@PLT
	.p2align 4,,7
	.p2align 3
.L151:
	testl	%edx, %edx
	jne	.L155
	movq	presentacion@GOTPCREL(%rip), %rdx
	movq	64(%rdx), %rcx
.L66:
	leaq	(%rax,%rax,2), %rax
	xorl	%edx, %edx
	leaq	.LC7(%rip), %rdi
	salq	$5, %rax
	movl	92(%rbp,%rax), %esi
	call	*%rcx
	jmp	.L67
	.p2align 4,,7
	.p2align 3
.L155:
	cmpl	$1, %edx
	jne	.L112
	movq	Ciclo@GOTPCREL(%rip), %rax
	movq	%r14, %r8
	movq	80(%rcx), %rcx
	leaq	.LC2(%rip), %rsi
	movl	(%rax), %edx
.L144:
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	xorl	%eax, %eax
	call	fprintf@PLT
	movslq	(%rbx), %rax
	movl	$1, (%r12)
	leaq	(%rax,%rax,2), %rdx
	salq	$5, %rdx
	movl	72(%rbp,%rdx), %esi
.L56:
	movq	presentacion@GOTPCREL(%rip), %rdx
	testl	%esi, %esi
	movq	64(%rdx), %rcx
	je	.L66
	jmp	.L65
	.p2align 4,,7
	.p2align 3
.L72:
	leaq	(%rdx,%rdx,2), %rcx
	salq	$5, %rcx
	addq	%rbp, %rcx
	movq	16(%rcx), %rdi
	movq	24(%rcx), %rcx
	movq	%rdi, %rsi
	salq	$4, %rsi
	addq	Rfp@GOTPCREL(%rip), %rsi
	movq	%rcx, (%rsi)
	cmpl	8(%rsi), %edx
	jne	.L101
	movl	$4096, 8(%rsi)
.L101:
	movq	Rfp_tipo@GOTPCREL(%rip), %rcx
	addq	$2, 16(%r13)
	movl	$7, (%rcx,%rdi,4)
	jmp	.L79
	.p2align 4,,7
	.p2align 3
.L73:
	leaq	(%rdx,%rdx,2), %rsi
	salq	$5, %rsi
	addq	%rbp, %rsi
	movq	16(%rsi), %rcx
	movq	24(%rsi), %rsi
	salq	$4, %rcx
	addq	Rint@GOTPCREL(%rip), %rcx
	movq	%rsi, (%rcx)
	cmpl	8(%rcx), %edx
	jne	.L100
	movl	$4096, 8(%rcx)
	.p2align 4,,15
.L100:
	addq	$1, 16(%r13)
	jmp	.L79
	.p2align 4,,7
	.p2align 3
.L74:
	leaq	(%rdx,%rdx,2), %rcx
	salq	$5, %rcx
	addq	%rbp, %rcx
	movq	16(%rcx), %rdi
	movq	24(%rcx), %rcx
	movq	%rdi, %rsi
	salq	$4, %rsi
	addq	Rfp@GOTPCREL(%rip), %rsi
	movq	%rcx, (%rsi)
	cmpl	8(%rsi), %edx
	jne	.L98
	movl	$4096, 8(%rsi)
.L98:
	leal	-141(%r8), %ecx
	cmpl	$5, %ecx
	jbe	.L156
	leal	-130(%r8), %ecx
	cmpl	$3, %ecx
	ja	.L104
.L103:
	movq	Rfp_tipo@GOTPCREL(%rip), %rcx
	movl	$6, (%rcx,%rdi,4)
	jmp	.L100
	.p2align 4,,7
	.p2align 3
.L76:
	movq	Rint@GOTPCREL(%rip), %rcx
	leaq	(%rdx,%rdx,2), %rsi
	salq	$5, %rsi
	addq	%rbp, %rsi
	movq	16(%rsi), %rdi
	cmpl	$1, 40(%rsi)
	je	.L141
.L90:
	salq	$4, %rdi
	addq	%rdi, %rcx
	cmpl	8(%rcx), %eax
	jne	.L79
	movl	$4096, 8(%rcx)
	jmp	.L79
	.p2align 4,,7
	.p2align 3
.L75:
	subl	$110, %r8d
	cmpl	$1, %r8d
	jbe	.L157
.L83:
	leaq	(%rdx,%rdx,2), %rsi
	salq	$5, %rsi
	addq	%rbp, %rsi
	movl	72(%rsi), %r8d
	testl	%r8d, %r8d
	je	.L158
.L85:
	addq	$1, 40(%r13)
	call	prediccion_correcta@PLT
	testl	%eax, %eax
	je	.L86
	movslq	(%rbx), %rdx
	addq	$1, 48(%r13)
	movq	%rdx, %rax
	jmp	.L79
	.p2align 4,,7
	.p2align 3
.L71:
	leaq	(%rdx,%rdx,2), %rcx
	salq	$5, %rcx
	movq	16(%rbp,%rcx), %rcx
	leaq	(%rcx,%rcx,4), %rsi
	leaq	(%rcx,%rsi,4), %rcx
	movq	RS@GOTPCREL(%rip), %rsi
	leaq	(%rsi,%rcx,8), %rcx
	movl	$1, 120(%rcx)
	jmp	.L79
	.p2align 4,,7
	.p2align 3
.L78:
	movq	TAM_RS_SUMREST@GOTPCREL(%rip), %rcx
	movl	(%rcx), %esi
	movq	TAM_RS_ENTEROS@GOTPCREL(%rip), %rcx
	addl	(%rcx), %esi
	movq	TAM_RS_MULTDIV@GOTPCREL(%rip), %rcx
	addl	(%rcx), %esi
	movq	TAM_BUFFER_CARGA@GOTPCREL(%rip), %rcx
	addl	(%rcx), %esi
	movq	TAM_BUFFER_ALMACEN@GOTPCREL(%rip), %rcx
	movl	(%rcx), %edi
	leal	(%rdi,%rsi), %ecx
	cmpl	%esi, %ecx
	jle	.L80
	movq	RS@GOTPCREL(%rip), %r8
	movslq	%esi, %rsi
	leaq	(%rsi,%rsi,4), %rcx
	leaq	(%rsi,%rcx,4), %rcx
	leaq	(%r8,%rcx,8), %rcx
	movl	(%rcx), %r9d
	testl	%r9d, 120(%rcx)
	jne	.L79
	leal	-1(%rdi), %edi
	addq	%rdi, %rsi
	leaq	(%rsi,%rsi,4), %rdi
	leaq	(%rsi,%rdi,4), %rsi
	leaq	(%r8,%rsi,8), %r8
	jmp	.L81
	.p2align 4,,7
	.p2align 3
.L82:
	movq	%rcx, %rsi
	addq	$168, %rcx
	movl	168(%rsi), %edi
	testl	%edi, 288(%rsi)
	jne	.L79
.L81:
	cmpq	%rcx, %r8
	jne	.L82
.L80:
	leaq	(%rdx,%rdx,2), %rdx
	movl	%eax, %edi
	movl	$1, %ecx
	salq	$5, %rdx
	addq	%rbp, %rdx
	movq	80(%rdx), %rsi
	movl	92(%rdx), %edx
	leaq	4(%rsi), %r8
	call	actualizar_prediccion@PLT
	call	cancelar_instrucciones@PLT
	movq	SIG_SYSCALL@GOTPCREL(%rip), %rax
	cmpl	$1, (%rax)
	je	.L102
	movslq	(%rbx), %rdx
	movq	%rdx, %rax
	jmp	.L79
	.p2align 4,,7
	.p2align 3
.L77:
	movq	Rint@GOTPCREL(%rip), %rcx
	leaq	(%rdx,%rdx,2), %rsi
	salq	$5, %rsi
	addq	%rbp, %rsi
	movq	16(%rsi), %rdi
	testq	%rdi, %rdi
	je	.L88
	movq	24(%rsi), %rsi
	movq	%rdi, %r8
	salq	$4, %r8
	movq	%rsi, (%rcx,%r8)
.L88:
	movq	%rdi, %rsi
	salq	$4, %rsi
	addq	%rsi, %rcx
	cmpl	8(%rcx), %eax
	jne	.L89
	movl	$4096, 8(%rcx)
.L89:
	movq	Rint_tipo@GOTPCREL(%rip), %rcx
	movl	$5, (%rcx,%rdi,4)
	jmp	.L79
	.p2align 4,,7
	.p2align 3
.L53:
	subl	$129, %esi
	cmpl	$52, %esi
	ja	.L55
.L105:
	movabsq	$4503599627378689, %rax
	btq	%rsi, %rax
	jnc	.L55
	movq	RS@GOTPCREL(%rip), %rsi
	leaq	(%rdx,%rdx,2), %rax
	salq	$5, %rax
	movq	16(%rbp,%rax), %rax
	jmp	.L54
	.p2align 4,,7
	.p2align 3
.L154:
	movq	Ciclo@GOTPCREL(%rip), %rax
	movq	%r14, %r8
	movq	80(%rcx), %rcx
	leaq	.LC4(%rip), %rsi
	movl	(%rax), %edx
.L149:
	movq	stderr@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	xorl	%eax, %eax
	call	fprintf@PLT
	movslq	(%rbx), %rax
	movl	$1, (%r12)
	leaq	(%rax,%rax,2), %rdx
	salq	$5, %rdx
	addq	%rbp, %rdx
	movl	4(%rdx), %ecx
	leal	-65(%rcx), %esi
	andl	$-65, %esi
	je	.L117
	leal	-16(%rcx), %esi
	cmpl	$2, %esi
	ja	.L61
.L117:
	leaq	(%rax,%rax,2), %rdx
	salq	$5, %rdx
	movl	72(%rbp,%rdx), %esi
.L63:
	movq	RS@GOTPCREL(%rip), %r9
	leaq	(%rax,%rax,2), %rdx
	salq	$5, %rdx
	movq	16(%rbp,%rdx), %rdx
	leaq	(%rdx,%rdx,4), %rcx
	leaq	(%rdx,%rcx,4), %rdx
	leaq	(%r9,%rdx,8), %rdx
	movl	$0, (%rdx)
	jmp	.L56
	.p2align 4,,7
	.p2align 3
.L113:
	movq	Ciclo@GOTPCREL(%rip), %rax
	movq	%r14, %r8
	movq	80(%rcx), %rcx
	leaq	.LC5(%rip), %rsi
	movl	(%rax), %edx
	jmp	.L144
	.p2align 4,,7
	.p2align 3
.L108:
	movq	Ciclo@GOTPCREL(%rip), %rax
	movq	%r14, %r8
	movq	80(%rcx), %rcx
	leaq	.LC3(%rip), %rsi
	movl	(%rax), %edx
	jmp	.L149
	.p2align 4,,7
	.p2align 3
.L153:
	subl	$129, %esi
	cmpl	$52, %esi
	ja	.L48
	movabsq	$4503599627378689, %rcx
	btq	%rsi, %rcx
	jnc	.L48
	movq	16(%rax), %rax
	leaq	(%rax,%rax,4), %rcx
	leaq	(%rax,%rcx,4), %rax
	movq	RS@GOTPCREL(%rip), %rcx
	leaq	(%rcx,%rax,8), %rax
	cmpl	$1, 124(%rax)
	jne	.L48
	movq	estat@GOTPCREL(%rip), %r13
	addq	$1, 8(%r13)
	jmp	.L105
.L156:
	movq	Rfp_tipo@GOTPCREL(%rip), %rcx
	movl	$8, (%rcx,%rdi,4)
.L104:
	subl	$135, %r8d
	cmpl	$5, %r8d
	ja	.L100
	jmp	.L103
	.p2align 4,,7
	.p2align 3
.L61:
	movl	72(%rdx), %esi
	cmpl	$142, %ecx
	je	.L63
	cmpl	$181, %ecx
	je	.L63
	jmp	.L56
.L93:
	movabsq	$4398046519231, %rsi
	btq	%rcx, %rsi
	jnc	.L95
	movq	Rfp_tipo@GOTPCREL(%rip), %rcx
	movl	$8, (%rcx,%rdi,4)
.L95:
	leal	-128(%r8), %ecx
	cmpl	$55, %ecx
	je	.L79
	jmp	.L94
	.p2align 4,,7
	.p2align 3
.L157:
	leaq	(%rdx,%rdx,2), %rcx
	salq	$5, %rcx
	addq	%rbp, %rcx
	movq	16(%rcx), %rdi
	movq	24(%rcx), %rcx
	movq	%rdi, %rsi
	salq	$4, %rsi
	addq	Rint@GOTPCREL(%rip), %rsi
	movq	%rcx, (%rsi)
	cmpl	8(%rsi), %edx
	jne	.L84
	movl	$4096, 8(%rsi)
.L84:
	movq	Rint_tipo@GOTPCREL(%rip), %rcx
	movl	$5, (%rcx,%rdi,4)
	jmp	.L83
.L141:
	testq	%rdi, %rdi
	je	.L90
	movq	24(%rsi), %rsi
	movq	%rdi, %r8
	salq	$4, %r8
	movq	%rsi, (%rcx,%r8)
	jmp	.L90
.L158:
	movq	32(%rsi), %r8
	movl	%eax, %edi
	movl	40(%rsi), %ecx
	movl	92(%rsi), %edx
	movq	80(%rsi), %rsi
	call	actualizar_prediccion@PLT
	jmp	.L85
.L102:
	movl	$0, (%rax)
	call	process_syscall@PLT
	movl	%eax, (%r12)
	jmp	.L48
.L68:
	movq	stderr@GOTPCREL(%rip), %rax
	movl	$476, %ecx
	leaq	.LC8(%rip), %rdx
	leaq	.LC9(%rip), %rsi
	movq	(%rax), %rdi
	xorl	%eax, %eax
	call	fprintf@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE29:
	.size	fase_COM, .-fase_COM
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
