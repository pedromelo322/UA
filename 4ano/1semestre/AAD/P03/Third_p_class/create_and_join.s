	.file	"create_and_join.c"
# GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04) version 13.3.0 (x86_64-linux-gnu)
#	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64 -O2 -fopenmp -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.p2align 4
	.type	wall_time, @function
wall_time:
.LFB39:
	.cfi_startproc
	subq	$40, %rsp	#,
	.cfi_def_cfa_offset 48
# create_and_join.c:38:   if(clock_gettime(CLOCK_REALTIME,&current_time) != 0)
	xorl	%edi, %edi	#
# create_and_join.c:35: {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp98
	movq	%rax, 24(%rsp)	# tmp98, D.4754
	xorl	%eax, %eax	# tmp98
# create_and_join.c:38:   if(clock_gettime(CLOCK_REALTIME,&current_time) != 0)
	movq	%rsp, %rsi	#, tmp90
	call	clock_gettime@PLT	#
# create_and_join.c:38:   if(clock_gettime(CLOCK_REALTIME,&current_time) != 0)
	testl	%eax, %eax	# tmp97
	jne	.L6	#,
# create_and_join.c:40:   return (double)current_time.tv_sec + 1.0e-9 * (double)current_time.tv_nsec;
	pxor	%xmm0, %xmm0	# tmp91
# create_and_join.c:40:   return (double)current_time.tv_sec + 1.0e-9 * (double)current_time.tv_nsec;
	pxor	%xmm1, %xmm1	# tmp94
# create_and_join.c:40:   return (double)current_time.tv_sec + 1.0e-9 * (double)current_time.tv_nsec;
	cvtsi2sdq	8(%rsp), %xmm0	# current_time.tv_nsec, tmp91
# create_and_join.c:40:   return (double)current_time.tv_sec + 1.0e-9 * (double)current_time.tv_nsec;
	mulsd	.LC0(%rip), %xmm0	#, tmp92
# create_and_join.c:40:   return (double)current_time.tv_sec + 1.0e-9 * (double)current_time.tv_nsec;
	cvtsi2sdq	(%rsp), %xmm1	# current_time.tv_sec, tmp94
# create_and_join.c:40:   return (double)current_time.tv_sec + 1.0e-9 * (double)current_time.tv_nsec;
	addsd	%xmm1, %xmm0	# tmp94, <retval>
# create_and_join.c:41: }
	movq	24(%rsp), %rax	# D.4754, tmp99
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp99
	jne	.L7	#,
	addq	$40, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
.L6:
	.cfi_restore_state
# create_and_join.c:39:     exit(1); // silent exit: clock_gettime() failed!!!
	movl	$1, %edi	#,
	call	exit@PLT	#
.L7:
# create_and_join.c:41: }
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE39:
	.size	wall_time, .-wall_time
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"hello from the block code from thread %d\n"
	.text
	.p2align 4
	.type	main._omp_fn.0, @function
main._omp_fn.0:
.LFB41:
	.cfi_startproc
	endbr64	
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 16
# create_and_join.c:55:     printf("hello from the block code from thread %d\n",omp_get_thread_num());
	call	omp_get_thread_num@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC1(%rip), %rsi	#, tmp84
	movl	$2, %edi	#,
# create_and_join.c:53: # pragma omp parallel num_threads(n_threads)
	addq	$8, %rsp	#,
	.cfi_def_cfa_offset 8
# create_and_join.c:55:     printf("hello from the block code from thread %d\n",omp_get_thread_num());
	movl	%eax, %edx	# tmp85, _1
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	xorl	%eax, %eax	#
	jmp	__printf_chk@PLT	#
	.cfi_endproc
.LFE41:
	.size	main._omp_fn.0, .-main._omp_fn.0
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"i=%d from thread %d\n"
	.text
	.p2align 4
	.type	main._omp_fn.1, @function
main._omp_fn.1:
.LFB42:
	.cfi_startproc
	endbr64	
	pushq	%r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp	#,
	.cfi_def_cfa_offset 48
	call	omp_get_num_threads@PLT	#
	movl	%eax, %ebx	# tmp99, _6
	call	omp_get_thread_num@PLT	#
	xorl	%edx, %edx	# tt.6_2
	movl	%eax, %r12d	# tmp100, _7
	movl	$20, %eax	#, q.5_1
	idivl	%ebx	# _6
	cmpl	%edx, %r12d	# tt.6_2, _7
	jl	.L11	#,
