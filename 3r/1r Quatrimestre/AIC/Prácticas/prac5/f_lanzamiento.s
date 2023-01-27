	.file	"f_lanzamiento.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"X"
.LC1:
	.string	"i"
.LC2:
	.string	"I"
.LC3:
	.string	"f_lanzamiento.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC4:
	.string	"ERROR (%s:%d): Operacion %d no implementada\n"
	.text
	.p2align 4,,15
	.globl	fase_ISS
	.type	fase_ISS, @function
fase_ISS:
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
	leaq	-40(%rsp), %rsp
	.cfi_def_cfa_offset 96
	movq	IF_ISS_2@GOTPCREL(%rip), %rbx
	movl	(%rbx), %eax
	leal	-141(%rax), %edx
	cmpl	$5, %edx
	jbe	.L171
	movq	PC_ISS@GOTPCREL(%rip), %rdx
	movq	160(%rbx), %rcx
	movq	%rcx, (%rdx)
	movq	Control_2@GOTPCREL(%rip), %rdx
	movl	12(%rdx), %edx
	orl	208(%rbx), %edx
	jne	.L172
	movq	Control_1@GOTPCREL(%rip), %rbp
	movl	12(%rbp), %edx
	orl	204(%rbx), %edx
	jne	.L173
	movl	8(%rbp), %edx
	orl	16(%rbp), %edx
	jne	.L174
	testl	%eax, %eax
	je	.L7
	movq	presentacion@GOTPCREL(%rip), %rdx
	cmpl	$1, %eax
	movl	168(%rbx), %esi
	movq	64(%rdx), %rcx
	je	.L175
	xorl	%edx, %edx
	leaq	.LC2(%rip), %rdi
	call	*%rcx
.L7:
	movq	RB_long@GOTPCREL(%rip), %r9
	movq	TAM_REORDER@GOTPCREL(%rip), %rax
	movl	$1, 8(%rbp)
	movl	(%r9), %r13d
	movl	(%rax), %ecx
	cmpl	%ecx, %r13d
	jge	.L1
	movq	RB_fin@GOTPCREL(%rip), %r11
	movq	RB@GOTPCREL(%rip), %r10
	movl	172(%rbx), %esi
	movslq	(%r11), %r14
	movl	200(%rbx), %edx
	movdqu	176(%rbx), %xmm0
	leaq	(%r14,%r14,2), %rax
	movq	%r14, %r12
	salq	$5, %rax
	addq	%r10, %rax
	movl	%esi, 44(%rax)
	movq	192(%rbx), %rsi
	movl	%edx, 72(%rax)
	movdqu	%xmm0, 48(%rax)
	movq	%rsi, 64(%rax)
	movl	(%rbx), %eax
	cmpl	$183, %eax
	ja	.L10
	leaq	.L12(%rip), %r8
	movl	%eax, %edi
	movslq	(%r8,%rdi,4), %rsi
	addq	%r8, %rsi
	jmp	*%rsi
	.section	.rodata
	.align 4
	.align 4
.L12:
	.long	.L25-.L12
	.long	.L24-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L14-.L12
	.long	.L14-.L12
	.long	.L14-.L12
	.long	.L14-.L12
	.long	.L14-.L12
	.long	.L14-.L12
	.long	.L23-.L12
	.long	.L23-.L12
	.long	.L23-.L12
	.long	.L10-.L12
	.long	.L19-.L12
	.long	.L22-.L12
	.long	.L19-.L12
	.long	.L22-.L12
	.long	.L19-.L12
	.long	.L22-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L19-.L12
	.long	.L22-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L19-.L12
	.long	.L22-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L19-.L12
	.long	.L22-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L19-.L12
	.long	.L22-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L19-.L12
	.long	.L22-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L19-.L12
	.long	.L22-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L14-.L12
	.long	.L23-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L19-.L12
	.long	.L22-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L19-.L12
	.long	.L22-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L19-.L12
	.long	.L10-.L12
	.long	.L19-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L22-.L12
	.long	.L19-.L12
	.long	.L22-.L12
	.long	.L19-.L12
	.long	.L22-.L12
	.long	.L19-.L12
	.long	.L22-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L20-.L12
	.long	.L20-.L12
	.long	.L21-.L12
	.long	.L21-.L12
	.long	.L20-.L12
	.long	.L20-.L12
	.long	.L19-.L12
	.long	.L19-.L12
	.long	.L18-.L12
	.long	.L17-.L12
	.long	.L18-.L12
	.long	.L17-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L14-.L12
	.long	.L13-.L12
	.long	.L16-.L12
	.long	.L16-.L12
	.long	.L15-.L12
	.long	.L15-.L12
	.long	.L10-.L12
	.long	.L16-.L12
	.long	.L16-.L12
	.long	.L16-.L12
	.long	.L16-.L12
	.long	.L16-.L12
	.long	.L16-.L12
	.long	.L14-.L12
	.long	.L13-.L12
	.long	.L16-.L12
	.long	.L16-.L12
	.long	.L15-.L12
	.long	.L15-.L12
	.long	.L10-.L12
	.long	.L16-.L12
	.long	.L16-.L12
	.long	.L16-.L12
	.long	.L16-.L12
	.long	.L16-.L12
	.long	.L16-.L12
	.long	.L16-.L12
	.long	.L16-.L12
	.long	.L15-.L12
	.long	.L15-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L10-.L12
	.long	.L14-.L12
	.long	.L13-.L12
	.long	.L11-.L12
	.long	.L11-.L12
	.text
	.p2align 4,,7
	.p2align 3
.L172:
	movq	Control_1@GOTPCREL(%rip), %rax
	movl	$0, 8(%rax)
.L1:
	leaq	40(%rsp), %rsp
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
.L171:
	.cfi_restore_state
	leaq	40(%rsp), %rsp
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
	jmp	fase_ISS_alum@PLT
	.p2align 4,,7
	.p2align 3
.L173:
	.cfi_restore_state
	movq	presentacion@GOTPCREL(%rip), %rax
	xorl	%edx, %edx
	movl	168(%rbx), %esi
	leaq	.LC0(%rip), %rdi
	movq	64(%rax), %rax
	leaq	40(%rsp), %rsp
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
	jmp	*%rax
	.p2align 4,,7
	.p2align 3
.L174:
	.cfi_restore_state
	movl	168(%rbx), %esi
	xorl	%edx, %edx
	movq	presentacion@GOTPCREL(%rip), %rax
	leaq	.LC1(%rip), %rdi
	call	*64(%rax)
	movl	$1, 8(%rbp)
	jmp	.L1
.L18:
	movl	168(%rbx), %esi
	leaq	(%r14,%r14,2), %rdx
	movq	160(%rbx), %rdi
	salq	$5, %rdx
	addq	%r10, %rdx
	movl	%esi, 92(%rdx)
	movswq	20(%rbx), %rsi
	movq	%rdi, 80(%rdx)
	addq	$4, %rdi
	movl	$1, (%rdx)
	movl	%eax, 4(%rdx)
	addq	%rdi, %rsi
	movq	%rsi, 32(%rdx)
	leal	-110(%rax), %esi
	movl	$1, 40(%rdx)
	cmpl	$1, %esi
	jbe	.L176
	movl	$1, 8(%rdx)
