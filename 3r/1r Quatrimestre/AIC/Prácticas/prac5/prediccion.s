	.file	"prediccion.c"
	.text
	.p2align 4,,15
	.type	cambia_estado_saturacion.part.0, @function
cambia_estado_saturacion.part.0:
.LFB31:
	.cfi_startproc
	movl	%esi, %ecx
	movl	$1, %eax
	movl	(%rdi), %edx
	sall	%cl, %eax
	subl	$1, %eax
	cmpl	%eax, %edx
	jge	.L1
	addl	$1, %edx
	movl	%edx, (%rdi)
.L1:
	ret
	.cfi_endproc
.LFE31:
	.size	cambia_estado_saturacion.part.0, .-cambia_estado_saturacion.part.0
	.p2align 4,,15
	.type	cambia_estado_histeresis, @function
cambia_estado_histeresis:
.LFB27:
	.cfi_startproc
	movl	$1, %eax
	leal	-1(%rdx), %ecx
	movl	(%rsi), %r8d
	movl	%eax, %r9d
	sall	%cl, %r9d
	testl	%edi, %edi
	je	.L5
	movl	%edx, %ecx
	subl	$1, %r9d
	sall	%cl, %eax
	subl	$1, %eax
	cmpl	%r9d, %r8d
	je	.L9
	cmpl	%eax, %r8d
	jge	.L4
	addl	$1, %r8d
	movl	%r8d, (%rsi)
	ret
	.p2align 4,,7
	.p2align 3
.L5:
	cmpl	%r9d, %r8d
	je	.L10
	testl	%r8d, %r8d
	jle	.L4
	subl	$1, %r8d
	movl	%r8d, (%rsi)
.L4:
	ret
	.p2align 4,,7
	.p2align 3
.L9:
	movl	%eax, (%rsi)
	ret
	.p2align 4,,7
	.p2align 3
.L10:
	movl	$0, (%rsi)
	ret
	.cfi_endproc
.LFE27:
	.size	cambia_estado_histeresis, .-cambia_estado_histeresis
	.p2align 4,,15
	.globl	inicializa_prediccion
	.type	inicializa_prediccion, @function
inicializa_prediccion:
.LFB28:
	.cfi_startproc
	movq	branch_mask_global@GOTPCREL(%rip), %rax
	pxor	%xmm0, %xmm0
	movl	$0, (%rax)
	movq	branch_mask_local@GOTPCREL(%rip), %rax
	movl	$0, (%rax)
	movq	Global@GOTPCREL(%rip), %rax
	movdqu	%xmm0, (%rax)
	movdqu	%xmm0, 16(%rax)
	movdqu	%xmm0, 32(%rax)
	movdqu	%xmm0, 48(%rax)
	movq	TAM_BUFFER_PREDIC@GOTPCREL(%rip), %rax
	movl	(%rax), %edx
	testl	%edx, %edx
	jle	.L11
	movq	BTB@GOTPCREL(%rip), %rcx
	leal	-1(%rdx), %edx
	leaq	(%rdx,%rdx,2), %rdx
	salq	$5, %rdx
	leaq	24(%rcx), %rax
	leaq	120(%rcx,%rdx), %rcx
	movq	$-1, %rdx
	.p2align 4,,15
.L13:
	pxor	%xmm0, %xmm0
	addq	$96, %rax
	movq	%rdx, -120(%rax)
	movl	$0, -112(%rax)
	movdqu	%xmm0, -96(%rax)
	movdqu	%xmm0, -80(%rax)
	movdqu	%xmm0, -64(%rax)
	movq	$0, -104(%rax)
	movl	$0, -32(%rax)
	movl	$0, -28(%rax)
	movdqu	%xmm0, -48(%rax)
	cmpq	%rcx, %rax
	jne	.L13
.L11:
	ret
	.cfi_endproc
.LFE28:
	.size	inicializa_prediccion, .-inicializa_prediccion
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%u %ld %u %ld\n"
.LC1:
	.string	"prediccion.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"Error: %s; funci\303\263n:%s; l\303\255nea:%d\n"
	.section	.rodata.str1.1
.LC3:
	.string	"Final de la traza de saltos\n"
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"ERROR (%s:%d): Predictor no implementado\n"
	.text
	.p2align 4,,15
	.globl	obtener_prediccion
	.type	obtener_prediccion, @function