.L14:
	movl	%eax, %ebx	# q.5_1, tmp96
	imull	%r12d, %ebx	# _7, tmp96
	addl	%edx, %ebx	# tt.6_2, i
	leal	(%rax,%rbx), %ebp	#, _13
	cmpl	%ebp, %ebx	# _13, i
	jge	.L10	#,
	leaq	.LC2(%rip), %r13	#, tmp98
	.p2align 4,,10
	.p2align 3
.L13:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	%ebx, %edx	# i,
	movl	%r12d, %ecx	# _7,
	movq	%r13, %rsi	# tmp98,
	movl	$2, %edi	#,
	xorl	%eax, %eax	#
	addl	$1, %ebx	#, i
	call	__printf_chk@PLT	#
	cmpl	%ebx, %ebp	# i, _13
	jne	.L13	#,
.L10:
# create_and_join.c:60: # pragma omp parallel for num_threads(n_threads)
	addq	$8, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx	#
	.cfi_def_cfa_offset 32
	popq	%rbp	#
	.cfi_def_cfa_offset 24
	popq	%r12	#
	.cfi_def_cfa_offset 16
	popq	%r13	#
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L11:
	.cfi_restore_state
	addl	$1, %eax	#, q.5_1
	xorl	%edx, %edx	# tt.6_2
	jmp	.L14	#
	.cfi_endproc
.LFE42:
	.size	main._omp_fn.1, .-main._omp_fn.1
	.section	.rodata.str1.1
.LC3:
	.string	"%4d: hello\n"
.LC4:
	.string	"%4d: start at %.6f\n"
.LC5:
	.string	"%4d: end   at %.6f\n"
	.text
	.p2align 4
	.type	main._omp_fn.2, @function
main._omp_fn.2:
.LFB43:
	.cfi_startproc
	endbr64	
	pushq	%r12	#
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12	# tmp131, .omp_data_i
	pushq	%rbp	#
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx	#
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$48, %rsp	#,
	.cfi_def_cfa_offset 80
# create_and_join.c:71: # pragma omp parallel num_threads(n_threads)
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp135
	movq	%rax, 40(%rsp)	# tmp135, D.4783
	xorl	%eax, %eax	# tmp135
# create_and_join.c:73:     int thread_number = omp_get_thread_num();
	call	omp_get_thread_num@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC3(%rip), %rsi	#, tmp105
	movl	$2, %edi	#,
	movl	%eax, %edx	# thread_number,
# create_and_join.c:73:     int thread_number = omp_get_thread_num();
	movl	%eax, %ebp	# tmp132, thread_number
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# create_and_join.c:38:   if(clock_gettime(CLOCK_REALTIME,&current_time) != 0)
	xorl	%edi, %edi	#
	movq	%rsp, %rsi	#, tmp106
	call	clock_gettime@PLT	#
# create_and_join.c:38:   if(clock_gettime(CLOCK_REALTIME,&current_time) != 0)
	testl	%eax, %eax	# idx
	jne	.L20	#,
# create_and_join.c:40:   return (double)current_time.tv_sec + 1.0e-9 * (double)current_time.tv_nsec;
	pxor	%xmm0, %xmm0	# tmp107
# create_and_join.c:40:   return (double)current_time.tv_sec + 1.0e-9 * (double)current_time.tv_nsec;
	pxor	%xmm1, %xmm1	# tmp110
	movl	%eax, %ebx	# tmp133, idx
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	%ebp, %edx	# thread_number,
# create_and_join.c:40:   return (double)current_time.tv_sec + 1.0e-9 * (double)current_time.tv_nsec;
	cvtsi2sdq	(%rsp), %xmm1	# current_time.tv_sec, tmp110
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$2, %edi	#,
	movl	$1, %eax	#,
# create_and_join.c:40:   return (double)current_time.tv_sec + 1.0e-9 * (double)current_time.tv_nsec;
	cvtsi2sdq	8(%rsp), %xmm0	# current_time.tv_nsec, tmp107
# create_and_join.c:40:   return (double)current_time.tv_sec + 1.0e-9 * (double)current_time.tv_nsec;
	mulsd	.LC0(%rip), %xmm0	#, tmp108
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC4(%rip), %rsi	#, tmp111
# create_and_join.c:40:   return (double)current_time.tv_sec + 1.0e-9 * (double)current_time.tv_nsec;
	addsd	%xmm1, %xmm0	# tmp110, _29
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	__printf_chk@PLT	#
# create_and_join.c:76:     int count = work_to_do[thread_number];
	movq	(%r12), %rax	# *.omp_data_i_7(D).work_to_do, *.omp_data_i_7(D).work_to_do
	movslq	%ebp, %rsi	# thread_number, thread_number
	movl	(%rax,%rsi,4), %ecx	# (*_8)[thread_number_3], count