.L17:
	movq	TAM_RS_ENTEROS@GOTPCREL(%rip), %rdx
	movl	(%rdx), %r8d
	testl	%r8d, %r8d
	jle	.L1
	movq	RS@GOTPCREL(%rip), %rdx
	movl	(%rdx), %esi
	testl	%esi, %esi
	je	.L136
	leaq	168(%rdx), %rdi
	xorl	%esi, %esi
	.p2align 4,,15
.L40:
	addl	$1, %esi
	cmpl	%r8d, %esi
	je	.L1
	movl	(%rdi), %r15d
	addq	$168, %rdi
	testl	%r15d, %r15d
	jne	.L40
.L39:
	movl	168(%rbx), %r8d
	movslq	%esi, %rsi
	movq	160(%rbx), %r15
	leaq	(%rsi,%rsi,4), %rdi
	leaq	(%rsi,%rdi,4), %rdi
	leaq	(%rdx,%rdi,8), %rdi
	movl	%eax, 4(%rdi)
	movl	$1, (%rdi)
	movl	$0, 124(%rdi)
	movl	%r8d, 160(%rdi)
	movl	%r12d, 148(%rdi)
	leaq	(%r14,%r14,2), %rdi
	salq	$5, %rdi
	addq	%r10, %rdi
	movl	%eax, 4(%rdi)
	subl	$110, %eax
	movl	$1, (%rdi)
	cmpl	$1, %eax
	movl	%r8d, 92(%rdi)
	movq	%r15, 80(%rdi)
	movl	$0, 44(%rdi)
	jbe	.L122
	movq	Rint@GOTPCREL(%rip), %r8
.L123:
	leaq	(%r14,%r14,2), %rax
	salq	$5, %rax
	movl	$0, 8(%r10,%rax)
	movslq	8(%rbx), %rax
	salq	$4, %rax
	addq	%rax, %r8
	movl	8(%r8), %edi
	cmpl	$4096, %edi
	je	.L177
	movslq	%edi, %rax
	leaq	(%rax,%rax,2), %rax
	salq	$5, %rax
	addq	%rax, %r10
	leaq	(%rsi,%rsi,4), %rax
	movl	8(%r10), %r8d
	leaq	(%rsi,%rax,4), %rax
	testl	%r8d, %r8d
	je	.L44
	movq	24(%r10), %rdi
	leaq	(%rdx,%rax,8), %rax
	movl	$4096, 8(%rax)
	movq	%rdi, 16(%rax)
.L43:
	leaq	(%rsi,%rsi,4), %rax
	leaq	(%rsi,%rax,4), %rax
	leaq	(%rdx,%rax,8), %rax
	movq	192(%rbx), %rdx
	movl	$4096, 24(%rax)
	movq	%rdx, 32(%rax)
	movswq	20(%rbx), %rdx
	movq	%rdx, 48(%rax)
	jmp	.L37
.L11:
	movq	TAM_RS_ENTEROS@GOTPCREL(%rip), %rdx
	movl	(%rdx), %edi
	movq	TAM_RS_SUMREST@GOTPCREL(%rip), %rdx
	movl	(%rdx), %r8d
	addl	%edi, %r8d
	cmpl	%r8d, %edi
	jge	.L1
	movq	RS@GOTPCREL(%rip), %rdx
	movslq	%edi, %rsi
	leaq	(%rsi,%rsi,4), %r15
	leaq	(%rsi,%r15,4), %r15
	movl	(%rdx,%r15,8), %r15d
	testl	%r15d, %r15d
	je	.L86
	addq	$1, %rsi
	leaq	(%rsi,%rsi,4), %r15
	leaq	(%rsi,%r15,4), %rsi
	leaq	(%rdx,%rsi,8), %rsi
	.p2align 4,,15
.L87:
	addl	$1, %edi
	cmpl	%r8d, %edi
	je	.L1
	movl	(%rsi), %r15d
	addq	$168, %rsi
	testl	%r15d, %r15d
	jne	.L87
	movslq	%edi, %rsi
.L86:
	movslq	8(%rbx), %r8
	leaq	(%rsi,%rsi,4), %rdi
	leaq	(%rsi,%rdi,4), %rdi
	leaq	(%rdx,%rdi,8), %rdi
	movl	$1, (%rdi)
	movl	%eax, 4(%rdi)
	movl	%r12d, 148(%rdi)
	movq	Rfp@GOTPCREL(%rip), %rdi
	salq	$4, %r8
	leaq	(%rdi,%r8), %r15
	movl	8(%r15), %r8d
	cmpl	$4096, %r8d
	je	.L178
	movslq	%r8d, %r15
	movq	%r15, 8(%rsp)
	leaq	(%r15,%r15,2), %r15
	salq	$5, %r15
	movl	8(%r10,%r15), %r15d
	testl	%r15d, %r15d
	je	.L90
	imulq	$96, 8(%rsp), %r15
	imulq	$168, %rsi, %r8
	movq	24(%r10,%r15), %r15
	addq	%rdx, %r8
	movq	%r15, 16(%r8)
	movl	$4096, 8(%r8)
.L89:
	leaq	(%rsi,%rsi,4), %r8
	leaq	(%rsi,%r8,4), %rsi
	leaq	(%rdx,%rsi,8), %rsi
	movslq	12(%rbx), %rdx
	movl	$4096, 24(%rsi)
	movl	$0, 124(%rsi)
	salq	$4, %rdx
	movq	(%rdi,%rdx), %rdx
	movq	%rdx, 32(%rsi)
	leaq	(%r14,%r14,2), %rdx
	salq	$5, %rdx
	addq	%rdx, %r10
	movl	%eax, 4(%r10)
	movslq	16(%rbx), %rax
	movl	$1, (%r10)
	movl	$0, 8(%r10)
	movq	%rax, 16(%r10)
	salq	$4, %rax
	movl	%r12d, 8(%rdi,%rax)
	movl	168(%rbx), %eax
	movl	%eax, 160(%rsi)
	movl	%eax, 92(%r10)
	movq	160(%rbx), %rax
	movq	%rax, 80(%r10)
	jmp	.L37
.L15:
	movq	TAM_RS_SUMREST@GOTPCREL(%rip), %rdx
	movl	(%rdx), %edi
	movq	TAM_RS_ENTEROS@GOTPCREL(%rip), %rdx
	addl	(%rdx), %edi
	movq	TAM_RS_MULTDIV@GOTPCREL(%rip), %rdx
	movl	(%rdx), %r8d
	addl	%edi, %r8d
	cmpl	%r8d, %edi
	jge	.L1
	movq	RS@GOTPCREL(%rip), %rdx
	movslq	%edi, %rsi
	leaq	(%rsi,%rsi,4), %r15
	leaq	(%rsi,%r15,4), %r15
	movl	(%rdx,%r15,8), %r15d
	testl	%r15d, %r15d
	je	.L102
	addq	$1, %rsi
	leaq	(%rsi,%rsi,4), %r15
	leaq	(%rsi,%r15,4), %rsi
	leaq	(%rdx,%rsi,8), %rsi
	.p2align 4,,15