obtener_prediccion:
.LFB29:
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
	leaq	-40(%rsp), %rsp
	.cfi_def_cfa_offset 96
	movq	branch_mask_global@GOTPCREL(%rip), %rax
	movq	$0, (%rcx)
	movq	$0, 8(%r8)
	movl	(%rax), %r11d
	movq	branch_mask_local@GOTPCREL(%rip), %rax
	movl	%r11d, (%r8)
	movl	(%rax), %r15d
	movq	tipo_predictor@GOTPCREL(%rip), %rax
	movl	%r15d, 4(%r8)
	movl	(%rax), %r10d
	cmpl	$10, %r10d
	je	.L101
	leal	-8(%r10), %eax
	movq	%rcx, %r14
	cmpl	$1, %eax
	movq	%rdx, %r13
	movl	%esi, %r12d
	movq	%rdi, %rbx
	jbe	.L107
.L18:
	movq	TAM_BUFFER_PREDIC@GOTPCREL(%rip), %rax
	movl	(%rax), %edx
	testl	%edx, %edx
	jle	.L101
	movq	n_bits_pred_local@GOTPCREL(%rip), %rax
	leal	-1(%rdx), %edx
	leaq	(%rdx,%rdx,2), %rdx
	xorl	%ebp, %ebp
	leaq	.L52(%rip), %r9
	movl	(%rax), %ecx
	movl	$1, %eax
	movl	%eax, %esi
	movl	%eax, %edi
	salq	$5, %rdx
	subl	$1, %ecx
	sall	%cl, %esi
	movq	n_bits_pred_global@GOTPCREL(%rip), %rcx
	movl	%esi, 8(%rsp)
	movl	%r10d, %esi
	movl	(%rcx), %ecx
	subl	$1, %ecx
	sall	%cl, %edi
	movq	n_bits_pred_hybrid@GOTPCREL(%rip), %rcx
	movl	%edi, (%rsp)
	movl	(%rcx), %ecx
	subl	$1, %ecx
	sall	%cl, %eax
	movslq	%r15d, %rcx
	movl	%eax, 20(%rsp)
	movq	BTB@GOTPCREL(%rip), %rax
	movl	8(%rsp), %r15d
	movq	%rcx, 8(%rsp)
	leaq	96(%rax,%rdx), %rdi
	movslq	%r11d, %rdx
	jmp	.L64
	.p2align 4,,7
	.p2align 3
.L49:
	addq	$96, %rax
	cmpq	%rax, %rdi
	je	.L15
.L64:
	cmpq	%rbx, (%rax)
	jne	.L49
	movq	estat@GOTPCREL(%rip), %r11
	movl	%r12d, 92(%rax)
	addq	$1, 32(%r11)
	cmpl	$7, %r10d
	ja	.L50
	movslq	(%r9,%rsi,4), %r11
	addq	%r9, %r11
	jmp	*%r11
	.section	.rodata
	.align 4
	.align 4
.L52:
	.long	.L56-.L52
	.long	.L55-.L52
	.long	.L55-.L52
	.long	.L54-.L52
	.long	.L54-.L52
	.long	.L53-.L52
	.long	.L51-.L52
	.long	.L51-.L52
	.text
	.p2align 4,,7
	.p2align 3
.L53:
	cmpl	$3, 8(%rax)
	je	.L100
.L95:
	movl	$0, 0(%r13)
	movl	$1, %ebp
.L109:
	addq	$96, %rax
	cmpq	%rax, %rdi
	jne	.L64
.L15:
	leaq	40(%rsp), %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%ebp, %eax
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
.L54:
	.cfi_restore_state
	movq	8(%rsp), %rcx
	cmpl	%r15d, 24(%rax,%rcx,4)
	jl	.L95
.L100:
	movq	16(%rax), %r11
	movl	$1, %ebp
	movl	$1, 0(%r13)
	movq	%r11, (%r14)
	jmp	.L49
	.p2align 4,,7
	.p2align 3
.L55:
	movq	Global@GOTPCREL(%rip), %r11
	movl	(%rsp), %ebp
	cmpl	%ebp, (%r11,%rdx,4)
	jl	.L95
	jmp	.L100
	.p2align 4,,7
	.p2align 3
.L56:
	movq	8(%rsp), %rcx
	cmpl	24(%rax,%rcx,4), %r15d
	jle	.L108
	movq	Global@GOTPCREL(%rip), %r11
	movl	%r10d, %ebp
	movl	(%rsp), %ecx
	movl	$0, 16(%rsp)
	cmpl	(%r11,%rdx,4), %ecx
	jg	.L62