# create_and_join.c:77:     unsigned int val = 0u;
	xorl	%eax, %eax	# val
# create_and_join.c:78:     for(int idx = 0;idx < count;idx++)
	testl	%ecx, %ecx	# count
	jle	.L22	#,
	.p2align 4,,10
	.p2align 3
.L19:
# create_and_join.c:79:       val = 13u * val + 1u;
	leal	(%rax,%rax,2), %edx	#, tmp125
# create_and_join.c:78:     for(int idx = 0;idx < count;idx++)
	addl	$1, %ebx	#, idx
# create_and_join.c:79:       val = 13u * val + 1u;
	leal	1(%rax,%rdx,4), %eax	#, val
# create_and_join.c:78:     for(int idx = 0;idx < count;idx++)
	cmpl	%ebx, %ecx	# idx, count
	jne	.L19	#,
# create_and_join.c:80:     return_value[thread_number] = (int)(val & 0x3FFFFFFFu);
	andl	$1073741823, %eax	#, val
	movl	%eax, %ebx	# val, idx
.L22:
# create_and_join.c:80:     return_value[thread_number] = (int)(val & 0x3FFFFFFFu);
	movq	8(%r12), %rax	# *.omp_data_i_7(D).return_value, *.omp_data_i_7(D).return_value
# create_and_join.c:38:   if(clock_gettime(CLOCK_REALTIME,&current_time) != 0)
	xorl	%edi, %edi	#
# create_and_join.c:80:     return_value[thread_number] = (int)(val & 0x3FFFFFFFu);
	movl	%ebx, (%rax,%rsi,4)	# idx, (*_13)[thread_number_3]
# create_and_join.c:38:   if(clock_gettime(CLOCK_REALTIME,&current_time) != 0)
	leaq	16(%rsp), %rsi	#, tmp116
	call	clock_gettime@PLT	#
# create_and_join.c:38:   if(clock_gettime(CLOCK_REALTIME,&current_time) != 0)
	testl	%eax, %eax	# tmp134
	jne	.L20	#,
# create_and_join.c:40:   return (double)current_time.tv_sec + 1.0e-9 * (double)current_time.tv_nsec;
	pxor	%xmm0, %xmm0	# tmp117
# create_and_join.c:40:   return (double)current_time.tv_sec + 1.0e-9 * (double)current_time.tv_nsec;
	pxor	%xmm1, %xmm1	# tmp120
# create_and_join.c:40:   return (double)current_time.tv_sec + 1.0e-9 * (double)current_time.tv_nsec;
	cvtsi2sdq	24(%rsp), %xmm0	# current_time.tv_nsec, tmp117
# create_and_join.c:40:   return (double)current_time.tv_sec + 1.0e-9 * (double)current_time.tv_nsec;
	mulsd	.LC0(%rip), %xmm0	#, tmp118
# create_and_join.c:40:   return (double)current_time.tv_sec + 1.0e-9 * (double)current_time.tv_nsec;
	cvtsi2sdq	16(%rsp), %xmm1	# current_time.tv_sec, tmp120
# create_and_join.c:40:   return (double)current_time.tv_sec + 1.0e-9 * (double)current_time.tv_nsec;
	addsd	%xmm1, %xmm0	# tmp120, _36
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movq	40(%rsp), %rax	# D.4783, tmp136
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp136
	jne	.L28	#,
# create_and_join.c:71: # pragma omp parallel num_threads(n_threads)
	addq	$48, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 32
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	%ebp, %edx	# thread_number,
	movl	$2, %edi	#,
	movl	$1, %eax	#,
# create_and_join.c:71: # pragma omp parallel num_threads(n_threads)
	popq	%rbx	#
	.cfi_def_cfa_offset 24
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	.LC5(%rip), %rsi	#, tmp122
# create_and_join.c:71: # pragma omp parallel num_threads(n_threads)
	popq	%rbp	#
	.cfi_def_cfa_offset 16
	popq	%r12	#
	.cfi_def_cfa_offset 8
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	jmp	__printf_chk@PLT	#
.L20:
	.cfi_restore_state
# create_and_join.c:39:     exit(1); // silent exit: clock_gettime() failed!!!
	movl	$1, %edi	#,
	call	exit@PLT	#
.L28:
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE43:
	.size	main._omp_fn.2, .-main._omp_fn.2
	.section	.rodata.str1.1
.LC6:
	.string	"main: start at %.6f\n"
.LC8:
	.string	"main: end at %.6f\n"
.LC9:
	.string	"computed values:"