.L103:
	addl	$1, %edi
	cmpl	%r8d, %edi
	je	.L1
	movl	(%rsi), %r15d
	addq	$168, %rsi
	testl	%r15d, %r15d
	jne	.L103
	movslq	%edi, %rsi
.L102:
	movslq	8(%rbx), %r15
	leaq	(%rsi,%rsi,4), %rdi
	leaq	(%rsi,%rdi,4), %rdi
	leaq	(%rdx,%rdi,8), %rdi
	movl	$1, (%rdi)
	movl	%eax, 4(%rdi)
	movl	%r12d, 148(%rdi)
	movq	Rfp@GOTPCREL(%rip), %rdi
	salq	$4, %r15
	addq	%rdi, %r15
	movl	8(%r15), %r8d
	cmpl	$4096, %r8d
	je	.L179
	movslq	%r8d, %r15
	movq	%r15, 8(%rsp)
	leaq	(%r15,%r15,2), %r15
	salq	$5, %r15
	movl	8(%r10,%r15), %r15d
	testl	%r15d, %r15d
	je	.L106
	imulq	$96, 8(%rsp), %r15
	imulq	$168, %rsi, %r8
	movq	24(%r10,%r15), %r15
	addq	%rdx, %r8
	movq	%r15, 16(%r8)
	movl	$4096, 8(%r8)
.L105:
	movslq	12(%rbx), %r15
	salq	$4, %r15
	addq	%rdi, %r15
	movl	8(%r15), %r8d
	cmpl	$4096, %r8d
	je	.L180
	movslq	%r8d, %r15
	movq	%r15, 8(%rsp)
	leaq	(%r15,%r15,2), %r15
	salq	$5, %r15
	movl	8(%r10,%r15), %r15d
	testl	%r15d, %r15d
	je	.L109
	imulq	$96, 8(%rsp), %r15
	imulq	$168, %rsi, %r8
	movq	24(%r10,%r15), %r15
	addq	%rdx, %r8
	movq	%r15, 32(%r8)
	movl	$4096, 24(%r8)
.L108:
	leaq	(%r14,%r14,2), %r8
	salq	$5, %r8
	addq	%r8, %r10
	movl	%eax, 4(%r10)
	movslq	16(%rbx), %rax
	movl	$1, (%r10)
	movl	$0, 8(%r10)
	movq	%rax, 16(%r10)
	salq	$4, %rax
	movl	%r12d, 8(%rdi,%rax)
	leaq	(%rsi,%rsi,4), %rax
	leaq	(%rsi,%rax,4), %rax
	leaq	(%rdx,%rax,8), %rdx
	movl	168(%rbx), %eax
	movl	$0, 124(%rdx)
	movl	%eax, 160(%rdx)
	movl	%eax, 92(%r10)
	movq	160(%rbx), %rax
	movq	%rax, 80(%r10)
	jmp	.L37
.L16:
	movq	TAM_RS_ENTEROS@GOTPCREL(%rip), %rdx
	movl	(%rdx), %edi
	movq	TAM_RS_SUMREST@GOTPCREL(%rip), %rdx
	movl	(%rdx), %esi
	addl	%edi, %esi
	cmpl	%esi, %edi
	jge	.L1
	movq	RS@GOTPCREL(%rip), %rdx
	movslq	%edi, %rcx
	leaq	(%rcx,%rcx,4), %r8
	leaq	(%rcx,%r8,4), %r8
	movl	(%rdx,%r8,8), %r13d
	testl	%r13d, %r13d
	je	.L91
	addq	$1, %rcx
	leaq	(%rcx,%rcx,4), %r8
	leaq	(%rcx,%r8,4), %rcx
	leaq	(%rdx,%rcx,8), %rcx
	.p2align 4,,15
.L92:
	addl	$1, %edi
	cmpl	%esi, %edi
	je	.L1
	movl	(%rcx), %r8d
	addq	$168, %rcx
	testl	%r8d, %r8d
	jne	.L92
	movslq	%edi, %rcx
.L91:
	movq	Rfp@GOTPCREL(%rip), %rdi
	leaq	(%rcx,%rcx,4), %rsi
	leaq	(%rcx,%rsi,4), %rsi
	leaq	(%rdx,%rsi,8), %rsi
	movl	$1, (%rsi)
	movl	%eax, 4(%rsi)
	movl	%r12d, 148(%rsi)
	movslq	8(%rbx), %rsi
	salq	$4, %rsi
	addq	%rdi, %rsi
	movl	8(%rsi), %r8d
	cmpl	$4096, %r8d
	je	.L181
	movslq	%r8d, %rsi
	leaq	(%rsi,%rsi,2), %r13
	salq	$5, %r13
	movl	8(%r10,%r13), %r15d
	testl	%r15d, %r15d
	je	.L95
	imulq	$96, %rsi, %rsi
	imulq	$168, %rcx, %r8
	movq	24(%r10,%rsi), %rsi
	addq	%rdx, %r8
	movq	%rsi, 16(%r8)
	movl	$4096, 8(%r8)
.L94:
	movslq	12(%rbx), %rsi
	salq	$4, %rsi
	addq	%rdi, %rsi
	movl	8(%rsi), %r8d
	cmpl	$4096, %r8d
	je	.L182
	movslq	%r8d, %rsi
	leaq	(%rsi,%rsi,2), %r13
	salq	$5, %r13
	movl	8(%r10,%r13), %r13d
	testl	%r13d, %r13d
	je	.L98
	imulq	$96, %rsi, %rsi
	imulq	$168, %rcx, %r8
	movq	24(%r10,%rsi), %rsi
	addq	%rdx, %r8
	movq	%rsi, 32(%r8)
	movl	$4096, 24(%r8)
.L97:
	movslq	16(%rbx), %r8
	leaq	(%r14,%r14,2), %rsi
	salq	$5, %rsi
	addq	%r10, %rsi
	movl	$1, (%rsi)
	movl	%eax, 4(%rsi)
	movq	%r8, 16(%rsi)
	movl	$0, 8(%rsi)
	leal	-135(%rax), %esi
	cmpl	$5, %esi
	jbe	.L138
	subl	$148, %eax
	cmpl	$5, %eax
	jbe	.L138
	salq	$4, %r8
	movl	%r12d, 8(%rdi,%r8)
.L101:
	movl	(%r11), %r12d
	leaq	(%rcx,%rcx,4), %rax
	movl	(%r9), %r13d
	leaq	(%rcx,%rax,4), %rax
	leaq	(%rdx,%rax,8), %rax
	movl	168(%rbx), %edx
	movl	$0, 124(%rax)
	movl	%edx, 160(%rax)
	leaq	(%r14,%r14,2), %rax
	salq	$5, %rax
	addq	%rax, %r10
	movq	160(%rbx), %rax
	movl	%edx, 92(%r10)
	movq	%rax, 80(%r10)
	movq	TAM_REORDER@GOTPCREL(%rip), %rax
	movl	(%rax), %ecx
	jmp	.L37