.L110:
	movq	16(%rax), %rcx
	movl	$1, 8(%r8)
	movq	%rcx, %r11
	movl	16(%rsp), %ecx
	movl	%ecx, 12(%r8)
	movl	20(%rsp), %ecx
	cmpl	88(%rax), %ecx
	jle	.L65
	movl	$1, 0(%r13)
	movl	$1, %ebp
	movq	%r11, (%r14)
	jmp	.L49
	.p2align 4,,7
	.p2align 3
.L51:
	movl	8(%rax), %r11d
	subl	$2, %r11d
	cmpl	$1, %r11d
	jbe	.L100
	movl	$0, 0(%r13)
	movl	$1, %ebp
	jmp	.L109
	.p2align 4,,7
	.p2align 3
.L108:
	movq	16(%rax), %rcx
	movl	$1, %ebp
	movq	Global@GOTPCREL(%rip), %r11
	movl	$1, 16(%rsp)
	movq	%rcx, 24(%rsp)
	movl	(%rsp), %ecx
	cmpl	(%r11,%rdx,4), %ecx
	jle	.L110
.L62:
	movl	16(%rsp), %ecx
	movl	$0, 8(%r8)
	movl	%ecx, 12(%r8)
	movl	20(%rsp), %ecx
	cmpl	%ecx, 88(%rax)
	jl	.L95
.L65:
	movl	%ebp, 0(%r13)
	testl	%ebp, %ebp
	je	.L68
	movq	24(%rsp), %rcx
	movq	%rcx, (%r14)
	jmp	.L49
	.p2align 4,,7
	.p2align 3
.L107:
	movq	fase_ejecucion@GOTPCREL(%rip), %rax
	movl	(%rax), %ebp
	testl	%ebp, %ebp
	je	.L15
	cmpl	$1, %ebp
	jne	.L18
	movq	ciclo1@GOTPCREL(%rip), %rax
	movq	Ciclo@GOTPCREL(%rip), %r11
	movl	(%rax), %eax
	cmpl	%eax, (%r11)
	je	.L111
	movq	parar_clarividente@GOTPCREL(%rip), %rax
	movl	(%rax), %ecx
	testl	%ecx, %ecx
	jne	.L112
	movq	leer_sig_traza@GOTPCREL(%rip), %r15
	cmpl	$1, (%r15)
	je	.L92
	movq	PC1@GOTPCREL(%rip), %r10
.L31:
	cmpq	%rbx, (%r10)
	jne	.L32
	movq	tipo_predictor@GOTPCREL(%rip), %rax
	movq	$-1, (%r10)
	cmpl	$8, (%rax)
	je	.L33
	movq	TAM_BUFFER_PREDIC@GOTPCREL(%rip), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jle	.L35
	leal	-1(%rax), %eax
	xorl	%esi, %esi
	movq	BTB@GOTPCREL(%rip), %rdx
	leaq	(%rax,%rax,2), %rcx
	salq	$5, %rcx
	leaq	96(%rdx), %rax
	addq	%rax, %rcx
	jmp	.L39
	.p2align 4,,7
	.p2align 3
.L113:
	leaq	96(%rax), %rax
.L39:
	cmpq	%rbx, (%rdx)
	jne	.L38
	movl	%r12d, 92(%rdx)
	movl	$1, %esi
.L38:
	cmpq	%rax, %rcx
	movq	%rax, %rdx
	jne	.L113
	testl	%esi, %esi
	je	.L35
.L33:
	movq	estat@GOTPCREL(%rip), %rax
	addq	$1, 32(%rax)
	movq	cond1@GOTPCREL(%rip), %rax
	movl	(%rax), %edx
	testl	%edx, %edx
	jne	.L36
	movl	$0, 0(%r13)
.L37:
	movl	$1, (%r15)
	jmp	.L15
.L32:
	movq	IF_ISS_1@GOTPCREL(%rip), %rax
	movl	(%rax), %eax
	leal	-100(%rax), %edx
	cmpl	$5, %edx
	ja	.L114
.L42:
	movq	tipo_predictor@GOTPCREL(%rip), %rax
	cmpl	$8, (%rax)
	je	.L97
	movq	TAM_BUFFER_PREDIC@GOTPCREL(%rip), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jle	.L43
	leal	-1(%rax), %eax
	xorl	%esi, %esi
	movq	BTB@GOTPCREL(%rip), %rdx
	leaq	(%rax,%rax,2), %rcx
	salq	$5, %rcx
	leaq	96(%rdx), %rax
	addq	%rax, %rcx
	jmp	.L48
	.p2align 4,,7
	.p2align 3
.L115:
	leaq	96(%rax), %rax