.LC10:
	.string	"  %2d: %d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB40:
	.cfi_startproc
	endbr64	
	pushq	%r12	#
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	xorl	%ecx, %ecx	#
	movl	$4, %edx	#,
	xorl	%esi, %esi	#
	pushq	%rbp	#
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	main._omp_fn.0(%rip), %rdi	#, tmp95
	leaq	.LC10(%rip), %r12	#, tmp109
	pushq	%rbx	#
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	xorl	%ebx, %ebx	# ivtmp.42
# create_and_join.c:49: {
	subq	$80, %rsp	#,
	.cfi_def_cfa_offset 112
# create_and_join.c:49: {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp113
	movq	%rax, 72(%rsp)	# tmp113, D.4802
	xorl	%eax, %eax	# tmp113
	leaq	48(%rsp), %rbp	#, tmp110
	leaq	32(%rsp), %rax	#, tmp93
	movq	%rbp, %xmm2	# tmp110, tmp110
	movq	%rax, %xmm1	# tmp93, tmp93
	punpcklqdq	%xmm2, %xmm1	# tmp110, tmp92
	movaps	%xmm1, (%rsp)	# tmp92, %sfp
	call	GOMP_parallel@PLT	#
	xorl	%ecx, %ecx	#
	movl	$4, %edx	#,
	xorl	%esi, %esi	#
	leaq	main._omp_fn.1(%rip), %rdi	#, tmp96
	call	GOMP_parallel@PLT	#
# create_and_join.c:66:   printf("main: start at %.6f\n",wall_time());
	call	wall_time	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$2, %edi	#,
	movl	$1, %eax	#,
	leaq	.LC6(%rip), %rsi	#, tmp97
	call	__printf_chk@PLT	#
# create_and_join.c:71: # pragma omp parallel num_threads(n_threads)
	movdqa	(%rsp), %xmm1	# %sfp, tmp92
	xorl	%ecx, %ecx	#
# create_and_join.c:70:     work_to_do[idx] = 100000000 * (n_threads_max + 1 - idx);
	movdqa	.LC7(%rip), %xmm0	#, tmp98
	movl	$4, %edx	#,
	leaq	16(%rsp), %rsi	#, tmp99
	leaq	main._omp_fn.2(%rip), %rdi	#, tmp100
# create_and_join.c:71: # pragma omp parallel num_threads(n_threads)
	movaps	%xmm1, 16(%rsp)	# tmp92, MEM <vector(2) long unsigned int> [(int[4] * *)&.omp_data_o.4]
# create_and_join.c:70:     work_to_do[idx] = 100000000 * (n_threads_max + 1 - idx);
	movaps	%xmm0, 32(%rsp)	# tmp98, MEM <vector(4) int> [(int *)&work_to_do]
	call	GOMP_parallel@PLT	#
# create_and_join.c:83:   printf("main: end at %.6f\n",wall_time());
	call	wall_time	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	$2, %edi	#,
	movl	$1, %eax	#,
	leaq	.LC8(%rip), %rsi	#, tmp101
	call	__printf_chk@PLT	#
	leaq	.LC9(%rip), %rdi	#, tmp102
	call	puts@PLT	#
.L30:
	movl	0(%rbp,%rbx,4), %ecx	# MEM[(int *)&return_value + ivtmp.42_15 * 4], MEM[(int *)&return_value + ivtmp.42_15 * 4]
	movl	%ebx, %edx	# ivtmp.42, ivtmp.42
	movq	%r12, %rsi	# tmp109,
	movl	$2, %edi	#,
	xorl	%eax, %eax	#
# create_and_join.c:85:   for(int idx = 0;idx < n_threads;idx++)
	addq	$1, %rbx	#, ivtmp.42
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	call	__printf_chk@PLT	#
# create_and_join.c:85:   for(int idx = 0;idx < n_threads;idx++)
	cmpq	$4, %rbx	#, ivtmp.42
	jne	.L30	#,
# create_and_join.c:91: }
	movq	72(%rsp), %rax	# D.4802, tmp114
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp114
	jne	.L34	#,
	addq	$80, %rsp	#,
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax	#
	popq	%rbx	#
	.cfi_def_cfa_offset 24
	popq	%rbp	#
	.cfi_def_cfa_offset 16
	popq	%r12	#
	.cfi_def_cfa_offset 8
	ret	
.L34:
	.cfi_restore_state
	call	__stack_chk_fail@PLT	#
	.cfi_endproc
.LFE40:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	-400107883
	.long	1041313291
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC7:
	.long	1700000000
	.long	1600000000
	.long	1500000000
	.long	1400000000
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