.L20:
	movq	TAM_RS_ENTEROS@GOTPCREL(%rip), %rdx
	movl	(%rdx), %r8d
	testl	%r8d, %r8d
	jle	.L1
	movq	RS@GOTPCREL(%rip), %rdx
	movl	(%rdx), %esi
	testl	%esi, %esi
	je	.L133
	leaq	168(%rdx), %rdi
	xorl	%esi, %esi
	.p2align 4,,15
.L30:
	addl	$1, %esi
	cmpl	%r8d, %esi
	je	.L1
	movl	(%rdi), %r15d
	addq	$168, %rdi
	testl	%r15d, %r15d
	jne	.L30
.L29:
	movl	168(%rbx), %r8d
	movslq	%esi, %rsi
	leaq	(%rsi,%rsi,4), %rdi
	leaq	(%rsi,%rdi,4), %rdi
	leaq	(%rdx,%rdi,8), %rdi
	movl	%eax, 4(%rdi)
	movl	$1, (%rdi)
	movl	%r8d, 160(%rdi)
	movl	$0, 124(%rdi)
	movl	%r12d, 148(%rdi)
	leaq	(%r14,%r14,2), %rdi
	salq	$5, %rdi
	addq	%r10, %rdi
	movl	%eax, 4(%rdi)
	movl	%r8d, 92(%rdi)
	movq	160(%rbx), %rax
	movswq	20(%rbx), %r8
	movl	$1, (%rdi)
	movq	%rax, 80(%rdi)
	movl	$0, 8(%rdi)
	leaq	4(%rax,%r8), %rax
	movq	%rax, 32(%rdi)
	movslq	8(%rbx), %rax
	salq	$4, %rax
	addq	Rint@GOTPCREL(%rip), %rax
	movl	8(%rax), %edi
	cmpl	$4096, %edi
	je	.L183
	movslq	%edi, %rax
	leaq	(%rax,%rax,2), %rbx
	salq	$5, %rbx
	movl	8(%r10,%rbx), %ebx
	testl	%ebx, %ebx
	je	.L47
	imulq	$96, %rax, %rax
	imulq	$168, %rsi, %rdi
	movq	24(%r10,%rax), %rax
	addq	%rdx, %rdi
	movq	%rax, 16(%rdi)
	movl	$4096, 8(%rdi)
.L46:
	leaq	(%rsi,%rsi,4), %rax
	leaq	(%rsi,%rax,4), %rax
	leaq	(%rdx,%rax,8), %rax
	movq	$0, 32(%rax)
	movl	$4096, 24(%rax)
	movq	%r8, 48(%rax)
	jmp	.L37
.L22:
	movq	TAM_RS_ENTEROS@GOTPCREL(%rip), %rdx
	movl	(%rdx), %r8d
	testl	%r8d, %r8d
	jle	.L1
	movq	RS@GOTPCREL(%rip), %rdx
	movl	(%rdx), %r15d
	testl	%r15d, %r15d
	je	.L134
	leaq	168(%rdx), %rdi
	xorl	%esi, %esi
	.p2align 4,,15
.L32:
	addl	$1, %esi
	cmpl	%r8d, %esi
	je	.L1
	movl	(%rdi), %r15d
	addq	$168, %rdi
	testl	%r15d, %r15d
	jne	.L32
.L31:
	movl	168(%rbx), %r8d
	movslq	%esi, %rsi
	leaq	(%rsi,%rsi,4), %rdi
	leaq	(%rsi,%rdi,4), %rdi
	leaq	(%rdx,%rdi,8), %rdi
	movl	%eax, 4(%rdi)
	movl	$1, (%rdi)
	movl	%r8d, 160(%rdi)
	movl	$0, 124(%rdi)
	movl	%r12d, 148(%rdi)
	leaq	(%r14,%r14,2), %rdi
	movslq	16(%rbx), %r14
	salq	$5, %rdi
	addq	%r10, %rdi
	movl	%eax, 4(%rdi)
	movq	160(%rbx), %rax
	movl	%r8d, 92(%rdi)
	movq	Rint@GOTPCREL(%rip), %r8
	movq	%rax, 80(%rdi)
	movslq	8(%rbx), %rax
	movl	$1, (%rdi)
	movq	%r14, 16(%rdi)
	salq	$4, %rax
	movl	$0, 8(%rdi)
	addq	%r8, %rax
	movl	8(%rax), %edi
	cmpl	$4096, %edi
	je	.L184
	movslq	%edi, %rax
	leaq	(%rax,%rax,2), %r15
	salq	$5, %r15
	movl	8(%r10,%r15), %r15d
	testl	%r15d, %r15d
	je	.L85
	imulq	$96, %rax, %rax
	imulq	$168, %rsi, %rdi
	movq	24(%r10,%rax), %rax
	addq	%rdx, %rdi
	movq	%rax, 16(%rdi)
	movl	$4096, 8(%rdi)
.L84:
	salq	$4, %r14
	leaq	(%rsi,%rsi,4), %rax
	movl	%r12d, 8(%r8,%r14)
	leaq	(%rsi,%rax,4), %rax
	leaq	(%rdx,%rax,8), %rax
	movswq	20(%rbx), %rdx
	movl	$4096, 24(%rax)
	movq	%rdx, 32(%rax)
	jmp	.L37
.L21:
	movq	TAM_RS_ENTEROS@GOTPCREL(%rip), %rdx
	movl	(%rdx), %r8d
	testl	%r8d, %r8d
	jle	.L1
	movq	RS@GOTPCREL(%rip), %rdx
	movl	(%rdx), %edi
	testl	%edi, %edi
	je	.L132
	leaq	168(%rdx), %rdi
	xorl	%esi, %esi
	.p2align 4,,15
.L28:
	addl	$1, %esi
	cmpl	%r8d, %esi
	je	.L1
	movl	(%rdi), %r15d
	addq	$168, %rdi
	testl	%r15d, %r15d
	jne	.L28