.L48:
	cmpq	%rbx, (%rdx)
	jne	.L47
	movl	%r12d, 92(%rdx)
	movl	$1, %esi
.L47:
	cmpq	%rcx, %rax
	movq	%rax, %rdx
	jne	.L115
	testl	%esi, %esi
	je	.L43
.L97:
	movq	estat@GOTPCREL(%rip), %rax
	addq	$1, 32(%rax)
.L43:
	movl	$0, (%r15)
	.p2align 4,,15
.L101:
	xorl	%ebp, %ebp
	jmp	.L15
	.p2align 4,,7
	.p2align 3
.L68:
	movl	$1, %ebp
	jmp	.L49
.L92:
	movq	f_trace@GOTPCREL(%rip), %rax
	leaq	.LC0(%rip), %rsi
	movq	PC1@GOTPCREL(%rip), %r10
	movq	dest1@GOTPCREL(%rip), %r9
	movq	cond1@GOTPCREL(%rip), %r8
	movq	orden1@GOTPCREL(%rip), %rdx
	movq	%r10, %rcx
	movq	(%rax), %rdi
	xorl	%eax, %eax
	movq	%r10, (%rsp)
	call	__isoc99_fscanf@PLT
	movq	orden1@GOTPCREL(%rip), %rax
	movq	(%rsp), %r10
	movq	Ciclo@GOTPCREL(%rip), %r11
	cmpl	$-2, (%rax)
	jne	.L31
	movq	stderr@GOTPCREL(%rip), %rbx
	movl	$269, %r8d
	leaq	__func__.3935(%rip), %rcx
	leaq	.LC1(%rip), %rdx
	leaq	.LC2(%rip), %rsi
	xorl	%eax, %eax
	movq	(%rbx), %rdi
	call	fprintf@PLT
	movq	(%rbx), %rcx
	leaq	.LC3(%rip), %rdi
	movl	$28, %edx
	movl	$1, %esi
	call	fwrite@PLT
	movl	$1, %edi
	call	exit@PLT
	.p2align 4,,7
	.p2align 3
.L112:
	movq	TAM_BUFFER_PREDIC@GOTPCREL(%rip), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jle	.L101
	leal	-1(%rax), %eax
	xorl	%esi, %esi
	movq	BTB@GOTPCREL(%rip), %rdx
	leaq	(%rax,%rax,2), %rcx
	salq	$5, %rcx
	leaq	96(%rdx), %rax
	addq	%rax, %rcx
	jmp	.L30
	.p2align 4,,7
	.p2align 3
.L116:
	leaq	96(%rax), %rax
.L30:
	cmpq	%rbx, (%rdx)
	jne	.L29
	movl	%r12d, 92(%rdx)
	movl	$1, %esi
.L29:
	cmpq	%rcx, %rax
	movq	%rax, %rdx
	jne	.L116
.L91:
	testl	%esi, %esi
	je	.L101
.L103:
	movq	estat@GOTPCREL(%rip), %rax
	xorl	%ebp, %ebp
	addq	$1, 32(%rax)
	jmp	.L15
.L111:
	movq	IF_ISS_1@GOTPCREL(%rip), %rax
	movl	(%rax), %eax
	leal	-100(%rax), %edx
	cmpl	$5, %edx
	ja	.L117
.L23:
	cmpl	$8, %r10d
	je	.L103
	movq	TAM_BUFFER_PREDIC@GOTPCREL(%rip), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jle	.L101
	leal	-1(%rax), %eax
	xorl	%esi, %esi
	movq	BTB@GOTPCREL(%rip), %rdx
	leaq	(%rax,%rax,2), %rcx
	salq	$5, %rcx
	leaq	96(%rdx), %rax
	addq	%rax, %rcx
	jmp	.L27
.L118:
	leaq	96(%rax), %rax
.L27:
	cmpq	%rbx, (%rdx)
	jne	.L26
	movl	%r12d, 92(%rdx)
	movl	$1, %esi
.L26:
	cmpq	%rax, %rcx
	movq	%rax, %rdx
	jne	.L118
	jmp	.L91
.L35:
	movq	cond1@GOTPCREL(%rip), %rax
	movl	$0, 0(%r13)
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L41
	movq	orden_clarividente@GOTPCREL(%rip), %rax
	movl	%r12d, (%rax)
	movq	parar_clarividente@GOTPCREL(%rip), %rax
	movl	$1, (%rax)
.L41:
	movl	$1, (%r15)
	xorl	%ebp, %ebp
	jmp	.L15
.L114:
	subl	$108, %eax
	cmpl	$3, %eax
	ja	.L43
	jmp	.L42
