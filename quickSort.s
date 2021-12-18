	.file	"quickSort.c"
	.text
	.section .rdata,"dr"
LC0:
	.ascii "%d \0"
	.text
	.p2align 4,,15
	.globl	_dispArray
	.def	_dispArray;	.scl	2;	.type	32;	.endef
_dispArray:
LFB15:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	movl	36(%esp), %eax
	movl	32(%esp), %ebx
	testl	%eax, %eax
	jle	L2
	leal	(%ebx,%eax,4), %esi
	.p2align 4,,10
L3:
	movl	(%ebx), %eax
	movl	$LC0, (%esp)
	addl	$4, %ebx
	movl	%eax, 4(%esp)
	call	_printf
	cmpl	%esi, %ebx
	jne	L3
L2:
	movl	$10, 32(%esp)
	addl	$20, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	jmp	_putchar
	.cfi_endproc
LFE15:
	.p2align 4,,15
	.globl	_partition
	.def	_partition;	.scl	2;	.type	32;	.endef
_partition:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	movl	24(%esp), %edx
	movl	20(%esp), %ebx
	movl	32(%esp), %ecx
	leal	-1(%edx), %eax
	leal	(%ebx,%edx,4), %esi
	movl	28(%esp), %edx
	.p2align 4,,10
L8:
	movl	(%esi), %edi
	addl	$1, %eax
	cmpl	%ecx, %edi
	jl	L9
	testl	%edx, %edx
	jle	L10
	movl	20(%esp), %ebx
	subl	$1, %edx
	cmpl	(%ebx,%edx,4), %ecx
	jge	L10
	movl	20(%esp), %ebx
	jmp	L11
	.p2align 4,,10
L12:
	subl	$1, %edx
	cmpl	%ecx, (%ebx,%edx,4)
	jle	L16
L11:
	testl	%edx, %edx
	jne	L12
L16:
	movl	%ebx, 20(%esp)
L10:
	movl	20(%esp), %ebx
	cmpl	%eax, %edx
	jle	L13
	leal	(%ebx,%edx,4), %ebp
	movl	0(%ebp), %ebx
	movl	%ebx, (%esi)
	movl	%edi, 0(%ebp)
L9:
	addl	$4, %esi
	jmp	L8
	.p2align 4,,10
L13:
	movl	28(%esp), %ecx
	leal	(%ebx,%ecx,4), %edx
	movl	(%edx), %ecx
	movl	%ecx, (%esi)
	movl	%edi, (%edx)
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE17:
	.p2align 4,,15
	.globl	_quickSort
	.def	_quickSort;	.scl	2;	.type	32;	.endef
_quickSort:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	52(%esp), %ebx
	movl	56(%esp), %edi
	cmpl	%edi, %ebx
	jge	L18
	movl	48(%esp), %eax
	leal	(%eax,%edi,4), %ebp
L20:
	movl	0(%ebp), %eax
	movl	%ebx, 4(%esp)
	movl	%edi, 8(%esp)
	movl	%eax, 12(%esp)
	movl	48(%esp), %eax
	movl	%eax, (%esp)
	call	_partition
	movl	%ebx, 4(%esp)
	movl	%eax, %esi
	leal	-1(%eax), %eax
	movl	%eax, 8(%esp)
	movl	48(%esp), %eax
	leal	1(%esi), %ebx
	movl	%eax, (%esp)
	call	_quickSort
	cmpl	%edi, %ebx
	jl	L20
L18:
	addl	$28, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE16:
	.p2align 4,,15
	.globl	_swap
	.def	_swap;	.scl	2;	.type	32;	.endef
_swap:
LFB18:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	movl	8(%esp), %eax
	movl	16(%esp), %ebx
	movl	12(%esp), %edx
	leal	(%eax,%edx,4), %edx
	leal	(%eax,%ebx,4), %eax
	movl	(%eax), %ebx
	movl	(%edx), %ecx
	movl	%ebx, (%edx)
	movl	%ecx, (%eax)
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE18:
	.p2align 4,,15
	.globl	_equalsArray
	.def	_equalsArray;	.scl	2;	.type	32;	.endef