.L27:
	movl	168(%rbx), %r8d
	movslq	%esi, %rsi
	leaq	(%rsi,%rsi,4), %rdi
	leaq	(%rsi,%rdi,4), %rdi
	leaq	(%rdx,%rdi,8), %rdi
	movl	%eax, 4(%rdi)
	movl	$1, (%rdi)
	movl	%r8d, 160(%rdi)
	movl	$0, 124(%rdi)
	movl	%r12d, 148(%rdi)
	leaq	(%r14,%r14,2), %rdi
	movswq	20(%rbx), %r14
	salq	$5, %rdi
	addq	%r10, %rdi
	movl	%eax, 4(%rdi)
	movq	160(%rbx), %rax
	movl	%r8d, 92(%rdi)
	movq	Rint@GOTPCREL(%rip), %r8
	movq	%rax, 80(%rdi)
	leaq	4(%rax,%r14), %rax
	movq	%rax, 32(%rdi)
	movslq	8(%rbx), %rax
	movl	$1, (%rdi)
	movl	$0, 8(%rdi)
	salq	$4, %rax
	addq	%r8, %rax
	movl	8(%rax), %edi
	cmpl	$4096, %edi
	je	.L185
	movslq	%edi, %rax
	leaq	(%rax,%rax,2), %r15
	salq	$5, %r15
	movl	8(%r10,%r15), %r15d
	testl	%r15d, %r15d
	je	.L50
	imulq	$96, %rax, %rax
	imulq	$168, %rsi, %rdi
	movq	24(%r10,%rax), %rax
	addq	%rdx, %rdi
	movq	%rax, 16(%rdi)
	movl	$4096, 8(%rdi)
.L49:
	movslq	12(%rbx), %rax
	salq	$4, %rax
	addq	%rax, %r8
	movl	8(%r8), %eax
	cmpl	$4096, %eax
	je	.L186
	movslq	%eax, %r8
	leaq	(%r8,%r8,2), %rdi
	salq	$5, %rdi
	movl	8(%r10,%rdi), %ebx
	testl	%ebx, %ebx
	je	.L53
	imulq	$96, %r8, %rax
	imulq	$168, %rsi, %rdi
	movq	24(%r10,%rax), %rax
	addq	%rdx, %rdi
	movq	%rax, 32(%rdi)
	movl	$4096, 24(%rdi)
.L52:
	leaq	(%rsi,%rsi,4), %rax
	leaq	(%rsi,%rax,4), %rax
	movq	%r14, 48(%rdx,%rax,8)
	jmp	.L37
.L14:
	movq	TAM_RS_SUMREST@GOTPCREL(%rip), %rdx
	movl	(%rdx), %edi
	movq	TAM_RS_ENTEROS@GOTPCREL(%rip), %rdx
	addl	(%rdx), %edi
	movq	TAM_RS_MULTDIV@GOTPCREL(%rip), %rdx
	addl	(%rdx), %edi
	movq	TAM_BUFFER_CARGA@GOTPCREL(%rip), %rdx
	movl	(%rdx), %r8d
	addl	%edi, %r8d
	cmpl	%r8d, %edi
	jge	.L1
	movq	RS@GOTPCREL(%rip), %rdx
	movslq	%edi, %rsi
	leaq	(%rsi,%rsi,4), %r15
	leaq	(%rsi,%r15,4), %r15
	movl	(%rdx,%r15,8), %r11d
	testl	%r11d, %r11d
	je	.L54
	addq	$1, %rsi
	leaq	(%rsi,%rsi,4), %r15
	leaq	(%rsi,%r15,4), %rsi
	leaq	(%rdx,%rsi,8), %rsi
	.p2align 4,,15
.L55:
	addl	$1, %edi
	cmpl	%r8d, %edi
	je	.L1
	movl	(%rsi), %r9d
	addq	$168, %rsi
	testl	%r9d, %r9d
	jne	.L55
	movslq	%edi, %rsi
.L54:
	movslq	8(%rbx), %r15
	leaq	(%rsi,%rsi,4), %rdi
	movq	Rint@GOTPCREL(%rip), %r8
	leaq	(%rsi,%rdi,4), %rdi
	leaq	(%rdx,%rdi,8), %rdi
	salq	$4, %r15
	movl	$1, (%rdi)
	addq	%r8, %r15
	movl	%eax, 4(%rdi)
	movl	%r12d, 148(%rdi)
	movl	8(%r15), %edi
	cmpl	$4096, %edi
	je	.L187
	movslq	%edi, %r15
	movq	%r15, %r11
	leaq	(%r15,%r15,2), %r15
	salq	$5, %r15
	movl	8(%r10,%r15), %r15d
	testl	%r15d, %r15d
	je	.L58
	imulq	$96, %r11, %r15
	imulq	$168, %rsi, %rdi
	movq	24(%r10,%r15), %r15
	addq	%rdx, %rdi
	movq	%r15, 16(%rdi)
	movl	$4096, 8(%rdi)
.L57:
	movswq	20(%rbx), %r15
	leaq	(%rsi,%rsi,4), %rdi
	leaq	(%rsi,%rdi,4), %rdi
	leaq	(%rdx,%rdi,8), %rdi
	movq	%r15, 48(%rdi)
	movl	$4096, 24(%rdi)
	leaq	(%r14,%r14,2), %rdi
	movslq	16(%rbx), %r15
	salq	$5, %rdi
	addq	%r10, %rdi
	cmpl	$127, %eax
	movl	$1, (%rdi)
	movl	%eax, 4(%rdi)
	movq	%r15, 16(%rdi)
	movl	$0, 8(%rdi)
	jg	.L59
	salq	$4, %r15
	movl	%r12d, 8(%r8,%r15)
.L60:
	movl	168(%rbx), %r15d
	leaq	(%rsi,%rsi,4), %rax
	movl	%ecx, 8(%rsp)
	leaq	(%rsi,%rax,4), %rax
	salq	$3, %rax
	leaq	(%rdx,%rax), %rsi
	leaq	56(%rdx,%rax), %rdi
	movl	$0, 124(%rsi)
	movl	%r15d, 160(%rsi)
	leaq	32(%rbx), %rsi
	call	strcpy@PLT
	movq	RB@GOTPCREL(%rip), %r10
	leaq	(%r14,%r14,2), %rax
	movl	8(%rsp), %ecx
	salq	$5, %rax
	movq	RB_long@GOTPCREL(%rip), %r9
	addq	%rax, %r10
	movq	160(%rbx), %rax
	movq	RB_fin@GOTPCREL(%rip), %r11
	movl	%r15d, 92(%r10)
	movq	%rax, 80(%r10)
	jmp	.L37
.L24:
	movl	168(%rbx), %edi
	leaq	(%r14,%r14,2), %rsi
	salq	$5, %rsi
	testl	%edx, %edx
	leaq	(%r10,%rsi), %rax
	movl	%edi, 92(%rax)
	movq	160(%rbx), %rdi
	movl	$0, 40(%rax)
	movq	%rdi, 80(%rax)
	movabsq	$4294967297, %rdi
	movq	%rdi, (%r10,%rsi)
	movl	$1, 8(%rax)
	je	.L137
	cmpl	$32, %edx
	jg	.L137
.L35:
	movl	$1, 16(%rbp)
	.p2align 4,,15
.L37:
	leal	1(%r12), %eax
	addl	$1, %r13d
	movl	$0, 8(%rbp)
	movl	%eax, %edx
	sarl	$31, %edx
	idivl	%ecx
	movl	%r13d, (%r9)
	movl	%edx, (%r11)
	jmp	.L1