.L36:
	movq	dest1@GOTPCREL(%rip), %rax
	movq	ciclo1@GOTPCREL(%rip), %rsi
	movl	$1, 0(%r13)
	movq	(%rax), %rax
	movq	%rax, (%r14)
	movl	(%r11), %eax
	movl	%eax, (%rsi)
	jmp	.L37
.L117:
	subl	$108, %eax
	cmpl	$3, %eax
	jbe	.L23
	xorl	%ebp, %ebp
	jmp	.L15
.L50:
	movq	stderr@GOTPCREL(%rip), %rax
	movl	$478, %ecx
	leaq	.LC1(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	(%rax), %rdi
	xorl	%eax, %eax
	call	fprintf@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE29:
	.size	obtener_prediccion, .-obtener_prediccion
	.section	.rodata.str1.1
.LC5:
	.string	"%u %ld %d %ld\n"
	.text
	.p2align 4,,15
	.globl	actualizar_prediccion
	.type	actualizar_prediccion, @function
actualizar_prediccion:
.LFB30:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%ecx, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%r8, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	leaq	-72(%rsp), %rsp
	.cfi_def_cfa_offset 128
	movq	tipo_predictor@GOTPCREL(%rip), %rax
	movl	%edi, 36(%rsp)
	movl	%edx, 40(%rsp)
	movl	(%rax), %ecx
	leal	-8(%rcx), %eax
	cmpl	$1, %eax
	jbe	.L191
.L120:
	movl	%ecx, %eax
	andl	$-3, %eax
	cmpl	$8, %eax
	je	.L119
	movq	TAM_BUFFER_PREDIC@GOTPCREL(%rip), %r14
	movl	(%r14), %eax
	testl	%eax, %eax
	jle	.L168
	movslq	36(%rsp), %rdx
	cmpl	$1, %r15d
	movq	%r13, 8(%rsp)
	sbbl	%eax, %eax
	leaq	(%rdx,%rdx,2), %rdx
	addl	$3, %eax
	cmpl	$1, %r15d
	movl	%eax, 44(%rsp)
	sbbl	%eax, %eax
	andl	$-2, %eax
	addl	$3, %eax
	cmpl	$1, %r15d
	movl	%eax, 48(%rsp)
	sbbl	%eax, %eax
	xorl	%r11d, %r11d
	salq	$5, %rdx
	xorl	%r8d, %r8d
	movq	%rdx, 16(%rsp)
	notl	%eax
	andl	$2, %eax
	movl	%eax, 52(%rsp)
	movq	BTB@GOTPCREL(%rip), %rax
	movq	%rax, 24(%rsp)
	leaq	88(%rax), %r10
	movl	$-1, %eax
	movl	%eax, %ebx
	movl	%eax, %r13d
	jmp	.L160
	.p2align 4,,7
	.p2align 3
.L124:
	movl	4(%r10), %edx
	cmpl	%ebx, %edx
	jnb	.L159
	movl	%ebp, %r13d
	movl	%edx, %ebx
.L159:
	addq	$1, %r11
	addq	$96, %r10
	cmpl	%r11d, (%r14)
	jle	.L192
.L160:
	cmpq	%r12, -88(%r10)
	movl	%r11d, %ebp
	jne	.L124
	movq	8(%rsp), %rax
	movq	%rax, -72(%r10)
	movq	tipo_predictor@GOTPCREL(%rip), %rax
	movl	(%rax), %r8d
	cmpl	$9, %r8d
	ja	.L125
	leaq	.L127(%rip), %rsi
	movl	%r8d, %ecx
	movslq	(%rsi,%rcx,4), %rdx
	addq	%rsi, %rdx
	jmp	*%rdx
	.section	.rodata
	.align 4
	.align 4
.L127:
	.long	.L134-.L127
	.long	.L133-.L127
	.long	.L132-.L127
	.long	.L131-.L127
	.long	.L130-.L127
	.long	.L126-.L127
	.long	.L129-.L127
	.long	.L128-.L127
	.long	.L125-.L127
	.long	.L126-.L127
	.text
	.p2align 4,,7
	.p2align 3
.L192:
	testl	%r8d, %r8d
	movslq	%r13d, %rax
	movq	8(%rsp), %r13
	jne	.L119
	movq	tipo_predictor@GOTPCREL(%rip), %rdi
	movl	(%rdi), %ecx
.L123:
	movl	40(%rsp), %ebx
	leaq	(%rax,%rax,2), %rdi
	movq	%rdi, %rdx
	salq	$5, %rdx
	addq	24(%rsp), %rdx
	cmpl	$9, %ecx
	movq	%r12, (%rdx)
	movl	%ebx, 92(%rdx)
	movq	%r13, 16(%rdx)
	ja	.L119
	movl	$1, %esi
	salq	%cl, %rsi
	testl	$736, %esi
	movq	%rsi, %rcx
	jne	.L162
	andl	$31, %ecx
	je	.L119
	movslq	36(%rsp), %rdx
	leaq	(%rdx,%rdx,2), %rdx
	salq	$5, %rdx
	addq	RB@GOTPCREL(%rip), %rdx
	testl	%r15d, %r15d
	movslq	52(%rdx), %rcx
	movslq	48(%rdx), %rdx
	je	.L165
	leaq	4(%rcx,%rdi,8), %rdi
	movl	$1, %esi
	movq	n_bits_pred_local@GOTPCREL(%rip), %rcx
	movl	%esi, %ebx
	movl	(%rcx), %ecx
	sall	%cl, %ebx
	movl	%ebx, %ecx
	movq	24(%rsp), %rbx
	subl	$1, %ecx
	movl	%ecx, 8(%rbx,%rdi,4)
	movq	n_bits_pred_global@GOTPCREL(%rip), %rcx
	movl	(%rcx), %ecx
	sall	%cl, %esi
	movl	%esi, %ecx
	movq	Global@GOTPCREL(%rip), %rsi
	subl	$1, %ecx
	movl	%ecx, (%rsi,%rdx,4)
.L166:
	movq	24(%rsp), %rdi
	leaq	(%rax,%rax,2), %rdx
	movq	n_bits_pred_hybrid@GOTPCREL(%rip), %rax
	salq	$5, %rdx
	movl	(%rax), %ecx
	movl	$1, %eax
	sall	%cl, %eax
	subl	$1, %eax
	movl	%eax, 88(%rdi,%rdx)
.L119:
	leaq	72(%rsp), %rsp
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
.L128:
	.cfi_restore_state
	movl	-80(%r10), %r8d
	cmpl	$1, %r8d
	je	.L142
	testl	%r8d, %r8d
	je	.L143
	cmpl	$2, %r8d
	je	.L144
	cmpl	$3, %r8d
	jne	.L170
	movl	44(%rsp), %eax
	movl	$1, %r8d
	movl	%eax, -80(%r10)
	jmp	.L124
	.p2align 4,,7
	.p2align 3
.L129:
	movl	-80(%r10), %r8d
	testl	%r15d, %r15d
	je	.L136
	cmpl	$1, %r8d
	je	.L137
	testl	%r8d, %r8d
	je	.L138
	cmpl	$2, %r8d
	je	.L189
	.p2align 4,,15
.L170:
	movl	$1, %r8d
	jmp	.L124
	.p2align 4,,7
	.p2align 3
.L126:
	testl	%r15d, %r15d
	je	.L139
.L189:
	movl	$3, -80(%r10)
	movl	$1, %r8d
	jmp	.L124
	.p2align 4,,7
	.p2align 3
.L130:
	movq	16(%rsp), %rdx
	leaq	(%r11,%r11,2), %rcx
	movq	24(%rsp), %rax
	movl	%r15d, %edi
	addq	RB@GOTPCREL(%rip), %rdx
	movslq	52(%rdx), %rdx
	leaq	6(%rdx,%rcx,8), %rdx
	leaq	(%rax,%rdx,4), %rsi
	movq	n_bits_pred_local@GOTPCREL(%rip), %rdx
	movl	(%rdx), %edx
	call	cambia_estado_histeresis
	movl	$1, %r8d
	jmp	.L124
	.p2align 4,,7
	.p2align 3
.L131:
	movq	16(%rsp), %rdx
	addq	RB@GOTPCREL(%rip), %rdx
	testl	%r15d, %r15d
	movslq	52(%rdx), %rdx
	je	.L145
	movq	24(%rsp), %rax
	leaq	(%r11,%r11,2), %rcx
	leaq	6(%rdx,%rcx,8), %rdx
	leaq	(%rax,%rdx,4), %rdi
	movq	n_bits_pred_local@GOTPCREL(%rip), %rdx
	movl	(%rdx), %esi
	call	cambia_estado_saturacion.part.0
	movl	$1, %r8d
	jmp	.L124
	.p2align 4,,7
	.p2align 3
.L132:
	movq	16(%rsp), %rdx
	addq	RB@GOTPCREL(%rip), %rdx
	movslq	48(%rdx), %rcx
	movq	Global@GOTPCREL(%rip), %rdx
	leaq	(%rdx,%rcx,4), %rsi
.L190:
	movq	n_bits_pred_global@GOTPCREL(%rip), %rdx
	movl	%r15d, %edi
	movl	(%rdx), %edx
	call	cambia_estado_histeresis
	movl	$1, %r8d
	jmp	.L124
	.p2align 4,,7
	.p2align 3
.L133:
	movq	16(%rsp), %rdx
	movq	Global@GOTPCREL(%rip), %rcx
	addq	RB@GOTPCREL(%rip), %rdx
	testl	%r15d, %r15d
	movslq	48(%rdx), %rdx
	je	.L147
	leaq	(%rcx,%rdx,4), %rdi
	movq	n_bits_pred_global@GOTPCREL(%rip), %rdx
	movl	(%rdx), %esi
	call	cambia_estado_saturacion.part.0
	jmp	.L124
	.p2align 4,,7
	.p2align 3
.L134:
	movq	RB@GOTPCREL(%rip), %r8
	movq	16(%rsp), %rax
	leaq	(%r8,%rax), %rdx
	movl	56(%rdx), %ecx
	movl	60(%rdx), %edx
	cmpl	%edx, %r15d
	jne	.L149
	cmpl	%ecx, %r15d
	jne	.L193
.L149:
	cmpl	%edx, %r15d
	je	.L150
	cmpl	%ecx, %r15d
	.p2align 4,,2
	jne	.L150
	movl	(%r10), %edx
	testl	%edx, %edx
	jle	.L150
	subl	$1, %edx
	movl	%edx, (%r10)
.L150:
	movq	16(%rsp), %rax
	movq	n_bits_pred_local@GOTPCREL(%rip), %rdx
	leaq	(%r8,%rax), %rcx
	movslq	52(%rcx), %r9
	movq	24(%rsp), %rax
	movl	(%rdx), %esi
	leaq	(%r11,%r11,2), %rdx
	movq	%rcx, 56(%rsp)
	leaq	6(%r9,%rdx,8), %rdx
	leaq	(%rax,%rdx,4), %rdi
	movq	subtipo_pred_local@GOTPCREL(%rip), %rax
	cmpb	$104, (%rax)
	je	.L194
	testl	%r15d, %r15d
	jne	.L195
	movq	24(%rsp), %rax
	movslq	%ebp, %rdx
	leaq	(%rdx,%rdx,2), %rdx
	leaq	4(%r9,%rdx,8), %rcx
	movl	8(%rax,%rcx,4), %edx
	testl	%edx, %edx
	jle	.L157
	subl	$1, %edx
	movl	%edx, 8(%rax,%rcx,4)
.L157:
	movq	subtipo_pred_global@GOTPCREL(%rip), %rcx
	movq	16(%rsp), %rax
	cmpb	$104, (%rcx)
	movslq	48(%r8,%rax), %rdx
	je	.L156
.L158:
	movq	Global@GOTPCREL(%rip), %rsi
	movl	(%rsi,%rdx,4), %ecx
	testl	%ecx, %ecx
	jle	.L170
	subl	$1, %ecx
	movl	$1, %r8d
	movl	%ecx, (%rsi,%rdx,4)
	jmp	.L124
	.p2align 4,,7
	.p2align 3
.L191:
	movq	fase_ejecucion@GOTPCREL(%rip), %rax
	movl	(%rax), %esi
	testl	%esi, %esi
	jne	.L120
	movq	f_trace@GOTPCREL(%rip), %rax
	movq	%r8, %r9
	movq	%r12, %rcx
	movl	%r15d, %r8d
	leaq	.LC5(%rip), %rsi
	movq	(%rax), %rdi
	xorl	%eax, %eax
	call	fprintf@PLT
	movq	tipo_predictor@GOTPCREL(%rip), %rax
	movl	(%rax), %ecx
	jmp	.L120
	.p2align 4,,7
	.p2align 3
.L136:
	cmpl	$2, %r8d
	jne	.L196
	.p2align 4,,15
.L139:
	movl	$0, -80(%r10)
	movl	$1, %r8d
	jmp	.L124
	.p2align 4,,7
	.p2align 3
.L196:
	cmpl	$3, %r8d
	je	.L140
	cmpl	$1, %r8d
	jne	.L170
	movl	$0, -80(%r10)
	jmp	.L124
	.p2align 4,,7
	.p2align 3
.L145:
	movq	24(%rsp), %rax
	movslq	%r11d, %rcx
	leaq	(%rcx,%rcx,2), %rcx
	leaq	4(%rdx,%rcx,8), %rcx
	movl	8(%rax,%rcx,4), %edx
	testl	%edx, %edx
	jle	.L170
	movq	24(%rsp), %rax
	subl	$1, %edx
	movl	$1, %r8d
	movl	%edx, 8(%rax,%rcx,4)
	jmp	.L124
	.p2align 4,,7
	.p2align 3
.L147:
	movl	(%rcx,%rdx,4), %esi
	testl	%esi, %esi
	jle	.L170
	subl	$1, %esi
	movl	%esi, (%rcx,%rdx,4)
	jmp	.L124
	.p2align 4,,7
	.p2align 3
.L195:
	call	cambia_estado_saturacion.part.0
	movq	subtipo_pred_global@GOTPCREL(%rip), %rdx
	movq	56(%rsp), %rcx
	cmpb	$104, (%rdx)
	je	.L152
	movq	n_bits_pred_global@GOTPCREL(%rip), %rdx
	movslq	48(%rcx), %rcx
	movl	(%rdx), %esi
	movq	Global@GOTPCREL(%rip), %rdx
	leaq	(%rdx,%rcx,4), %rdi
.L167:
	call	cambia_estado_saturacion.part.0
	movl	$1, %r8d
	jmp	.L124
	.p2align 4,,7
	.p2align 3
.L193:
	movq	n_bits_pred_hybrid@GOTPCREL(%rip), %rdx
	movq	%r10, %rdi
	movl	(%rdx), %esi
	call	cambia_estado_saturacion.part.0
	jmp	.L150
.L152:
	movslq	48(%rcx), %rdx
.L156:
	movq	Global@GOTPCREL(%rip), %rcx
	leaq	(%rcx,%rdx,4), %rsi
	jmp	.L190
.L194:
	movl	%esi, %edx
	movq	%rdi, %rsi
	movl	%r15d, %edi
	call	cambia_estado_histeresis
	movq	subtipo_pred_global@GOTPCREL(%rip), %rdx
	movq	56(%rsp), %rcx
	cmpb	$104, (%rdx)
	je	.L152
	movslq	48(%rcx), %rdx
	testl	%r15d, %r15d
	je	.L158
	movq	n_bits_pred_global@GOTPCREL(%rip), %rcx
	movl	(%rcx), %esi
	movq	Global@GOTPCREL(%rip), %rcx
	leaq	(%rcx,%rdx,4), %rdi
	jmp	.L167
.L142:
	movl	52(%rsp), %eax
	movl	%eax, -80(%r10)
	jmp	.L124
	.p2align 4,,7
	.p2align 3
.L144:
	movl	48(%rsp), %eax
	movl	$1, %r8d
	movl	%eax, -80(%r10)
	jmp	.L124
	.p2align 4,,7
	.p2align 3
.L143:
	xorl	%edx, %edx
	testl	%r15d, %r15d
	setne	%dl
	movl	$1, %r8d
	movl	%edx, -80(%r10)
	jmp	.L124
.L162:
	cmpl	$1, %r15d
	sbbl	%eax, %eax
	notl	%eax
	andl	$3, %eax
	movl	%eax, 8(%rdx)
	jmp	.L119
.L138:
	movl	$1, -80(%r10)
	movl	$1, %r8d
	jmp	.L124
.L140:
	movl	$2, -80(%r10)
	movl	$1, %r8d
	jmp	.L124
.L137:
	movl	$3, -80(%r10)
	jmp	.L124
.L125:
	movq	stderr@GOTPCREL(%rip), %rax
	movl	$694, %ecx
	leaq	.LC1(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	(%rax), %rdi
	xorl	%eax, %eax
	call	fprintf@PLT
	movl	$1, %edi
	call	exit@PLT
	.p2align 4,,7
	.p2align 3
.L168:
	movq	BTB@GOTPCREL(%rip), %rdi
	movq	$-1, %rax
	movq	%rdi, 24(%rsp)
	jmp	.L123
.L165:
	leaq	4(%rcx,%rdi,8), %rcx
	movq	24(%rsp), %rdi
	movl	$0, 8(%rdi,%rcx,4)
	movq	Global@GOTPCREL(%rip), %rcx
	movl	$0, (%rcx,%rdx,4)
	jmp	.L166
	.cfi_endproc
.LFE30:
	.size	actualizar_prediccion, .-actualizar_prediccion
	.section	.rodata
	.align 16
	.type	__func__.3935, @object
	.size	__func__.3935, 19
__func__.3935:
	.string	"obtener_prediccion"
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