_equalsArray:
LFB19:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	movl	40(%esp), %ebx
	movl	32(%esp), %edx
	movl	36(%esp), %esi
	testl	%ebx, %ebx
	jle	L30
	movl	(%esi), %eax
	cmpl	%eax, (%edx)
	jne	L27
	xorl	%eax, %eax
	jmp	L28
	.p2align 4,,10
L29:
	movl	(%esi,%eax,4), %ecx
	cmpl	%ecx, (%edx,%eax,4)
	jne	L27
L28:
	addl	$1, %eax
	cmpl	%eax, %ebx
	jne	L29
L30:
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	movl	$1, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
L27:
	.cfi_restore_state
	movl	%ebx, 4(%esp)
	movl	%edx, (%esp)
	call	_dispArray
	movl	%ebx, 4(%esp)
	movl	%esi, (%esp)
	call	_dispArray
	addl	$20, %esp
	.cfi_def_cfa_offset 12
	xorl	%eax, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE19:
	.section .rdata,"dr"
LC1:
	.ascii "quickSort.c\0"
LC2:
	.ascii "equalsArray(T1, V1, len)\0"
LC3:
	.ascii "equalsArray(T2, V2, len)\0"
LC4:
	.ascii "equalsArray(T3, V3, len)\0"
LC5:
	.ascii "equalsArray(T4, V4, len)\0"
LC6:
	.ascii "equalsArray(T5, V5, len)\0"
LC7:
	.ascii "equalsArray(T6, V6, len)\0"
LC8:
	.ascii "equalsArray(T7, V7, len)\0"
	.text
	.p2align 4,,15
	.globl	_testQuickSort
	.def	_testQuickSort;	.scl	2;	.type	32;	.endef
_testQuickSort:
LFB20:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$248, %esp
	.cfi_def_cfa_offset 256
	leal	16(%esp), %ebx
	movl	$0, 8(%esp)
	movl	$0, 4(%esp)
	movl	%ebx, (%esp)
	movl	$4, 16(%esp)
	movl	$4, 20(%esp)
	call	_quickSort
	leal	20(%esp), %eax
	movl	$1, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	_equalsArray
	testl	%eax, %eax
	je	L42
L34:
	leal	24(%esp), %ebx
	movl	$1, 8(%esp)
	movl	$0, 4(%esp)
	movl	%ebx, (%esp)
	movl	$4, 24(%esp)
	movl	$6, 28(%esp)
	movl	$4, 32(%esp)
	movl	$6, 36(%esp)
	call	_quickSort
	leal	32(%esp), %eax
	movl	$2, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	_equalsArray
	testl	%eax, %eax
	je	L43
L35:
	leal	40(%esp), %ebx
	movl	$2, 8(%esp)
	movl	$0, 4(%esp)
	movl	%ebx, (%esp)
	movl	$4, 40(%esp)
	movl	$6, 44(%esp)
	movl	$3, 48(%esp)
	movl	$3, 52(%esp)
	movl	$4, 56(%esp)
	movl	$6, 60(%esp)
	call	_quickSort
	leal	52(%esp), %eax
	movl	$3, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	_equalsArray
	testl	%eax, %eax
	je	L44
L36:
	leal	64(%esp), %ebx
	movl	$3, 8(%esp)
	movl	$0, 4(%esp)
	movl	%ebx, (%esp)
	movl	$4, 64(%esp)
	movl	$6, 68(%esp)
	movl	$3, 72(%esp)
	movl	$2, 76(%esp)
	movl	$2, 80(%esp)
	movl	$3, 84(%esp)
	movl	$4, 88(%esp)
	movl	$6, 92(%esp)
	call	_quickSort
	leal	80(%esp), %eax
	movl	$4, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	_equalsArray
	testl	%eax, %eax
	je	L45