.L13:
	movq	TAM_RS_SUMREST@GOTPCREL(%rip), %rdx
	movl	(%rdx), %ecx
	movq	TAM_RS_ENTEROS@GOTPCREL(%rip), %rdx
	addl	(%rdx), %ecx
	movq	TAM_RS_MULTDIV@GOTPCREL(%rip), %rdx
	addl	(%rdx), %ecx
	movq	TAM_BUFFER_CARGA@GOTPCREL(%rip), %rdx
	addl	(%rdx), %ecx
	movq	TAM_BUFFER_ALMACEN@GOTPCREL(%rip), %rdx
	movl	(%rdx), %edi
	addl	%ecx, %edi
	cmpl	%edi, %ecx
	jge	.L1
	movq	RS@GOTPCREL(%rip), %rdx
	movslq	%ecx, %rsi
	leaq	(%rsi,%rsi,4), %r8
	leaq	(%rsi,%r8,4), %r8
	movl	(%rdx,%r8,8), %r13d
	testl	%r13d, %r13d
	je	.L69
	addq	$1, %rsi
	leaq	(%rsi,%rsi,4), %r8
	leaq	(%rsi,%r8,4), %rsi
	leaq	(%rdx,%rsi,8), %rsi
	.p2align 4,,15
.L70:
	addl	$1, %ecx
	cmpl	%edi, %ecx
	je	.L1
	movl	(%rsi), %r11d
	addq	$168, %rsi
	testl	%r11d, %r11d
	jne	.L70
	movslq	%ecx, %rsi
.L69:
	leaq	(%rsi,%rsi,4), %rcx
	leaq	(%rsi,%rcx,4), %rcx
	leaq	(%rdx,%rcx,8), %rcx
	movl	$1, (%rcx)
	movl	%eax, 4(%rcx)
	movslq	8(%rbx), %rcx
	salq	$4, %rcx
	addq	Rint@GOTPCREL(%rip), %rcx
	movl	8(%rcx), %edi
	cmpl	$4096, %edi
	je	.L188
	movslq	%edi, %rcx
	leaq	(%rcx,%rcx,2), %r8
	salq	$5, %r8
	movl	8(%r10,%r8), %r9d
	testl	%r9d, %r9d
	je	.L73
	imulq	$96, %rcx, %rcx
	imulq	$168, %rsi, %rdi
	movq	24(%r10,%rcx), %rcx
	addq	%rdx, %rdi
	movq	%rcx, 16(%rdi)
	movl	$4096, 8(%rdi)
.L72:
	movslq	12(%rbx), %rcx
	salq	$4, %rcx
	addq	Rfp@GOTPCREL(%rip), %rcx
	movl	8(%rcx), %edi
	cmpl	$4096, %edi
	je	.L189
	movslq	%edi, %rcx
	leaq	(%rcx,%rcx,2), %r8
	salq	$5, %r8
	movl	8(%r10,%r8), %r8d
	testl	%r8d, %r8d
	je	.L76
	imulq	$96, %rcx, %rcx
	imulq	$168, %rsi, %rdi
	movq	24(%r10,%rcx), %rcx
	addq	%rdx, %rdi
	movq	%rcx, 32(%rdi)
	movl	$4096, 24(%rdi)
.L75:
	leaq	(%rsi,%rsi,4), %rcx
	leaq	(%r14,%r14,2), %r14
	movswq	20(%rbx), %rdi
	leaq	(%rsi,%rcx,4), %rcx
	movl	168(%rbx), %r15d
	salq	$5, %r14
	salq	$3, %rcx
	addq	%r10, %r14
	movq	%rsi, 16(%r14)
	leaq	(%rdx,%rcx), %r13
	movq	%rdi, 48(%r13)
	leaq	32(%rbx), %rsi
	movl	$0, 124(%r13)
	leaq	56(%rdx,%rcx), %rdi
	movl	$1, (%r14)
	movl	%eax, 4(%r14)
	movl	$0, 8(%r14)
	movl	%r15d, 160(%r13)
	call	strcpy@PLT
	movq	160(%rbx), %rax
	movq	RB_fin@GOTPCREL(%rip), %r11
	movq	RB_long@GOTPCREL(%rip), %r9
	movq	%rax, 80(%r14)
	movq	TAM_REORDER@GOTPCREL(%rip), %rax
	movl	%r12d, 148(%r13)
	movl	$0, 120(%r13)
	movl	%r15d, 92(%r14)
	movl	(%rax), %ecx
	movl	(%r11), %r12d
	movl	(%r9), %r13d
	jmp	.L37
.L19:
	movq	TAM_RS_ENTEROS@GOTPCREL(%rip), %rdx
	movl	(%rdx), %r8d
	testl	%r8d, %r8d
	jle	.L1
	movq	RS@GOTPCREL(%rip), %rdx
	movl	(%rdx), %edi
	testl	%edi, %edi
	je	.L135
	leaq	168(%rdx), %rdi
	xorl	%esi, %esi
	.p2align 4,,15
.L34:
	addl	$1, %esi
	cmpl	%r8d, %esi
	je	.L1
	movl	(%rdi), %r15d
	addq	$168, %rdi
	testl	%r15d, %r15d
	jne	.L34
.L33:
	movslq	%esi, %rsi
	leaq	(%r14,%r14,2), %r8
	movl	168(%rbx), %r15d
	leaq	(%rsi,%rsi,4), %rdi
	salq	$5, %r8
	leaq	(%rsi,%rdi,4), %rdi
	addq	%r10, %r8
	leaq	(%rdx,%rdi,8), %rdi
	movl	%eax, 4(%rdi)
	movl	%eax, 4(%r8)
	movq	160(%rbx), %rax
	movslq	8(%rbx), %r14
	movl	%r15d, 92(%r8)
	movq	%rax, 80(%r8)
	movslq	16(%rbx), %rax
	movl	$1, (%r8)
	movl	$0, 8(%r8)
	movq	%rax, 16(%r8)
	movq	Rint@GOTPCREL(%rip), %r8
	salq	$4, %r14
	movl	%r15d, 160(%rdi)
	movl	$1, (%rdi)
	leaq	(%r8,%r14), %r15
	movl	8(%r15), %r14d
	movl	$0, 124(%rdi)
	movl	%r12d, 148(%rdi)
	movq	%rax, %rdi
	cmpl	$4096, %r14d
	je	.L190
	movslq	%r14d, %r15
	movq	%r15, 8(%rsp)
	leaq	(%r15,%r15,2), %r15
	salq	$5, %r15
	movl	8(%r10,%r15), %r15d
	testl	%r15d, %r15d
	je	.L79
	imulq	$96, 8(%rsp), %r15
	imulq	$168, %rsi, %r14
	movq	24(%r10,%r15), %r15
	addq	%rdx, %r14
	movq	%r15, 16(%r14)
	movl	$4096, 8(%r14)
