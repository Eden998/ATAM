.global _start

.section .text
_start:
	# %rcx - counter

	# %r10 - address of first show prev
	# %r11 - address of first show
	# %r12 - address of first show next

	# %r13 - address of second show prev
	# %r14 - address of second show
	# %r15 - address of second show next

	# %rsi - value of current node

	# %r8 - given value

	movq (head), %rbx
	xorq %rcx, %rcx
	movsx (Value), %r8

_loop_count_HW1:
	testq %rbx, %rbx
	jz _end_count_HW1
	cmpq (%rbx), %r8
	jne _continue_count_HW1
	incq %rcx

_continue_count_HW1:
	movq 8(%rbx), %rbx
	jmp _loop_count_HW1	

_end_count_HW1:
	cmpq $2, %rcx
	jne _end_HW1

_initialize_HW1:
	xorq %r10, %r10
	xorq %r11, %r11
	xorq %r12, %r12
	
	movq $head, %r13
	movq (head), %r14
	xorq 8(%r14), %r15

_loop_load_addresses_HW1:
	movq (%r14), %rsi
	cmpq %rsi, %r8
	jne _continue_load_HW1
	
	testq %r10, %r10
	jne _check_swap_type_HW1 # can jump because r13-r15 are already initialized
	movq %r13, %r10
	movq %r14, %r11
	movq %r15, %r12

_continue_load_HW1:
	movq %r14, %r13
	movq %r15, %r14
	movq 8(%r15), %r15
	jmp _loop_load_addresses_HW1
	

_check_swap_type_HW1:
	movq $1, %rcx
	movq $0, %rbx
	cmpq $head, %r10
	cmove %rbx, %rcx
	cmpq %r11, %r13 # first curr to second prev
	jne _regular_swap_HW1
_adjecent_swap_HW1:
	movq %r14, (%r10,%rcx,8)
	movq %r11, 8(%r14)
	movq %r15, 8(%r11)
	jmp _end_HW1

_regular_swap_HW1:
	movq %r14, (%r10,%rcx,8)
	movq %r11, 8(%r13)
	movq %r12, 8(%r14)
	movq %r15, 8(%r11)


_end_HW1:
	