L37:
	leal	96(%esp), %ebx
	movl	$4, 8(%esp)
	movl	$0, 4(%esp)
	movl	%ebx, (%esp)
	movl	$4, 96(%esp)
	movl	$6, 100(%esp)
	movl	$3, 104(%esp)
	movl	$2, 108(%esp)
	movl	$1, 112(%esp)
	movl	$1, 116(%esp)
	movl	$2, 120(%esp)
	movl	$3, 124(%esp)
	movl	$4, 128(%esp)
	movl	$6, 132(%esp)
	call	_quickSort
	leal	116(%esp), %eax
	movl	$5, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	_equalsArray
	testl	%eax, %eax
	je	L46
L38:
	leal	136(%esp), %ebx
	movl	$5, 8(%esp)
	movl	$0, 4(%esp)
	movl	%ebx, (%esp)
	movl	$4, 136(%esp)
	movl	$6, 140(%esp)
	movl	$3, 144(%esp)
	movl	$2, 148(%esp)
	movl	$1, 152(%esp)
	movl	$9, 156(%esp)
	movl	$1, 160(%esp)
	movl	$2, 164(%esp)
	movl	$3, 168(%esp)
	movl	$4, 172(%esp)
	movl	$6, 176(%esp)
	movl	$9, 180(%esp)
	call	_quickSort
	leal	160(%esp), %eax
	movl	$6, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	_equalsArray
	testl	%eax, %eax
	je	L47
L39:
	leal	184(%esp), %ebx
	movl	$6, 8(%esp)
	movl	$0, 4(%esp)
	movl	%ebx, (%esp)
	movl	$4, 184(%esp)
	movl	$6, 188(%esp)
	movl	$3, 192(%esp)
	movl	$2, 196(%esp)
	movl	$1, 200(%esp)
	movl	$9, 204(%esp)
	movl	$7, 208(%esp)
	movl	$1, 212(%esp)
	movl	$2, 216(%esp)
	movl	$3, 220(%esp)
	movl	$4, 224(%esp)
	movl	$6, 228(%esp)
	movl	$7, 232(%esp)
	movl	$9, 236(%esp)
	call	_quickSort
	leal	212(%esp), %eax
	movl	$7, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ebx, (%esp)
	call	_equalsArray
	testl	%eax, %eax
	je	L48
	addl	$248, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
L42:
	.cfi_restore_state
	movl	$90, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC2, (%esp)
	call	__assert
	jmp	L34
	.p2align 4,,10
L48:
	movl	$126, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC8, (%esp)
	call	__assert
	addl	$248, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,10
L47:
	.cfi_restore_state
	movl	$120, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC7, (%esp)
	call	__assert
	jmp	L39
	.p2align 4,,10
L46:
	movl	$114, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC6, (%esp)
	call	__assert
	jmp	L38
	.p2align 4,,10
L45:
	movl	$108, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC5, (%esp)
	call	__assert
	jmp	L37
	.p2align 4,,10
L44:
	movl	$102, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC4, (%esp)
	call	__assert
	jmp	L36
	.p2align 4,,10
L43:
	movl	$96, 8(%esp)
	movl	$LC1, 4(%esp)
	movl	$LC3, (%esp)
	call	__assert
	jmp	L35
	.cfi_endproc
LFE20:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC9:
	.ascii "Tests OK\0"
	.section	.text.startup,"x"
	.p2align 4,,15
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	andl	$-16, %esp
	subl	$48, %esp
	.cfi_offset 3, -12
	call	___main
	leal	20(%esp), %ebx
	call	_testQuickSort
	movl	$LC9, (%esp)
	call	_puts
	movl	%ebx, (%esp)
	movl	$7, 4(%esp)
	movl	$4, 20(%esp)
	movl	$6, 24(%esp)
	movl	$3, 28(%esp)
	movl	$2, 32(%esp)
	movl	$1, 36(%esp)
	movl	$9, 40(%esp)
	movl	$7, 44(%esp)
	call	_dispArray
	movl	%ebx, (%esp)
	movl	$6, 8(%esp)
	movl	$0, 4(%esp)
	call	_quickSort
	movl	%ebx, (%esp)
	movl	$7, 4(%esp)
	call	_dispArray
	xorl	%eax, %eax
	movl	-4(%ebp), %ebx
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.ident	"GCC: (i686-posix-dwarf-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	__assert;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