.L78:
	movslq	12(%rbx), %rbx
	salq	$4, %rbx
	addq	%r8, %rbx
	movl	8(%rbx), %r14d
	cmpl	$4096, %r14d
	je	.L191
	movslq	%r14d, %rbx
	imulq	$168, %rsi, %rsi
	leaq	(%rbx,%rbx,2), %r15
	salq	$5, %r15
	movl	8(%r10,%r15), %r15d
	testl	%r15d, %r15d
	je	.L82
	addq	%rdx, %rsi
	imulq	$96, %rbx, %rdx
	movl	$4096, 24(%rsi)
	movq	24(%r10,%rdx), %rdx
	movq	%rdx, 32(%rsi)
.L81:
	testl	%edi, %edi
	je	.L37
	salq	$4, %rax
	movl	%r12d, 8(%r8,%rax)
	jmp	.L37
.L23:
	movq	TAM_RS_SUMREST@GOTPCREL(%rip), %rdx
	movl	(%rdx), %edi
	movq	TAM_RS_ENTEROS@GOTPCREL(%rip), %rdx
	addl	(%rdx), %edi
	movq	TAM_RS_MULTDIV@GOTPCREL(%rip), %rdx
	addl	(%rdx), %edi
	movq	TAM_BUFFER_CARGA@GOTPCREL(%rip), %rdx
	addl	(%rdx), %edi
	movq	TAM_BUFFER_ALMACEN@GOTPCREL(%rip), %rdx
	movl	(%rdx), %r8d
	addl	%edi, %r8d
	cmpl	%r8d, %edi
	jge	.L1
	movq	RS@GOTPCREL(%rip), %rdx
	movslq	%edi, %r15
	leaq	(%r15,%r15,4), %rsi
	leaq	(%r15,%rsi,4), %rsi
	movl	(%rdx,%rsi,8), %r11d
	testl	%r11d, %r11d
	je	.L61
	addq	$1, %r15
	leaq	(%r15,%r15,4), %rsi
	leaq	(%r15,%rsi,4), %rsi
	leaq	(%rdx,%rsi,8), %rsi
	.p2align 4,,15
.L62:
	addl	$1, %edi
	cmpl	%r8d, %edi
	je	.L1
	movl	(%rsi), %r9d
	addq	$168, %rsi
	testl	%r9d, %r9d
	jne	.L62
	movslq	%edi, %r15
.L61:
	movl	168(%rbx), %edi
	leaq	(%r15,%r15,4), %rsi
	movq	Rint@GOTPCREL(%rip), %r8
	leaq	(%r15,%rsi,4), %rsi
	leaq	(%rdx,%rsi,8), %rsi
	movl	%eax, 4(%rsi)
	movl	$1, (%rsi)
	movl	$0, 124(%rsi)
	movl	%edi, 160(%rsi)
	movl	%r12d, 148(%rsi)
	leaq	(%r14,%r14,2), %rsi
	salq	$5, %rsi
	addq	%r10, %rsi
	movl	%eax, 4(%rsi)
	movq	160(%rbx), %rax
	movl	$1, (%rsi)
	movl	%edi, 92(%rsi)
	movq	%rax, 80(%rsi)
	movslq	8(%rbx), %rax
	movq	%r15, 16(%rsi)
	movl	$0, 8(%rsi)
	salq	$4, %rax
	addq	%r8, %rax
	movl	8(%rax), %esi
	cmpl	$4096, %esi
	je	.L192
	movslq	%esi, %rax
	leaq	(%rax,%rax,2), %rdi
	salq	$5, %rdi
	movl	8(%r10,%rdi), %edi
	testl	%edi, %edi
	je	.L65
	imulq	$96, %rax, %rax
	imulq	$168, %r15, %rsi
	movq	24(%r10,%rax), %rax
	addq	%rdx, %rsi
	movq	%rax, 16(%rsi)
	movl	$4096, 8(%rsi)
.L64:
	movswq	20(%rbx), %rsi
	leaq	(%r15,%r15,4), %rax
	movq	%r8, 24(%rsp)
	leaq	(%r15,%rax,4), %rax
	movl	%ecx, 20(%rsp)
	salq	$3, %rax
	movq	%rsi, 48(%rdx,%rax)
	leaq	56(%rdx,%rax), %rdi
	movq	%rdx, 8(%rsp)
	leaq	32(%rbx), %rsi
	call	strcpy@PLT
	movslq	12(%rbx), %rax
	movq	24(%rsp), %r8
	movq	8(%rsp), %rdx
	salq	$4, %rax
	movl	20(%rsp), %ecx
	addq	%rax, %r8
	movl	8(%r8), %eax
	movq	RB_long@GOTPCREL(%rip), %r9
	movq	RB@GOTPCREL(%rip), %r10
	movq	RB_fin@GOTPCREL(%rip), %r11
	cmpl	$4096, %eax
	je	.L193
	movslq	%eax, %rsi
	leaq	(%rsi,%rsi,2), %rdi
	salq	$5, %rdi
	movl	8(%r10,%rdi), %r14d
	testl	%r14d, %r14d
	je	.L68
	imulq	$96, %rsi, %rsi
	imulq	$168, %r15, %rax
	movq	24(%r10,%rsi), %rsi
	addq	%rdx, %rax
	movq	%rsi, 32(%rax)
	movl	$4096, 24(%rax)
.L67:
	leaq	(%r15,%r15,4), %rax
	leaq	(%r15,%rax,4), %rax
	movl	$0, 120(%rdx,%rax,8)
	jmp	.L37
.L25:
	movl	$0, 8(%rbp)
	jmp	.L1
	.p2align 4,,7
	.p2align 3
.L175:
	movl	$1, %edx
	leaq	.LC2(%rip), %rdi
	call	*%rcx
	jmp	.L7
.L137:
	movswl	20(%rbx), %edx
	leaq	(%r14,%r14,2), %rax
	salq	$5, %rax
	addl	$32, %edx
	movl	%edx, 72(%r10,%rax)
	jmp	.L35
.L176:
	movq	TAM_REGISTROS@GOTPCREL(%rip), %rax
	movq	%rdi, 24(%rdx)
	movl	$1, 8(%rdx)
	movl	(%rax), %eax
	subl	$1, %eax
	cltq
	movq	%rax, 16(%rdx)
	salq	$4, %rax
	addq	Rint@GOTPCREL(%rip), %rax
	movl	%r14d, 8(%rax)
	jmp	.L37
.L122:
	movq	TAM_REGISTROS@GOTPCREL(%rip), %rax
	addq	$4, %r15
	movq	Rint@GOTPCREL(%rip), %r8
	movq	%r15, 24(%rdi)
	movl	(%rax), %eax
	subl	$1, %eax
	cltq
	movq	%rax, 16(%rdi)
	salq	$4, %rax
	movl	%r12d, 8(%r8,%rax)
	jmp	.L123
.L177:
	movq	(%r8), %rdi
	leaq	(%rsi,%rsi,4), %rax
	leaq	(%rsi,%rax,4), %rax
	leaq	(%rdx,%rax,8), %rax
	movq	%rdi, 16(%rax)
	movl	$4096, 8(%rax)
	jmp	.L43
.L44:
	movl	%edi, 8(%rdx,%rax,8)
	jmp	.L43
.L59:
	movq	%r15, %rax
	salq	$4, %rax
	addq	Rfp@GOTPCREL(%rip), %rax
	movl	%r12d, 8(%rax)
	jmp	.L60
.L138:
	movq	%r8, %rax
	salq	$4, %rax
	addq	Rint@GOTPCREL(%rip), %rax
	movl	%r12d, 8(%rax)
	jmp	.L101
.L58:
	imulq	$168, %rsi, %r15
	movl	%edi, 8(%rdx,%r15)
	jmp	.L57
.L187:
	imulq	$168, %rsi, %rdi
	movq	(%r15), %r15
	addq	%rdx, %rdi
	movq	%r15, 16(%rdi)
	movl	$4096, 8(%rdi)
	jmp	.L57
.L98:
	imulq	$168, %rcx, %rsi
	movl	%r8d, 24(%rdx,%rsi)
	jmp	.L97
.L182:
	imulq	$168, %rcx, %r8
	movq	(%rsi), %rsi
	addq	%rdx, %r8
	movq	%rsi, 32(%r8)
	movl	$4096, 24(%r8)
	jmp	.L97
.L95:
	imulq	$168, %rcx, %rsi
	movl	%r8d, 8(%rdx,%rsi)
	jmp	.L94
.L181:
	imulq	$168, %rcx, %r8
	movq	(%rsi), %rsi
	addq	%rdx, %r8
	movq	%rsi, 16(%r8)
	movl	$4096, 8(%r8)
	jmp	.L94
.L47:
	imulq	$168, %rsi, %rax
	movl	%edi, 8(%rdx,%rax)
	jmp	.L46
.L183:
	imulq	$168, %rsi, %rdi
	movq	(%rax), %rax
	addq	%rdx, %rdi
	movq	%rax, 16(%rdi)
	movl	$4096, 8(%rdi)
	jmp	.L46
.L53:
	imulq	$168, %rsi, %rdi
	movl	%eax, 24(%rdx,%rdi)
	jmp	.L52
.L186:
	imulq	$168, %rsi, %rax
	movq	(%r8), %rdi
	addq	%rdx, %rax
	movq	%rdi, 32(%rax)
	movl	$4096, 24(%rax)
	jmp	.L52
.L50:
	imulq	$168, %rsi, %rax
	movl	%edi, 8(%rdx,%rax)
	jmp	.L49
.L185:
	imulq	$168, %rsi, %rdi
	movq	(%rax), %rax
	addq	%rdx, %rdi
	movq	%rax, 16(%rdi)
	movl	$4096, 8(%rdi)
	jmp	.L49
.L90:
	imulq	$168, %rsi, %r15
	movl	%r8d, 8(%rdx,%r15)
	jmp	.L89
.L178:
	imulq	$168, %rsi, %r8
	movq	(%r15), %r15
	addq	%rdx, %r8
	movq	%r15, 16(%r8)
	movl	$4096, 8(%r8)
	jmp	.L89
.L68:
	imulq	$168, %r15, %rsi
	movl	%eax, 24(%rdx,%rsi)
	jmp	.L67
.L193:
	imulq	$168, %r15, %rax
	movq	(%r8), %rsi
	addq	%rdx, %rax
	movq	%rsi, 32(%rax)
	movl	$4096, 24(%rax)
	jmp	.L67
.L65:
	imulq	$168, %r15, %rax
	movl	%esi, 8(%rdx,%rax)
	jmp	.L64
.L192:
	imulq	$168, %r15, %rsi
	movq	(%rax), %rax
	addq	%rdx, %rsi
	movq	%rax, 16(%rsi)
	movl	$4096, 8(%rsi)
	jmp	.L64
.L85:
	imulq	$168, %rsi, %rax
	movl	%edi, 8(%rdx,%rax)
	jmp	.L84
.L184:
	imulq	$168, %rsi, %rdi
	movq	(%rax), %rax
	addq	%rdx, %rdi
	movq	%rax, 16(%rdi)
	movl	$4096, 8(%rdi)
	jmp	.L84
.L82:
	movl	%r14d, 24(%rdx,%rsi)
	jmp	.L81
.L191:
	imulq	$168, %rsi, %rsi
	addq	%rsi, %rdx
	movq	(%rbx), %rsi
	movl	$4096, 24(%rdx)
	movq	%rsi, 32(%rdx)
	jmp	.L81
.L79:
	imulq	$168, %rsi, %r15
	movl	%r14d, 8(%rdx,%r15)
	jmp	.L78
.L190:
	imulq	$168, %rsi, %r14
	movq	(%r15), %r15
	addq	%rdx, %r14
	movq	%r15, 16(%r14)
	movl	$4096, 8(%r14)
	jmp	.L78
.L109:
	imulq	$168, %rsi, %r15
	movl	%r8d, 24(%rdx,%r15)
	jmp	.L108
.L180:
	imulq	$168, %rsi, %r8
	movq	(%r15), %r15
	addq	%rdx, %r8
	movq	%r15, 32(%r8)
	movl	$4096, 24(%r8)
	jmp	.L108
.L106:
	imulq	$168, %rsi, %r15
	movl	%r8d, 8(%rdx,%r15)
	jmp	.L105
.L179:
	imulq	$168, %rsi, %r8
	movq	(%r15), %r15
	addq	%rdx, %r8
	movq	%r15, 16(%r8)
	movl	$4096, 8(%r8)
	jmp	.L105
.L76:
	imulq	$168, %rsi, %rcx
	movl	%edi, 24(%rdx,%rcx)
	jmp	.L75
.L189:
	imulq	$168, %rsi, %rdi
	movq	(%rcx), %rcx
	addq	%rdx, %rdi
	movq	%rcx, 32(%rdi)
	movl	$4096, 24(%rdi)
	jmp	.L75
.L73:
	imulq	$168, %rsi, %rcx
	movl	%edi, 8(%rdx,%rcx)
	jmp	.L72
.L188:
	imulq	$168, %rsi, %rdi
	movq	(%rcx), %rcx
	addq	%rdx, %rdi
	movq	%rcx, 16(%rdi)
	movl	$4096, 8(%rdi)
	jmp	.L72
.L136:
	xorl	%esi, %esi
	jmp	.L39
.L135:
	xorl	%esi, %esi
	jmp	.L33
.L134:
	xorl	%esi, %esi
	.p2align 4,,5
	jmp	.L31
.L132:
	xorl	%esi, %esi
	.p2align 4,,5
	jmp	.L27
.L133:
	xorl	%esi, %esi
	.p2align 4,,5
	jmp	.L29
.L10:
	movl	%eax, %r8d
	movl	$955, %ecx
	movq	stderr@GOTPCREL(%rip), %rax
	leaq	.LC3(%rip), %rdx
	leaq	.LC4(%rip), %rsi
	movq	(%rax), %rdi
	xorl	%eax, %eax
	call	fprintf@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE26:
	.size	fase_ISS, .-fase_ISS
	.ident	"GCC: (Debian 8.3.0-6) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
